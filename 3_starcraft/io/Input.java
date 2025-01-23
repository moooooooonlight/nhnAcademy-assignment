package io;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Random;
import java.util.StringTokenizer;

import atrribute.FlyAttakable;
import atrribute.Flyable;
import player.Player;
import species.Protos;
import species.Species;
import species.Terran;
import species.Zerg;


public class Input {
    private  BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    private  StringTokenizer st;

    private  Species mySpecies;
    private  Player myPlayer;
    private  Species computerSpecies;
    private  Player computerPlayer;

    
    public void selectSpecies(){

        while(true){
            System.out.print("내 종족을 결정하세요(0: terran, 1: protos, 2: zerg) : ");
            try {
                int myspeciesNo = Integer.parseInt(br.readLine());        
                if(myspeciesNo == 0){
                    mySpecies = new Terran();
                    myPlayer = new Player(5, mySpecies);
                }else if(myspeciesNo == 1){
                    mySpecies = new Protos();
                    myPlayer = new Player(4, mySpecies);
                }else if(myspeciesNo == 2){
                    mySpecies = new Zerg();
                    myPlayer = new Player(8, mySpecies);
                }else{
                    System.out.println("종족 범위를 벗어났습니다, 다시 입력하세요.");
                    continue;
                }
            
            } catch (Exception e) {
                System.out.println("잘 못된 입력값 입니다, 다시 입력하세요.");
                continue;
            }
            break;
        }
        Random random = new Random();
        int computerSpeciesNo = random.nextInt(3);
        if(computerSpeciesNo == 0){
            computerSpecies = new Terran();
            System.out.println();
            computerPlayer = new Player(5, computerSpecies);
        }else if(computerSpeciesNo == 1){
            computerSpecies = new Protos();
            computerPlayer = new Player(4, computerSpecies);
        }else{
            computerSpecies = new Zerg();
            computerPlayer = new Player(8, computerSpecies);
        }
    }

    public void printState(){
        System.out.println("적군 : "+computerSpecies.getsetSpeciesName());
        for(int i=0;i<computerPlayer.getUnits().size();i++){
            if(computerPlayer.getUnits().get(i).getDefencePower()<=0) continue;
            System.out.println(computerPlayer.getUnits().get(i).getNo()+"."+computerPlayer.getUnits().get(i).toString());
        }
        System.out.println("\n아군 : "+mySpecies.getsetSpeciesName());
        for(int i=0;i<myPlayer.getUnits().size();i++){
            if(myPlayer.getUnits().get(i).getDefencePower()<=0) continue;
            System.out.println(myPlayer.getUnits().get(i).getNo()+"."+myPlayer.getUnits().get(i).toString());
        }
    }

    public void myAttack(){
        int myAttackNo;
        int computerAttackNo;
        while(true){
            System.out.print("\n상대 유닛과 공격할 유닛을 입력하십시오(내 유닛, 상대 유닛) : ");
            st = new StringTokenizer(br.readLine());
            try {
                myAttackNo = Integer.parseInt(st.nextToken());
                computerAttackNo = Integer.parseInt(st.nextToken());   
            } catch (Exception e) {
                System.out.println("잘 못된 입력값 입니다.");
                printState();
                continue;
            }
            
            if(myAttackNo>=myPlayer.getSize() || computerAttackNo>=computerPlayer.getSize()){
                System.out.println("유닛 범위를 벗어났습니다.");
                printState();
                continue;
            }

            if(computerPlayer.getUnits().get(computerAttackNo).getDefencePower()<=0) continue;


            // 공격 불가 확인해줘야함

            computerPlayer.getUnits().get(computerAttackNo).getDefencePower()
                -=myPlayer.getUnits().get(myAttackNo).getAttackPower();
            break;
        } 
    }

    public boolean myFinishCheck(){
        boolean check = true;
        for(int i=0;i<computerPlayer.getSize();i++){
            if(computerPlayer.getUnits().get(i).getDefencePower()>0){
                check = false;
                break;
            }
        }
        return check;
    }

    public static void computerAttack(){
        int myAttackNo;
        int computerAttackNo;
        Random random = new Random();

        while(true){
            myAttackNo = random.nextInt(myPlayer.getSize());
            computerAttackNo = random.nextInt(computerPlayer.getSize());

            boolean canAttack = false;
            for(int i=0;i<computerPlayer.getSize();i++){
                if(computerPlayer.getUnits().get(i).getDefencePower()>0){
                    for(int j=0;j<myPlayer.getSize();j++){
                        if(myPlayer.getUnits().get(j).flyable==1){
                            if(computerPlayer.getUnits().get(j).flyAttackable==1){
                                canAttack = true;
                                i = computerPlayer.getSize();
                                break;
                            }
                        }else{
                            canAttack = true;
                            i = computerPlayer.getSize();
                            break;
                        }
                    }
                }
            }
            if(!canAttack){
                System.out.println("공격 불가");
                printState();
                break;
            }
            
            if(myPlayer.getUnits().get(myAttackNo).getDefencePower()<=0) continue;


            myPlayer.getUnits().get(myAttackNo).getDefencePower()
                -=computerPlayer.getUnits().get(computerAttackNo).getAttackPower();
            break;
        }
    }

    public boolean computerFinishCheck(){
        boolean check = true;
        for(int i=0;i<myPlayer.getSize();i++){
            if(myPlayer.getUnits().get(i).getDefencePower()>0){
                check = false;
                break;
            }
        }      
    }
    
}
