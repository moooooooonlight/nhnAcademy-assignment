package org.example;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import java.io.*;
import java.net.InetAddress;
import java.net.Socket;
import java.net.URL;
import java.util.Objects;


public class Main {

    private static Options options;
    private static String method;
    private static String url;
    private static String data;
    private static String line="";
    private static String formData;
    private static boolean optionV = false;
    private static boolean optionH = false;
    private static boolean optionD = false;
    private static boolean optionX = false;
    private static boolean optionL = false;
    private static boolean optionF = false;


    public static void main(String[] args) {
        try {
            setOptions(args);

            http(args, null);

        } catch (ParseException ignore) {
            HelpFormatter formatter = new HelpFormatter();
            formatter.printHelp(Main.class.getSimpleName(), options);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private static void http(String[] args,String path) throws IOException {
        if(args.length<1){
            throw new IOException();
        }

        // URL 객체를 사용해 호스트명 추출
        url = args[args.length - 1];
        URL urlObj = new URL(url);
        String host = urlObj.getHost();
        InetAddress address = InetAddress.getByName(host);
        if(Objects.isNull(path)){
            path = urlObj.getPath();
        }
        try (
                Socket client = new Socket(address, 80);
                BufferedReader clientIn = new BufferedReader(new InputStreamReader(client.getInputStream()));
                PrintWriter clientOut = new PrintWriter(client.getOutputStream(),false);
        ) {
            // making request
            StringBuilder request = new StringBuilder();
            StringBuffer requestHeader = new StringBuffer();
            StringBuffer requestBody = new StringBuffer();
            String requestLine = method+" "+path+" "+"HTTP/1.1";
            String requestHost = "Host:"+" "+host;
            String requestUserAgent = "User-Agent:"+" "+"curl/7.79.1";
            String requestAccept = "Accept:"+" "+"*/*";
            String requestAddition = line;
            requestHeader.append(requestLine).append("\r\n")
                    .append(requestHost).append("\r\n")
                    .append(requestUserAgent).append("\r\n")
                    .append(requestAccept).append("\r\n");
            if(optionH){
                requestHeader.append(requestAddition).append("\r\n");
            }
            if(optionF){
                String boundaryName = "----WebKitFormBoundary---";
                requestHeader.append("Content-Type: multipart/form-data; boundary="+boundaryName).append("\r\n");
                requestHeader.append("Content-Length: "+formData.length()).append("\r\n");

                requestBody.append(boundaryName).append("\r\n");
                // upload=@file_path
                String[] strs = formData.split("=");
                String name = strs[0];
                String fileName = strs[1];
                requestBody.append(String.format("Content-Disposition: form-data; name=\"%s\"; filename=\"%s\"",name,fileName)).append("\r\n");
                requestBody.append("Content-Type: text/plain").append("\r\n\r\n");
            }
            // 데이터 정제가 필요함 data: {"hello": "world"} + 해더에도 데이터 정보 추가해야함.
            if(optionD){
                requestHeader.append("Content-Length: "+data.length()).append("\r\n").append("\r\n");
                requestBody.append(data).append("\r\n");
            }else{
                requestHeader.append("\r\n");
            }

            request.append(requestHeader.toString());
            request.append(requestBody.toString());
            //System.out.println(request.toString());
            clientOut.write(request.toString());
            clientOut.flush();

            // making response
            StringBuffer response = new StringBuffer();
            StringBuffer responseHeader = new StringBuffer();
            StringBuffer responseBody = new StringBuffer();
            StringBuffer responseHeaderPrint = new StringBuffer();
            String message;
            String newUrl=null;
            while((message = clientIn.readLine())!=null){
                if(message.trim().isEmpty()) {
                    break;
                }
                if(message.contains("location")){
                    String tmp = message;
                    newUrl = tmp.replace("location: ","");
                }
                if(message.contains("Location")){
                    String tmp = message;
                    newUrl = tmp.replace("Location: ","");
                }
                responseHeader.append(message+"\r\n");
                responseHeaderPrint.append("<: " + message + "\n");
            }

            client.shutdownOutput();
            message = clientIn.readLine();
            while(message!=null){
                responseBody.append(message+"\r\n");
                message = clientIn.readLine();
            }


            // 출력담당!
            StringBuffer requestHeaderPrint = new StringBuffer();
            requestHeaderPrint.append(">: "+requestLine).append("\r\n")
                    .append(">: "+requestHost).append("\r\n")
                    .append(">: "+requestUserAgent).append("\r\n")
                    .append(">: "+requestAccept).append("\r\n");


            if(optionH){
                requestHeaderPrint.append(">: "+requestAddition).append("\r\n");
            }
            if(optionD){
                requestHeaderPrint.append(">: " + "Content-Length: " + data.length()).append("\r\n");
            }
            requestHeaderPrint.append("\r\n");

            if(optionV){
                System.out.println(requestHeaderPrint.toString());
                System.out.println(responseHeaderPrint.toString());
            }
            System.out.println(responseBody.toString());

            if(optionL){
                // 경로가 바뀐다 /redirect/1 새로운 url로 다시 request보내고 response받아야함...
                if(Objects.nonNull(newUrl)) {
                    http(args, newUrl);
                }
            }

        } catch (IOException e) {
            System.out.println("error!!!");
        }
    }


    private static void setOptions(String[] args) throws ParseException {
        options = new Options();

        options.addOption("v", null, false, "Version");
        options.addOption("H", null, true, "Header");
        options.addOption("d", null, true, "Send");
        options.addOption("X", null, true, "method");
        options.addOption("L", null, false, "30x");
        options.addOption("F", null, true, "form-data");


        CommandLineParser parser = new DefaultParser();
        CommandLine cmd = parser.parse(options, args);


        if (cmd.hasOption("v")) {
            optionV = true;
        }
        if (cmd.hasOption("H")) {
            optionH = true;
            line = cmd.getOptionValue('H');
        }
        if (cmd.hasOption("d")) {
            optionD = true;
            data = cmd.getOptionValue("d");
            method = "POST";
        }
        if (cmd.hasOption("X")) {
            optionX = true;
            method = cmd.getOptionValue("X");
        }
        if (cmd.hasOption("L")) {
            optionL = true;
        }
        if (cmd.hasOption("F")) {
            optionF = true;
            method = "POST";
            formData = cmd.getOptionValue("F");
        }
        if(Objects.isNull(method) || method.isEmpty()){
            method = "GET";
        }
    }
}
