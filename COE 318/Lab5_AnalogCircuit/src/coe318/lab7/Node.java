/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package coe318.lab7;

/**
 *
 * @author barathankalanathan
 */
public class Node {
    private int id;
    private static int nextId = 0;
    
    public Node(){
        this.id = this.nextId;
        this.nextId++;
    }

    @Override
    public String toString(){
        return("" + this.id);
    }
    
}
