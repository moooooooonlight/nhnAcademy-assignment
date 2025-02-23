package org.main.httpStatus;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Objects;

public class HttpStatusResponse {
    private static String CRLF = "\r\n";


    public static String http404Response(){
        StringBuffer tmp = new StringBuffer();
        tmp.append(String.format("HTTP/1.1 404 Not Found%s",CRLF));
        tmp.append(String.format("Content-Type: text/plain; charset=UTF-8%s",CRLF));
        tmp.append(String.format("Bad Request%s%s",CRLF,CRLF));
        return tmp.toString();
    }
    public static String http403Response(){
        StringBuffer tmp = new StringBuffer();
        tmp.append(String.format("HTTP/1.1 403 Forbidden%s",CRLF));
        tmp.append(String.format("Content-Type: text/plain; charset=UTF-8%s",CRLF));
        tmp.append(String.format("Bad Request%s%s",CRLF,CRLF));
        return tmp.toString();
    }
    public static String httpResponseMessage(String responseData){
        StringBuffer response = new StringBuffer();
        response.append(String.format("HTTP/1.1 200 OK%s",CRLF));
        response.append(String.format("Content-Type: text/html; charset=UTF-8%s", CRLF));
        response.append(String.format("Content-Length: %d%s%s", responseData.length()+10, CRLF, CRLF));
        response.append(responseData);
        response.append(CRLF + CRLF);
        return response.toString();
    }
    public static String htmlForm(String htmlFileList){
        StringBuffer tmpHtml = new StringBuffer();
        tmpHtml.append("<html>").append(CRLF);
        tmpHtml.append("    <head>").append(CRLF);
        tmpHtml.append("    </head>").append(CRLF);
        tmpHtml.append("    <body>").append(CRLF);
        tmpHtml.append("        <h3>디렉토리 목록</h3>").append(CRLF);
        tmpHtml.append(htmlFileList);
        tmpHtml.append("    </body>").append(CRLF);
        tmpHtml.append("</html>").append(CRLF);
        return tmpHtml.toString();
    }


    /**
     *
     * @param filePath , requestURi, ex) /index.html
     * @return String , index.html 파일을 읽고 String으로 반환
     * @throws IOException
     * -> chat gpt 코드...
     */
    public static String tryGetBodyFromFile(String filePath) throws IOException {
        StringBuilder responseBody = new StringBuilder();

        File file = new File(filePath);
        if (!file.exists() || !file.isFile()) {
            throw new FileNotFoundException("파일을 찾을 수 없습니다: " + filePath);
        }

        try (BufferedReader reader = Files.newBufferedReader(Paths.get(file.getAbsolutePath()), StandardCharsets.UTF_8)) {
            String line;
            while ((line = reader.readLine()) != null) {
                responseBody.append(line).append("\n");
            }
        }
        return responseBody.toString();
    }

}
