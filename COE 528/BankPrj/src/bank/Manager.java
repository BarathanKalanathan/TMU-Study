/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bank;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
/**
 *
 * @author barathankalanathan
 */

// 2a) This class is mutable because allows for modification such as adding and deleting customers
// 2b)
// Abstraction Function:
//      Represents the skeleton of a Manager with a username, password, and a list of customers.
// Rep Invariant:
//      customers != null (meaning the customer cannot be null and no two customers can have the same login
//2c) Necessary Clauses
//Effects:
//      Changes the inner data of the manager which includes adding and deleting customers
//Modifies:
//      ObservableList<Customer> adds or deletes customers in the list
//Requires:
// ObservableList<Customer>, username, password, instance, adding/deleting methods for customers
//      




public class Manager {
   
    private ObservableList<Customer> customers;
    private String username;
    private String password;
    private static Manager instance = null;
   
    private Manager(String username, String password){
        customers = FXCollections.observableArrayList();
        this.username = username;
        this.password = password;
    }
   
    public static Manager getManagerInstance(){
        if(instance == null){
            instance = new Manager("admin", "admin");
        }
        return instance;
    }
   
    public void addCustomer(Customer c) {
       customers.add(c);
    }
   
    public void deleteCustomer(Customer c){
       //delete customer;
      // c.forEach(customers::remove);
       
    }
   
    public void setCustomersList(ObservableList<Customer> customers){
        for(Customer c: customers){
            System.out.println(c.getUsername());
        }
       
        this.customers = customers;
    }
   
    public void saveData() throws IOException{
        //save customer data txt file
        File file = new File("customers.txt");
        if(!(file.exists())){ //check if file exist or not; exist() -> true if exist
            file.createNewFile();
        }
        FileWriter fw = new FileWriter(file);
   
        for(Customer c : customers){
            if(file.exists()){
                fw.write(c.getUsername() + " "  + c.getPassword() + " " + c.getStatus().currentStatus() + " " + c.getBalance() + "\n");  
            }
        }
        fw.close(); 
    }
   
    public void loadData() throws IOException{
        //load customers
        File file = new File("customers.txt");
        Scanner vp = new Scanner(file);
        while(vp.hasNext()){
            String name = vp.next();
            String pass = vp.next();
            String stat = vp.next();
            double Balance = Double.parseDouble(vp.next());
            //vp.next();
            System.out.println(name + " " +  pass + " " +Balance);
            Customer c = new Customer(name, pass, Balance);
            if(stat.equals("Silver")){
                c.setState(new SilverCustomer());
            }else if(stat.equals("Gold")){
                c.setState(new SilverCustomer());
            }
            customers.add(c);
        }
    }
   
    public Customer getCustomers(String username, String password) {
        //fix it
        //return requested customer
        for(Customer customer : customers){
            if(customer.getUsername().equals(username) && customer.getPassword().equals(password)){
                return (Customer) customers;
            }
        }
        return null;
    }
   
    public ObservableList<Customer> getCustomersList(){
        return customers;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }
 
    private boolean repOk() {
        return customers != null;
    }

    
    @Override
    public String toString() {
        return "Manager [username=" + username + ", password=" + password + "]";
    }
}
