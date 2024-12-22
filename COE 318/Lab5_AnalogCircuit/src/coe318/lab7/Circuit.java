/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package coe318.lab7;
import java.util.ArrayList;
/**
 *
 * @author barathankalanathan
 */
public class Circuit {
    private static Circuit instance = null;
    private ArrayList<Battery> batteries;
    private ArrayList<Resistor> res;
    
    
    public static Circuit getInstance(){
        if(instance == null){
            instance = new Circuit();
        }
        return instance;
    }
    
    private Circuit(){
        batteries = new ArrayList<Battery>();
        res = new ArrayList<Resistor>();
        
    }
    
    public void addBattery(Battery b){
        this.batteries.add(b);
    }
    
    
    public void addResistor(Resistor r){
        this.res.add(r);
    }
    
    
    
    @Override
    public String toString(){
        String a = "";
        for(Resistor r : res){
            a = a + r + "\n";
        }
        for(Battery b : batteries){
            a = a + b + "\n";
        }
        return(a);
    }
    
    public static void main(String[] args) {
        // TODO code application logic here
    }
    
}
