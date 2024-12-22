/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bank;
import java.io.IOException;
import javafx.application.Application;
import static javafx.application.Application.launch;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import javafx.scene.control.TextInputDialog;
import java.util.Optional;
/**
 *
 * @author barathankalanathan
 */
public class COE528FX extends Application {
    private Customer customer = null;
    private Manager Manager = null;
    private double Pricetotal;
    private int loadDataCount = 0;
   
    @Override
    public void start(Stage primaryStage) {
        Label user_id = new Label("User ID:");
        Label welcome = new Label("Welcome to the Bank!");
        Label pass = new Label("Password:");  
        TextField tf1 = new TextField();  
        TextField tf2 = new TextField();  
        Button b = new Button("Login");  
        GridPane root = new GridPane();  
        
        root.addRow(0, welcome);
        root.addRow(1, user_id, tf1);  
        root.addRow(2, pass, tf2);  
        root.addRow(3   , b);
        b.setMaxWidth(100);

        //top right bottom left offset
        root.setPadding(new Insets(175, 10, 10,270));
        root.setHgap(10);
        root.setVgap(10);
        
        Scene scene = new Scene(root,800,500);  
        primaryStage.setScene(scene);
        primaryStage.setResizable(false);
        primaryStage.setTitle("Store");  
        primaryStage.show();
        b.setOnAction(new EventHandler<ActionEvent>() {
            public void handle(ActionEvent event) {
                String userName = tf1.getText();
                String password = tf2.getText();
                check(userName, password, primaryStage);
            }
        }
        );
        close(primaryStage); //if 'X' is clicked in top right, save data before close
    }
   
    @Override
    public void stop(){ //when 'X' is clicked, this method is called before termination
        System.out.println("Stage is closing");
        try { //filewriter throws exception
            Manager.saveData(); //save the current customer and Manager data
        } catch (IOException ex) {
            System.out.println("Error: Saving Data");
        }
        System.out.println("Saved Data");
    }

    public void check(String name, String pass, Stage primaryStage){
        System.out.println(name + " " + pass);
        if(loadDataCount == 0){  //only load data once.
            Manager = Manager.getManagerInstance();  //only one Manager instance and load data once
            try {
                Manager.loadData();  //load customer and shopping Items previous data.
            } catch (IOException ex) {
                ex.getStackTrace();
            }
            loadDataCount += 1;
        } 
        if(name.equals("admin") && pass.equals("admin")){ //check is it Manager?
            ManagerStage(primaryStage);   //Manager main screen
            return;
        } else { //check if its a cutomer, and get current customer instance
            customer = checkCustomer (name, pass, Manager.getCustomersList());
            if (customer == null){
                System.out.println("Invalid Username or Password");
                Alert invalidUser = new Alert(Alert.AlertType.ERROR);
                invalidUser.setContentText("Invalid username or password.");
                invalidUser.show();
                return;
            } else {
                System.out.println("Customer Username is: " + customer.getUsername());
                customerScreen(primaryStage);
            }
        }
    }
   
    public Customer checkCustomer (String name, String pass, ObservableList<Customer> customers){
         //loop through list of customers
        for(Customer c: customers ){
            //if it matches return the customer
            if(c.getUsername().equals(name) && c.getPassword().equals(pass)){
                return c;
            }
        }
        //if it doesn't match return null
        return null;
    }
   
