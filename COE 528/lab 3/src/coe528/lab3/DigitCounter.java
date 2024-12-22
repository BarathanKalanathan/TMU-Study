/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package coe528.lab3;

/**
 *
 * @author barathankalanathan
 */
public class DigitCounter extends AbstractCounter {
    
    @Override
    public void decrement() 
    {
        if(value >= 1)
        {
            value = --value;
        }
        else
        {
            value = 9;
        }
    }

    @Override
    public void increment() {
        if (value <= 8) {
            value = ++value;
        }
        
        else {
            value=0;
        }
    }  

}
