import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class JDBJ09_001_colortokenizer{

    public static void main(String[] args) throws IOException{
        String fileName = args[0];
        String code = Files.readString(Path.of(fileName));

        File writeFile =new File("Sample.html");
        if(!writeFile.exists()){
            writeFile.createNewFile();
        }

        FileWriter fw = new FileWriter(writeFile);
        BufferedWriter bw = new BufferedWriter(fw);  

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        st = new StringTokenizer(code);
        String[] codes = code.split(" ");
        ArrayList<Token> tokens = new ArrayList<>();
        String s;
        while(st.hasMoreTokens()){
            s= st.nextToken();
            if(s.equals("public") || s.equals("private") || s.equals("protected")){
                tokens.add(new RangeToken(s));
            }
            else if(s.equals("class") || s.equals("interface")){
                tokens.add(new ClassToken(s));
            }
            else if(s.equals("{")){
                tokens.add(new OpenLineToken(s));
            }
            else if(s.equals("}")){
                tokens.add(new CloseLineToken(s));
            }
            else if(s.equals("void") || s.equals("int") || s.equals("String") || s.equals("Token")){
                tokens.add(new ReturnToken(s));
            }
            else{
                tokens.add(new GeneralToken(s));
            }
            tokens.add(new BalnkToken(" "));
        }
        
    
        
        WordTokenTransfer wordTokenTransfer = new WordTokenTransfer();
        for(Token t : tokens){
            bw.write(t.accept(wordTokenTransfer));
        }      

        bw.close();
    }
}