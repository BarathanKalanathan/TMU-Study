/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lab4;
import java.util.ArrayList;

/**
 *
 * @author barathankalanathan
 */
public class StackOfDistinctStringsTester {
    public static void main(String args[]){
        
        
        
        
        ArrayList<String> array = new ArrayList<>();
        array.add("ad");
        array.add("bc");
        array.add("ef");
        //array.add("ef");
        
        StackOfDistinctStrings test = new StackOfDistinctStrings(array);
        
        System.out.println(test.repOK());
        
    }
}
