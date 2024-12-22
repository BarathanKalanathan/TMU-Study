package coe528.lab1;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author barathankalanathan
 */
public class Member extends Passenger {
    int yearsOfMembership;
    
    public Member (String name, int age, int yearsOfMembership) {
        super (name,age);
        this.yearsOfMembership = yearsOfMembership;
    }
    
    @Override
    public double applyDiscount (double p) {
        if (this.yearsOfMembership > 5) {
            return p*0.5;
        } else if (this.yearsOfMembership > 1 && this.yearsOfMembership <= 5) {
            return p*0.9;
        } else {
            return p;
        }
    }
    @Override 
    public String toString () {
        return String.format("Member --> Name: %s, Age%d,, Years of Membership: %d", this.name, this.age, this.yearsOfMembership);
    }
}

