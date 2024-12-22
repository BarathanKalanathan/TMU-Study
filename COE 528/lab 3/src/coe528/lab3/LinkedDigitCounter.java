/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package coe528.lab3;

/**
 *
 * @author barathankalanathan
 */
public class LinkedDigitCounter extends AbstractCounter {
    
    private Counter leftNeighbor = null;
   
    LinkedDigitCounter(Counter leftNeighbor)
    {
        this.leftNeighbor = leftNeighbor;
    }
    
    @Override
    public void decrement() {
        
        if(value >0) {
            value = --value;
        }
        
        else {
            value =9;
            leftNeighbor.decrement();
        }
    }
    @Override
    
    public void increment() {
        if(value <= 8) {
            value = ++value;
        }
        
        else {
            value =0;
            leftNeighbor.increment();
        }
    }    
}
