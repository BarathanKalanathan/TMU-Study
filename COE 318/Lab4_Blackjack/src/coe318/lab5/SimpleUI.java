/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package coe318.lab5;

/**
 *
 * @author barathankalanathan
 */
package coe318.lab5;

import java.util.Scanner;

public class SimpleUI implements UserInterface {
    private BlackjackGame game;
    private Scanner user = new Scanner(System.in);

  @Override
    public void setGame(BlackjackGame game) {
        this.game = game;
    }

  @Override
    public void display() {
        System.out.println("House Holds: \n="+this.game.getHouseCards().toString());
        System.out.println("You Hold: \n="+this.game.getYourCards().toString());        
//FIX THIS
    }

  @Override
    public boolean hitMe() {
        System.out.print("Another Card? (Enter yes or no)");//FIX THIS
        String answer=user.next();
        return answer.equals("yes");
        //FIX THIS
    }

  @Override
    public void gameOver() {
        
        int playerscore=game.score(game.getYourCards());
        int housescore=game.score(game.getHouseCards());
        System.out.println("Game Over");
        System.out.println("Your Score: "+playerscore);
        System.out.println("House Score: " +housescore);
        
      
       System.out.println("House Score: "+housescore+", Your Score "+playerscore);
       if((playerscore>housescore||housescore>21)&&(playerscore<=21))
       {
           System.out.println("You Win");
           
       }
       else{
           System.out.println("House Wins");
       }
       System.out.println("Game Over");
        //FIX THIS
    }

}
