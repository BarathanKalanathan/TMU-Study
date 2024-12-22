/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package lab2;
import java.util.Arrays;

/**
 *
 * @author barathankalanathan
 */
public class AnnagramChecker {
    //Requires: Two strings (The two words to be checked) put into the areAnagrams method
    //Modifies: Nothing
    //Effects: Determines if the two strings are anagrams or not, the program would return true if it an anagram and false if it is not an annagram. 
       
    public static boolean areAnagrams(String word1, String word2){
        
        if (word1.length() != word2.length()) {
            return false;
        }
        
            char[] x1 = word1.toCharArray();
            char[] x2 = word2.toCharArray();
            Arrays.sort(x1);
            Arrays.sort(x2);
            return Arrays.equals(x1, x2);
    }
    
    
    public static void main (String [] args){
        
        if (args.length==1){
            if(args[0].equals("1"))
                System.out.println(areAnagrams("listen", "silent"));
            else if (args[0].equals("2"))
                System.out.println(areAnagrams("abc","cab"));
            else if (args[0].equals("3"))
                System.out.println(areAnagrams("Dormitory", "Dirty room"));
            
        }
        System.out.println(areAnagrams("listen", "silent"));
        System.out.println(areAnagrams("abc","cab"));
        System.out.println(areAnagrams("Dormitory", "Dirty room"));
    }
}
