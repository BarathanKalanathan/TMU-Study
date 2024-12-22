/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package coe318.lab6;

/**
 *
 * @author sranc
 */
public class Node 

{
    private static int node=0;
    private int nodeId;
    public Node()
    {
        nodeId=node;
        node++;
    }
    public String toString()
    {
        return Integer.toString(nodeId);
        
    }
    public int getnodenumber()
    {
        return node;
    }
    
    
    
}
