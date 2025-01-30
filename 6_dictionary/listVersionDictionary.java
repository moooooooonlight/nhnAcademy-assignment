import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class listVersionDictionary {
    private static String notFoundMessage = "Not Found";
    private static String inputMessage = "Enter word: ";
    private static String endSignal = "stop";
    private static String filePath = "words.txt";
    private static BufferedReader br;
    private static StringTokenizer st;
    private static ArrayList<Node> dictionary;
    private static int cnt;


    public static void main(String[] args) throws IOException{
        
        dictionary = makingDictionary();

        br = new BufferedReader(new InputStreamReader(System.in));
        System.out.print(inputMessage);
        String questionWord = br.readLine();

        String answerWord = findAnswer(questionWord);
        System.out.println(answerWord + " " + cnt);
    }    

    public static String findAnswer(String questionWord){

        for(int i=0;i<dictionary.size();i++){
            cnt++;
            if(dictionary.get(i).getEnglishWord().equals(questionWord)){
                return dictionary.get(i).getKoreanWord();
            }
        }
        return notFoundMessage;
    }

    public static ArrayList<Node> makingDictionary() throws IOException{
        ArrayList<Node> list = new ArrayList<>();

        //파일 읽기.
         FileInputStream input=new FileInputStream(filePath);
        InputStreamReader reader =new InputStreamReader(input,"UTF-8");
        br = new BufferedReader(reader);

        // 단어 읽고 dictionary에 넣어주기.
        String oneWord = "";
        String englishWord = "";
        String koreanWord = "";
        while((oneWord = br.readLine())!=null){
            st = new StringTokenizer(oneWord);
            st.nextToken();
            englishWord = st.nextToken();
            while(true){
                koreanWord += st.nextToken();

                if(st.hasMoreTokens()){
                    koreanWord+=" ";
                }
                else{
                    break;
                }
            }
            list.add(new Node(englishWord, koreanWord));
            koreanWord="";
            englishWord="";
        }

        return list;
    }

    static class Node{
        String englishWord;
        String koreanWord;

        public String getEnglishWord(){
            return this.englishWord;
        }

        public String getKoreanWord(){
            return this.koreanWord;
        }

        public Node(String englishWord, String koreanWord){
            this.englishWord = englishWord;
            this.koreanWord = koreanWord;
        }
    }
}