    public void customerScreen(Stage primaryStage){
        Label label = new Label ("Hi " + customer.getUsername() + "! Balance: $ " + customer.getBalance() + " Status: " + customer.getStatus().currentStatus());
        label.setMaxWidth(Double.MAX_VALUE);
        AnchorPane.setLeftAnchor(label, 0.0);
        AnchorPane.setRightAnchor(label, 0.0);
        label.setAlignment(Pos.CENTER);

        //Logout button
        Button logout = new Button ("Logout");
        // Withdraw Button
        Button withdraw = new Button ("Withdraw");
        // Deposit Button
        Button deposit = new Button ("Deposit");
        // View Current Balance Button
        Button currentbalance = new Button ("Current Balance");
        // Purchase Button
        Button Purchase = new Button ("Purchase");
       
        GridPane grid = new GridPane();
        grid.addRow(0, logout, withdraw, deposit, currentbalance, Purchase);
        grid.setPadding(new Insets(10,10,10,10));  //outter padding
        grid.setHgap(10);  //padding between each element
        grid.setVgap(10);
        grid.setAlignment(Pos.CENTER);
       
        //Purchase action
         Purchase.setOnAction(event -> {
            TextInputDialog dialog = new TextInputDialog();
            dialog.setTitle("Purchase");
            dialog.setHeaderText("Enter amount to Purchase:");
            Optional<String> result = dialog.showAndWait();
            result.ifPresent(amount -> {
                try {
                    double PurchaseAmount = Double.parseDouble(amount);
                    if (PurchaseAmount < 50) {
                        throw new NumberFormatException();
                    }
                    customer.purchase(PurchaseAmount);
                    label.setText("Hi " + customer.getUsername() + " Balance: $ " + customer.getBalance() + " Status: " + customer.getStatus().currentStatus());
                } catch (NumberFormatException e) {
                    Alert invalidInputAlert = new Alert(Alert.AlertType.ERROR);
                    invalidInputAlert.setContentText("Invalid amount.");
                    invalidInputAlert.show();
                }
            });
        });
        
        // Current balance action
        currentbalance.setOnAction(event -> {
            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Current Balance");
            alert.setHeaderText("Your Current Balance");
            alert.setContentText("Balance: $" + customer.getBalance());
            alert.showAndWait();
        });
        
        // Withdraw button action
        withdraw.setOnAction(event -> {
            TextInputDialog dialog = new TextInputDialog();
            dialog.setTitle("Withdraw");
            dialog.setHeaderText("Enter amount to withdraw:");
            Optional<String> result = dialog.showAndWait();
            result.ifPresent(amount -> {
                try {
                    double withdrawAmount = Double.parseDouble(amount);
                    if (withdrawAmount <= 0) {
                        throw new NumberFormatException();
                    }
                    customer.withdraw(withdrawAmount);
                    label.setText("Hi " + customer.getUsername() + " Balance: $ " + customer.getBalance() + " Current Status: " + customer.getStatus().currentStatus());
                } catch (NumberFormatException e) {
                    Alert invalidInputAlert = new Alert(Alert.AlertType.ERROR);
                    invalidInputAlert.setContentText("Invalid amount.");
                    invalidInputAlert.show();
                }
            });
        });
        
        // Deposit button action
        deposit.setOnAction(event -> {
            TextInputDialog dialog = new TextInputDialog();
            dialog.setTitle("Deposit");
            dialog.setHeaderText("Enter amount to deposit:");
            Optional<String> result = dialog.showAndWait();
            result.ifPresent(amount -> {
                try {
                    double depositAmount = Double.parseDouble(amount);
                    if (depositAmount <= 0) {
                        throw new NumberFormatException();
                    }
                    customer.deposit(depositAmount);
                    label.setText("Hi " + customer.getUsername() + "! Balance: $" + customer.getBalance() + "Status: " + customer.getStatus().currentStatus());
                } catch (NumberFormatException e) {
                    Alert invalidInputAlert = new Alert(Alert.AlertType.ERROR);
                    invalidInputAlert.setContentText("Invalid amount.");
                    invalidInputAlert.show();
                }
            });
        });
        //parent pane
        VBox root = new VBox();
        root.getChildren().addAll(label,grid);
        Scene scene = new Scene(root);  
        primaryStage.setScene(scene); 
        primaryStage.show();
   
        //Logout Function
        logout.setOnAction(new EventHandler<ActionEvent>() {
            public void handle(ActionEvent event) {
                start(primaryStage);
            }
        });
        close(primaryStage); //if 'X' is clicked in top right, save data before close
    }
   
