package controller;

import java.util.StringTokenizer;

import atrribute.FlyAttakable;
import atrribute.Flyable;
import io.Input;

public class Controller {
    public void run(){
        Input input = new Input();
        input.selectSpecies();
        input.printState();


        // game losic
        while(true){
            input.printState();

            // 나의 공격 (내 유닛, 상대 유닛);
            input.myAttack();
            
            // 종료 조건 확인
            if(input.myFinishCheck()){
                System.out.println("승리하셨습니다.");
                input.printState();
                break;
            }

            // 컴퓨터 공격
            input.computerAttack();

            // 종료 조건 확인
            if(input.computerFinishCheck()){
                System.out.println("패배하였습니다.");
                input.printState();
                break;
            }
        }
    }
}
