/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package coe318.lab6;
import java.util.ArrayList;

/**
 *
 * @author sranc
 */
public class Circuit 
{
    private static Circuit instance=null;
    ArrayList<Resistor>resistor;
    public static Circuit getInstance()
    {
        if(instance==null)
        {
            instance=new Circuit();
        }
        return instance;
    }
    private Circuit()
    {
        resistor=new ArrayList<Resistor>();
    }
    
    public void add(Resistor r)
    {
        resistor.add(r);
        
    }
    public String toString()
    {
        String linesperate="";
        for(int i=0;i<resistor.size();i++)
        {
            linesperate+=resistor.toString()+"\n";
        }
        return linesperate;
        
    }
            
    
}
