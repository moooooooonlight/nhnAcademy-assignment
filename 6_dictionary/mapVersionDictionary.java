import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.StringTokenizer;

public class mapVersionDictionary {
    private static String inputMessage = "Enter word: ";
    private static String endSignal = "stop";
    private static String filePath = "words.txt";
    private static BufferedReader br;
    private static StringTokenizer st;
    private static Map<String , String> dictionary;


    public static void main(String[] args) throws IOException{
        
        makingDictionary();
        br = new BufferedReader(new InputStreamReader(System.in));
        System.out.print(inputMessage);
        String questionWord = br.readLine();
        String anwerWord = dictionary.get(questionWord);
        System.out.println(anwerWord);
    }    

    public static void makingDictionary() throws IOException{
        dictionary = new HashMap<>();

        //파일 읽기.
        FileInputStream input=new FileInputStream(filePath);
        InputStreamReader reader =new InputStreamReader(input,"UTF-8");

        br = new BufferedReader(reader);

        // 단어 읽고 dictionary에 넣어주기.
        String oneLine = "";
        String englishWord = "";
        String koreanWord = "";
        while((oneLine = br.readLine())!=null){
            st = new StringTokenizer(oneLine);
            st.nextToken();
            while(st.hasMoreTokens()){
                String tmp = st.nextToken();
                char[] temp = new char[tmp.length()];
                temp = tmp.toCharArray();
                if(temp[0]>='a' && temp[0]<='z'){
                    englishWord += tmp;
                    englishWord+=" ";
                }else{
                    koreanWord+=tmp;
                    break;
                }
            }
            while(st.hasMoreTokens()){
                String tmp = st.nextToken();
                koreanWord += tmp;
                koreanWord+=" ";
            }
            dictionary.put(englishWord, koreanWord);
            koreanWord="";
            englishWord="";
        }
    }
}
