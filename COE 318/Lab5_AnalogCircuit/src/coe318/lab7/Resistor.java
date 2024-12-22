/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package coe318.lab7;

/**
 *
 * @author barathankalanathan
 */
public class Resistor {
    private double res;
    private Node node1;
    private Node node2;
    private int idNum;
    private static int nextIdNum = 1;
    
    public Resistor(Node node1, Node node2, double res){
        this.res = res;
        this.node1 = node1;
        this.node2 = node2;
        this.idNum = this.nextIdNum;
        this.nextIdNum++;
        
        if(res <= 0){
            throw new IllegalArgumentException("Resistance can not be zero or lower.");
        }
        Circuit cir = Circuit.getInstance();
        cir.addResistor(this);
    }
    
    
    public Node[] getNodes(){
        Node[] nodes = {this.node1, this.node2};
        return(nodes);
    }
    
    @Override
    public String toString(){
        return("R" + this.idNum + " " + this.node1 + " " + this.node2 + " " + this.res);
    }
    
}
