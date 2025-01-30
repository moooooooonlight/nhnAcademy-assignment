package rule;

import java.util.ArrayList;
import java.util.LinkedList;

import game.PokerCard;
import game.PokerPlayer;

public class CFullHouse extends Rule{
    int rank;
    int cnt;
    boolean[] visit;
    boolean check;
    LinkedList<PokerCard> victory;
    
    public CFullHouse(){
        this.setRank(3);
        this.setRuleName("fullHouse");
    }

    @Override
    public boolean rule(PokerPlayer p) {
        // 숫자가 같은 카드 3장
        ArrayList<PokerCard> list = p.getCards();
        visit = new boolean[list.size()];
        victory = new LinkedList<>();
        cnt = 1;
        for(int i=1;i<list.size();i++){
            rank = list.get(i).getRank(); // 기준
            visit[i] = true;
            victory.add(list.get(i));
            threeOfAKind(list, cnt+1, rank, i);
            if(check) break;
            victory.remove();
            visit[i] = false;
        }
        if(check){
            p.setVictory(victory);
            return true;
        } 
        return false;
    }
    public void threeOfAKind(ArrayList<PokerCard> list, int cnt, int rank, int i){
        if(cnt == 3){
            if(pair(list)){
                check = true;
            }
            return ;
        }
        for(int j=i+1;j<list.size();j++){
            if(rank == list.get(j).getRank()){
                visit[j] = true;
                victory.add(list.get(j));
                threeOfAKind(list,cnt+1, rank, j);
                if(check) return;
                victory.remove();
                visit[j] = false;       
            }
        }
    }

    public boolean pair(ArrayList<PokerCard> list){
        for(int i=1;i<list.size();i++){
            if(visit[i]) continue;

            rank = list.get(i).getRank();
            
            for(int j=i+1;j<list.size();j++){
                
                if(visit[j]==true) continue;

                if(rank == list.get(j).getRank()){
                    victory.add(list.get(i));
                    victory.add(list.get(j));
                    return true;
                }
            }
        }
        return false;
    }
}
