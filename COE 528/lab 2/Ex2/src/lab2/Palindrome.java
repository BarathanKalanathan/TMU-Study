/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package lab2;

/**
 *
 * @author barathankalanathan
 */
public class Palindrome {

        //Requires: A string that contains a word
        //Modifies: none
        //Effects: eturns if the word is a palindrome or not a palindrome

    
    public static boolean isPalindrome(String a) {
        if (a == null || a.equals("")) {
            return false;
        }

        String rev = "";
        int length = a.length();

        for (int i = length - 1; i >= 0; i--) {
            rev = rev + a.charAt(i);
        }

        return a.equals(rev);
    
    }
 

    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        if(args.length == 1) {
            if (args[0].equals("1"))
                System.out.println(isPalindrome(null));
            else if (args[0].equals("2"))
                System.out.println(isPalindrome(""));
            else if (args[0].equals("3"))
                System.out.println(isPalindrome("deed"));
            else if (args[0].equals("4"))
                System.out.println(isPalindrome("abcd"));
        }
        //if (args[0].equals("1"))
                System.out.println(isPalindrome(null));
                System.out.println(isPalindrome(""));
                System.out.println(isPalindrome("deed"));
                System.out.println(isPalindrome("abcd"));
    }
    
}
