import java.util.LinkedList;
import java.util.Queue;

public class 권용민_Maze{
    static int[][] maze = {
        {0,0,1,0,0,1,1,1,1,1},
        {1,0,0,0,1,0,1,1,1,1},
        {0,1,1,0,0,1,1,1,1,1},
        {1,0,0,0,0,1,1,1,1,1},
        {0,0,1,0,0,1,1,1,1,1},
        {1,1,1,1,0,1,1,1,1,1},
        {1,1,1,1,0,0,1,1,1,1},
        {1,1,1,1,0,0,0,1,0,1},
        {1,1,1,1,1,1,0,1,0,1},
        {1,1,1,1,1,0,0,0,0,0}};
    static boolean visited[][];
    static int[] dx = {0,0,1,-1};
    static int[] dy = {-1,1,0,0};
    static int cnt = 0, result = 0;


    public static void main(String[] args) {
        visited = new boolean[10][10];

        bfs(0,0);
    }

    private static void bfs(int x, int y){
        
        Queue<Point> queue = new LinkedList<>();
        queue.add(new Point(x, y));
        visited[x][y] = true;

        boolean check = false;
        while(!queue.isEmpty()){
            Point tmp = queue.remove();
            x = tmp.x;
            y = tmp.y;
            visited[x][y] = true;
            if(x==9 && y==9){
                System.out.printf("Pass, %d\n", cnt-1);
                check = true;
                break;
            }
            cnt++;

            for(int i=0;i<4;i++){
                int nx = x + dx[i];
                int ny = y + dy[i];
                    
                if(nx<0 || ny<0 || nx>9 || ny>9) continue;
    
                if(maze[nx][ny]==0 && !visited[nx][ny]){
                    queue.add(new Point(nx, ny));
                }
            }
        }
        if(!check){
            System.out.printf("Fail, %d\n", cnt-1);
        }
    }

    static class Point{
        int x;
        int y;
        
        private Point(int x, int y){
            this.x = x;
            this.y = y;
        }
    }
}

