/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bank;

/**
 *
 * @author barathankalanathan
 */
public class SilverCustomer extends CustomerStatus {
    private String stat;

    public SilverCustomer() {
        stat = "Silver";
    }
    
    @Override
    public void changeStatus(Customer c){
        double balance = c.getBalance();
        if (balance >= 20000) {
            c.setState(new PlatinumCustomer());
        } else if (balance >= 10000) {
            c.setState(new GoldCustomer());
        }
    }

    @Override
    public String currentStatus(){
        return stat;
    }
}