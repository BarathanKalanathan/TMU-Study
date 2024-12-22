/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package coe318.lab7;
import java.util.Scanner;
import java.util.ArrayList;
/**
 *
 * @author barathankalanathan
 */
public class UserMain {
    public static void main(String[] args){
        String input;
        String[] space;
        Node node1 = new Node();
        ArrayList<Object> cirComponents= new ArrayList<Object>();
        ArrayList<Node> existingNodes = new ArrayList<Node>();
        existingNodes.add(node1);
        Circuit cir = Circuit.getInstance();
        
        Scanner scan = new Scanner(System.in);
        System.out.println("Please enter your circuit then spice for output and end to close the program");
        
        do{
            input = scan.nextLine();
            space = input.split(" ");
            //if(space.length == 4||space.length == 1){
                if(space[0].equals("v") && space.length == 4){
                    if(Integer.parseInt(space[1]) < existingNodes.size() && Integer.parseInt(space[2]) == existingNodes.size()){
                        Node newNode  = new Node();    
                        existingNodes.add(newNode);
                        Battery b = new Battery(existingNodes.get(Integer.parseInt(space[1])), newNode, Double.parseDouble(space[3]));
                        cirComponents.add(b);        
                    }
                    else if(Integer.parseInt(space[1]) == existingNodes.size() && Integer.parseInt(space[2]) < existingNodes.size()){
                        Node newNode  = new Node();    
                        existingNodes.add(newNode);
                        Battery b = new Battery(newNode, existingNodes.get(Integer.parseInt(space[2])), Double.parseDouble(space[3]));
                        cirComponents.add(b); 
                    }
                    else if(Integer.parseInt(space[1]) < existingNodes.size() && Integer.parseInt(space[2]) < existingNodes.size()){
                        Battery b = new Battery(existingNodes.get(Integer.parseInt(space[1])), existingNodes.get(Integer.parseInt(space[2])), 
                                Double.parseDouble(space[3]));
                        cirComponents.add(b);
                    }
                        else{
                            System.out.println("Invalid input.");
                        }
                    }
                else if(space[0].equals("r") && space.length == 4){
                    if(Integer.parseInt(space[1]) < existingNodes.size() && Integer.parseInt(space[2]) == existingNodes.size()){
                        Node newNode  = new Node();    
                        existingNodes.add(newNode);
                        Resistor r = new Resistor(existingNodes.get(Integer.parseInt(space[1])), newNode, Double.parseDouble(space[3]));
                        cirComponents.add(r);        
                    }
                    else if(Integer.parseInt(space[1]) == existingNodes.size() && Integer.parseInt(space[2]) < existingNodes.size()){
                        Node newNode  = new Node();    
                        existingNodes.add(newNode);
                        Resistor r = new Resistor(newNode, existingNodes.get(Integer.parseInt(space[2])), Double.parseDouble(space[3]));
                        cirComponents.add(r); 
                    }
                    else if(Integer.parseInt(space[1]) < existingNodes.size() && Integer.parseInt(space[2]) < existingNodes.size()){
                        Resistor r = new Resistor(existingNodes.get(Integer.parseInt(space[1])), existingNodes.get(Integer.parseInt(space[2])), 
                                Double.parseDouble(space[3]));
                        cirComponents.add(r);  
                    }
                     
                    else{
                        System.out.println("Invalid input.");
                    }
                }
                else if(space[0].equals("spice") && space.length == 1){
                    for(Object a : cirComponents){
                        System.out.println(a);
                    }
                }
                else if(space[0].equals("end") && space.length == 1){
                    System.out.println("All Done");
                }
                else{
                    System.out.println("Invalid input.");
                }
           // }
            //else{
               // System.out.println("Invalid input.");
            //}
        } while(!input.equalsIgnoreCase("end"));
    }
}