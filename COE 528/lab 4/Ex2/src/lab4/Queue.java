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

public class Queue<Integer> {
    private ArrayList<Integer> items;
  
    public Queue() {
        items = new ArrayList<Integer>();
    }
    
    public void enqueue(Integer element) {
        items.add(element);
    }
    
    public Integer dequeue() {
        if (isEmpty()) {
            throw new IllegalStateException("Queue is empty and cannot dequeue an empty array");
        }
        return items.remove(0);
    }
    public boolean repOK(){
        
        if (items.isEmpty()) {
            return false;
        }
        
//        if (items.size() == 1){
//            return true;
//        }
//        
//        for (int i = 0; i<items.size()-1; i++){
//            for (int k = 0; k<items.size(); k++){
//                if (items.get(i).equals(items.get(k))){
//                    return false;
//                }
//            }
//        }
        return true;
    }
    
    public boolean isEmpty() {
        return items.isEmpty();
    }
    
    public String toString(){
        String finalArray = "[ ";
        for (int i = 0; i<items.size(); i++){
            finalArray += items.get(i);
            if (i < items.size()-1){
                finalArray += ", ";
            }
        }
        finalArray += "]";
        return finalArray;
    }
    
}


