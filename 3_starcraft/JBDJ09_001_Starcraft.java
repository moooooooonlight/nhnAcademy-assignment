import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Random;
import java.util.StringTokenizer;

import atrribute.FlyAttakable;
import atrribute.Flyable;
import controller.Controller;
import io.Input;
import player.Player;
import species.Protos;
import species.Species;
import species.Terran;
import species.Zerg;

public class JBDJ09_001_Starcraft {
    
    private static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    private static StringTokenizer st;

    private static Species mySpecies;
    private static Player myPlayer;
    private static Species computerSpecies;
    private static Player computerPlayer;

    public static void main(String[] args) throws IOException {
        
        Controller controller = new Controller();
        controller.run();
    }
}
