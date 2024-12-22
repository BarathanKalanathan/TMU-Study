/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ex1;

/**
 *
 * @author barathankalanathan
 */
public class Ex1 {

    //Requires: 2 integer arrays a and b that is not null which has at least one element. Requires 2 integer variables for max of a and max of b.  
    //Modifies: b 
    //Effects:  Determines the greatest value of a and the greatest value of b and switches the greatest value of b with the greatest value of a. 
    
    public static void substituteMax(int[] a, int[] b) {
            int maxOfA = a[0];
            int index = 0;
        
        for (int i = 0; i < a.length; i++) {
        if(a[i] > maxOfA) {
            maxOfA = a[i];
            index = i;
            }
        }

        
        int maxOfB = b[0];
        for (int i = 0; i < b.length; i++) {
            
            if(b[i] > maxOfB) {
                maxOfB = b[i];
            }
        }

        a[index] = maxOfB;
    }
    
}