    public void ManagerStage(Stage primaryStage){
        Button customer = new Button("Customer");   //customer button
        Button logout = new Button("Logout");  //logout button
        GridPane root = new GridPane();  
        root.addRow(0, customer); 
        root.addRow(2, logout);
        customer.setMaxWidth(100);//button max width
        logout.setMaxWidth(100);//button max width

        //top right bottom left offset
        //center options
        root.setPadding(new Insets(175, 10, 10,270));
        root.setHgap(10); //hor and ver gap between each elements
        root.setVgap(10);
        Scene scene=new Scene(root,800,500);  
        primaryStage.setScene(scene);
        primaryStage.show();
        customer.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                ManagerCustomerScreen(primaryStage); //add customer screen
            }
        });
        
        logout.setOnAction(new EventHandler<ActionEvent>() { //logout
            public void handle(ActionEvent event) {
                start(primaryStage); //main screen
            }
        });
        close(primaryStage); //if 'X' is clicked in top right, save data before close
    }
   
   
   
    public void ManagerCustomerScreen(Stage primaryStage){
        ObservableList<Customer> customers= Manager.getCustomersList(); //get current Items list
       
        //username Col
        TableColumn<Customer, String> usernameColumn= new TableColumn<>("Username");//create username col
        usernameColumn.setMinWidth(266); //min col width
        usernameColumn.setCellValueFactory(new PropertyValueFactory<>("username")); //(tie the data to col)get the values from obslist and all "username" var values
       
        //password col
        TableColumn<Customer, String> passwordColumn= new TableColumn<>("Password");//create password col
        passwordColumn.setMinWidth(266);//min col width
        passwordColumn.setCellValueFactory(new PropertyValueFactory<>("password"));//get the values from obslist and all "password" var values
       
        //Balance col
        TableColumn<Customer, Double> BalanceColumn= new TableColumn<>("Balance"); //create Balance col
        BalanceColumn.setMinWidth(266);//min col width
        BalanceColumn.setCellValueFactory(new PropertyValueFactory<>("Balance"));//get the values from obslist and all "Balance" var values
       
        //table
        TableView<Customer> table = new TableView<>(); //create tableview obj
        table.setItems(customers); //set Items to customers list
        table.getColumns().addAll(usernameColumn, passwordColumn, BalanceColumn); //add the cols to the table
       
        //Username Textfield
        TextField addUsername = new TextField(); //password textfield
        addUsername.setPromptText("Username"); //placeholder text
        addUsername.setMinWidth(300); //min width
        Label usernameLabel = new Label("Username");
       
        //Password Textfield
        TextField addPassword = new TextField();
        addPassword.setPromptText("Password");
        addPassword.setMinWidth(300);
        Label passwordLabel = new Label("Password");
       
        //Add buttom
        Button add = new Button ("Add");
        //Delete button
        Button delete = new Button("Delete");
        //Back button
        Button back = new Button ("Back");
       
        GridPane grid = new GridPane();
        grid.addRow(0, usernameLabel,addUsername, passwordLabel,addPassword, add); //add all the fields and button in one row
        grid.addRow(1,delete,back); //delete and back button
        grid.setPadding(new Insets(10,10,10,10));  //outter padding
        grid.setHgap(10);  //hor and ver between each element
        grid.setVgap(10);
       
        //parent pane
        VBox root = new VBox();
        root.getChildren().addAll(table, grid); //add table and gridpane
       
        Scene scene = new Scene(root);  //scene
        primaryStage.setScene(scene);  //main window scene
        primaryStage.setTitle("Itemstore");  //window title
        primaryStage.show(); //show main window
       
        add.setOnAction(new EventHandler<ActionEvent>() { //add customer button
            @Override
            public void handle(ActionEvent event) {
                String name = addUsername.getText(); //entered username paramter
                String password = addPassword.getText(); //entered password parameter
                if(validateCustomerUsername(name,password,customers)){ //Check if customer with same exist or not, if not then add it
                    //create customer obj
                    Customer c = new Customer(name,password, 0); //create new customer onj
                    c.setState(new SilverCustomer());  //new customer is silver
                    table.getItems().add(c); //add new customer obj to the table
                    Manager.setCustomersList(table.getItems()); //set customerlist list to the current table list
                    addUsername.clear(); //clear addUsername textfield from user input
                    addPassword.clear(); //clear addPassword textfield from user input
                }else{ //error, customer username already exist
                    Alert a = new Alert(Alert.AlertType.ERROR); //alert box
                    a.setContentText("Invalid Input"); //alert box content(message)
                    a.show();  //show the alert box
                    addUsername.clear(); //clear addUsername textfield from user input
                    addPassword.clear(); //clear addPassword textfield from user input
                }
            }
        });
       
        delete.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                ObservableList<Customer> allCustomers, selectedCustomer; //temp lists
                allCustomers = table.getItems(); //get all table item
                selectedCustomer = table.getSelectionModel().getSelectedItems(); //get the selected item(obj)
                selectedCustomer.forEach(allCustomers::remove); //delete the selected customer from the list
                Manager.setCustomersList(table.getItems()); //set customerlist list to the current table list
            }
        });
       
        back.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                Manager.setCustomersList(table.getItems()); //set customerlist list to the current table list
                //table.getItems().clear(); //clear table (dont do it, since i copy table to list, it will over ride the list (have to deep copy then)).
                ManagerStage(primaryStage);  //go to ManagerStage
               
            }
        });
        close(primaryStage); //if 'X' is clicked in top right, save data before close
    }
   
    public boolean validateCustomerUsername(String name,String password, ObservableList<Customer> customers){
        if(name.equals("") || password.equals("")){  //if empty field then false
            return false;
        }
        for(Customer c: customers){ //loop through all the customers list
            if(c.getUsername().equals(name)){ //if username already exist then false
                return false;
            }
        }
        return true; //true if username does not exist
    }
       
    public void close(Stage primaryStage){
        primaryStage.setOnCloseRequest(new EventHandler<WindowEvent>() {
            @Override
            public void handle(final WindowEvent event) {
                //System.out.println("Saved Data");
                primaryStage.close(); //close main window
            }
        });
    }
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        launch(args);
    }
}

