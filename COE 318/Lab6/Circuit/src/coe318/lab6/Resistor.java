/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package coe318.lab6;

/**
 *
 * @author sranc
 */
public class Resistor
{
    private static int resistor=1;
    private int resistorID;
    private Node nodes[];
    private double resistance;
    public Resistor(double resistance, Node node1, Node node2)
    {
        if(resistance>=0)
        {
            this.resistance=resistance;
            resistor++;
            resistorID=resistor;
        }
        else
        {
            throw new IllegalArgumentException("Resistance cannot be negative");
        }
        if(node1!=null && node2!=null)
        {
            nodes[0]=node1;
            nodes[1]=node2;
        }
        else
        {
            throw new IllegalArgumentException("Invalid Node value");
        }
                
        
    }
    public Node[] getNodes()
    {
        return nodes;
    }
    public String toString()
    {
        return "R"+resistorID+" "+nodes[0]+" "+nodes[1]+" "+resistance+"Ohms";
    }
}
