/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bank;

/**
 *
 * @author barathankalanathan
 */
public class PlatinumCustomer extends CustomerStatus {
    private String stat;

    public PlatinumCustomer() {
        stat = "Platinum";
    }
    
    @Override
    public void changeStatus(Customer c){
        c.setState(new GoldCustomer());
    }

    @Override
    public String currentStatus(){
        return stat;
    }
}
