import java.util.*;

 

public class RussianRoulette {

 

    public static void main(String[] arg) {

         

        Random ran = new Random();

  
        int chamber = ran.nextInt(6);

       System.out.println("Bullit is in chamber: " + (chamber+1));

        Scanner scan = new Scanner(System.in);

        System.out.print("Enter number of players: ");

        int nbPlayer = scan.nextInt();

        for(;;) {

            for(int i = 0; i < nbPlayer; i++) {

                int x = ran.nextInt(6);

                System.out.print("Spinning revolver for player: " + (i+1) + " revolver aligned to chamber " + (x+1));

                try {Thread.sleep(1000L);} catch (Exception e) {}

                System.out.println("   POW !!!");

                if(x == chamber) {
                    System.out.println("Player " + (i+1) + " is dead");

                    return;
                }

            }

        }

    }
}
