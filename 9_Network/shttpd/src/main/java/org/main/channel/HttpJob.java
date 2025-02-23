package org.main.channel;

import lombok.extern.slf4j.Slf4j;
import org.main.httpStatus.HttpStatusResponse;

import java.io.*;
import java.net.Socket;
import java.security.cert.CRL;
import java.util.Objects;

@Slf4j
public class HttpJob implements Executable {
    private final Socket client;
    private final String CRLF = "\r\n";
    private static final String DOCUMENT_ROOT = System.getProperty("user.dir");
    private static final String FILE_UPLOAD_ROOT =  System.getProperty("user.dir")+"/resources";


    public HttpJob(Socket client){
        if(Objects.isNull(client)){
            throw new IllegalArgumentException();
        }
        this.client = client;
    }

    @Override
    public void execute() throws IOException {
        try (
                BufferedReader clientIn = new BufferedReader(new InputStreamReader(client.getInputStream()));
                BufferedWriter clientOut = new BufferedWriter(new OutputStreamWriter(client.getOutputStream()))
        ) {

            String requestLine = clientIn.readLine();
            log.debug("request={}",requestLine);

            if(Objects.nonNull(requestLine) && requestLine.startsWith("GET /")){
                String[] attributes = requestLine.split(" ");
                String rootPath = attributes[1];
                File rootDir = new File(DOCUMENT_ROOT+rootPath);
                if(!rootDir.exists()){
                    clientOut.write(HttpStatusResponse.http404Response());
                    clientOut.flush();
                }
                else if(!rootDir.canRead()){
                    clientOut.write(HttpStatusResponse.http403Response());
                    clientOut.flush();
                }
                else if(false){
                    // 현재 위치보다 상위 타입을 요청할때???
                }
                else if(rootDir.isFile()){
                    String encodingBody = HttpStatusResponse.tryGetBodyFromFile(DOCUMENT_ROOT + rootPath);
                    clientOut.write(HttpStatusResponse.httpResponseMessage(encodingBody));
                    clientOut.flush();
                }
                else{
                    File[] rootFiles = rootDir.listFiles();
                    StringBuffer htmlFileList = new StringBuffer();

                    for(File file : rootFiles){
                        if(rootPath.endsWith("/")) htmlFileList.append("<li><a href=").append(rootPath+file.getName()).append(">").append(file.getName()).append("</li>").append(CRLF);
                        else htmlFileList.append("<li><a href=").append(rootPath+"/"+file.getName()).append(">").append(file.getName()).append("</li>").append(CRLF);
                    }

                    String responseData = HttpStatusResponse.htmlForm(htmlFileList.toString());
                    clientOut.write(HttpStatusResponse.httpResponseMessage(responseData));
                    clientOut.flush();
                }
            }
            else if(Objects.nonNull(requestLine) && requestLine.startsWith("POST /")){
                // post한 데이터를 읽어서 저장해야함!!!
                String[] attributes = requestLine.split(" ");
                String rootPath = attributes[1];
                File rootDir = new File(DOCUMENT_ROOT+rootPath);
            }
            else{
                clientOut.write(HttpStatusResponse.http404Response());
                clientOut.flush();
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}



















