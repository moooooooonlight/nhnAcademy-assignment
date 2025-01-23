import java.util.Random;
import java.util.Scanner;

public class JBDJ09_001_Tictactoe {
    static Scanner scanner;
    static int[][] bingGo;
    public static void main(String[] args) {
        scanner = new Scanner(System.in);
        bingGo = new int[4][4];


        while(true){
            //user
            userOrder();
            printBingGo();

            // computer
            computerOrder();
            printBingGo();
        }
    }
    public static void computerOrder(){
        Random random = new Random();
        int x = random.nextInt(2)+1;
        int y = random.nextInt(2)+1;
        while(true){
            if(inputCheck(x,y,2)){
                bingGo[x][y] = 2;
                if(bingGoCheck()){
                    printBingGo();
                    System.out.println("Computer Win");
                    scanner.close();
                    System.exit(0);
                }
                break;
            }else{
                x = random.nextInt(3)+1;
                y = random.nextInt(3)+1;
            }
        }
    }

    public static void userOrder(){
        System.out.print("Enter your point: ");
        int x = scanner.nextInt();
        int y = scanner.nextInt();

        while(true){
            if(inputCheck(x,y,1)){
                bingGo[x][y] = 1;
                if(bingGoCheck()){
                    printBingGo();
                    System.out.println("You Win");
                    scanner.close();
                    System.exit(0);
                }
                break;
            }else{
                System.out.print("Enter your point: ");
                x = scanner.nextInt();
                y = scanner.nextInt();
            }
        }
    }

    
    public static boolean bingGoCheck(){

        boolean check = true;
        int x = bingGo[1][1];
        if(x==0) check = false;
        int y;
        for(int k=1;k<=3;k++){
            y = bingGo[1][k];
            if(x!=y){
                check = false;
            }
        }
        if(check) return true;

        check = true;
        if((x = bingGo[2][1])==0) check = false;
        for(int k=1;k<=3;k++){
            y = bingGo[2][k];
            if(x!=y){
                check = false;
            }
        }
        if(check) return true;

        check = true;
        if((x = bingGo[3][1])==0) check = false;
        for(int k=1;k<=3;k++){
            y = bingGo[3][k];
            if(x!=y){
                check = false;
            }
        }
        if(check) return true;

        check = true;
        if((x = bingGo[1][1])==0) check = false;
        for(int k=1;k<=3;k++){
            y = bingGo[k][1];
            if(x!=y){
                check = false;
            }
        }
        if(check) return true;

        check = true;
        if((x = bingGo[1][2])==0) check = false;
        for(int k=1;k<=3;k++){
            y = bingGo[k][2];
            if(x!=y){
                check = false;
            }
        }
        if(check) return true;

        check = true;
        if((x = bingGo[1][3])==0) check = false;
        for(int k=1;k<=3;k++){
            y = bingGo[k][3];
            if(x!=y){
                check = false;
            }
        }
        if(check) return true;


        check = true;
        if((x = bingGo[1][1])==0) check = false;
        for(int k=1;k<=3;k++){
            y = bingGo[k][k];
            if(x!=y){
                check = false;
            }
        }
        if(check) return true;

        check = true;
        if((x = bingGo[1][3])==0) check = false;
        for(int k=1;k<=3;k++){
            y = bingGo[k][4-k];
            if(x!=y){
                check = false;
            }
        }
        if(check) return true;

        return false;
    }

    public static boolean inputCheck(int x, int y,int i){

        try {
            if(x>3 || y>3 || x<1 || y<1) 
                throw new Exception();
       
            boolean isFull = false;
            for(int j=1;j<=3;j++){
                for(int k=1;k<=3;k++){
                    if(bingGo[j][k]==0){
                        isFull = true;
                    }
                }
            }
            if(!isFull){
                System.out.println("game finish");
                scanner.close();
                System.exit(0);
            }
    
            if(bingGo[x][y]==0){
                return true;
            }else {
                throw new Exception();
            }   
        } catch (Exception e) {
            if(i==1)
                System.out.println("Wrong input!");
            return false;
        }
    }

    public static void printBingGo(){
        System.out.println();
        for(int i=1;i<=3;i++){
            for(int k=1;k<=3;k++){
                if(bingGo[i][k]==1){
                    System.out.print(" O ");
                }else if(bingGo[i][k]==2){
                    System.out.print(" X ");
                }else {
                    System.out.print("   ");
                }
                if(k!=3)
                    System.out.print("|");
            }
            System.out.println();
            if(i!=3)
                System.out.println("-----------");
        }
    }
}