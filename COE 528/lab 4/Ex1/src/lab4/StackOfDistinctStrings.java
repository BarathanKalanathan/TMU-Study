/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lab4;

/**
 *
 * @author barathankalanathan
 */
import java.util.ArrayList;

public class StackOfDistinctStrings {
    // Overview: StacksOfDistinctStrings are mutable, bounded
    // collection of distinct strings that operate in
    // LIFO (Last-In-First-Out) order.
    //
    // The abstraction function is:
    // a) Write the abstraction function here
    // AF (items) is the items stored in the stack. Also the elements that are stored in the stack in the order they were added
    // and it has the characteristics of LIFO. Also duplicate items are not allowed to be stored in stack.
    //
    //
    //
    // The rep invariant is:
    // b) Write the rep invariant here
    // RI(items) is where the items != null (not null) && elements contains only distinct strings (no duplicates are allowed)
    //
    //
    //the rep

    private ArrayList<String> items;
        // constructor

    public StackOfDistinctStrings() {
        
        // EFFECTS: Creates a new StackOfDistinctStrings object
        items = new ArrayList<String>();
    }
    
    public StackOfDistinctStrings(ArrayList<String> items) {
        
        // EFFECTS: Creates a new StackOfDistinctStrings object
        this.items = items;
    }

    public void push(String element) throws Exception {
        // MODIFIES: this
        // EFFECTS: Appends the element at the top of the stack
        // if the element is not in the stack, otherwise
        // does nothing.
        if (element == null) {
            throw new Exception();
        }
        if (false == items.contains(element)) {
            items.add(element);
        }
    }

    public String pop() throws Exception {
        // MODIFIES: this
        // EFFECTS: Removes an element from the top of the stack
                if (items.size() == 0) {
                    throw new Exception();
                }
        return items.remove(items.size() - 1);
    }
    
    public boolean repOK() {
        // EFFECTS: Returns true if the rep invariant holds for this
        // object; otherwise returns false
        // c) Write the code for the repOK() here
        for (int i = 0; i<items.size()-1; i++){
            for (int k = (i+1); k<items.size(); k++){
                if(k < items.size() && i< items.size() && items.get(i).equals(items.get(k)))
                    return false;
            }
        }         
        for (String item : items) {
            if (item != null)
                return true;
        }
            if (items.size() == items.size()-1){
                return true;
        }
        return false;
    }

    public String toString() {
        // EFFECTS: Returns a string that contains the strings in the
        // stack and the top element. Implements the
        // abstraction function.
        // d) Write the code for the toString() here
        String results = "";
        for(String String: items) {
            results += String;
        }
        return results;
    }
}
