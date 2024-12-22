/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package coe528.lab3;

/**
 *
 * @author barathankalanathan
 */
public class Odometer implements Counter{
    
    private int numDigit; 
    private Counter digit[]; 
    
    Odometer(int n){
            
        this.numDigit = n;  
        
        if (n < 1) {
            throw new IllegalArgumentException("Number of digits must be greater than 1 or equal to one");
        }
        
        digit = new Counter[n];
        digit[0] = new DigitCounter();

        for(int i = 1; i <n ; i++) {
            digit[i] = new LinkedDigitCounter(digit[i-1]);
        }
    }

    @Override
    public String count(){
        
        String x;
        x = "";
        
        for(int i=0; i < numDigit; i++) {
            
            if(digit[i].count().equals("0")) {
       
                x = x + "0";
            }
            
            else {
                
                x = x + digit[i].count();
            }
        }
        return x;
    }
    
    @Override
    public void reset() {
        
        for(int i = 0; i < numDigit; i++) {
            
            digit[i].reset();
        }
    }  
    
    public void decrement() {
        
        digit[numDigit-1].decrement();
    } 

    @Override
    public void increment() {
       
        digit[numDigit-1].increment();
    }
     
}
