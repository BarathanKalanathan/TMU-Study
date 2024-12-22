/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bank;

/**
 *
 * @author barathankalanathan
 */
public class Customer {
   
    private String username;
    private String password;
    private CustomerStatus status;
    private double Balance;
       
    public Customer(String username, String password, double Balance){
        this.username = username;
        this.password = password;
        this.Balance = 100;
        
        if (Balance < 10000) {
            this.status = new SilverCustomer();
        } else if (Balance >= 10000 && Balance < 20000) {
            this.status = new GoldCustomer();
        } else {
            this.status = new PlatinumCustomer();
        }
    }
   
    public void ChangeStatus(){
        status.changeStatus(this);  
    }
   
    public void setUsername(String username){
        this.username = username;
    } 
    
    public String getUsername(){
        return username;
    }   
   
    public void setPassword(String password){
        this.password = password;
    }
    
    public String getPassword(){
        return password;
    }
       
    public CustomerStatus getStatus(){
        return status;
    }
    
    public void setBalance(double Balance){
        this.Balance = Balance;
    }
   
    public double getBalance(){
        return Balance;
    }
   
    //responsible for updating status
    private void checkStatus(){
        if (Balance < 10000 && !(status instanceof SilverCustomer)) {
            status = new SilverCustomer();
        } else if (Balance >= 10000 && Balance < 20000 && !(status instanceof GoldCustomer)) {
            status = new GoldCustomer();
        } else if (Balance >= 20000 && !(status instanceof PlatinumCustomer)) {
            status = new PlatinumCustomer();
        }
    }
    // Method to withdraw funds
   public void withdraw(double amount) {
        if (amount > 0 && Balance >= amount) {
            Balance -= amount;
            checkStatus();
            System.out.println("Withdrawn " + amount + " from account. Remaining Balance: " + Balance);
        } else {
            System.out.println("Insufficient funds or invalid amount.");
        }
    }

    // Method to deposit funds
    public void deposit(double amount) {
        if (amount > 0) {
            Balance += amount;
            checkStatus();
            System.out.println("Deposited " + amount + " into account. New Balance: " + Balance);
        } else {
            System.out.println("Invalid deposit amount.");
        }
    }
    // Method for purchase 
    public void purchase(double amount) {
        if (amount >= 50) {
            double fee = 0;
            if (status instanceof SilverCustomer) {
                fee = 20;
            } else if (status instanceof GoldCustomer) {
                fee = 10;
            }

            if (Balance >= amount + fee) {
                checkStatus();
                Balance -= amount + fee;
                checkStatus();
                System.out.println("Online purchase successful. Amount: $" + amount + ", Fee: $" + fee);
            } else {
                System.out.println("Insufficient funds to make the purchase.");
            }
        } else {
            System.out.println("Online purchase amount must be $50 or more.");
        }
    }
    public void setState(CustomerStatus s){
        this.status = s;
    }
}