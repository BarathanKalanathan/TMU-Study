/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package coe528.lab3;

/**
 *
 * @author barathankalanathan
 */
public abstract class AbstractCounter implements Counter {
    
     protected int value;
     
        @Override
            public String count(){
               return String.valueOf(value);
            }
           
        @Override
            public void reset(){
                value = 0;
            }
}
    
    