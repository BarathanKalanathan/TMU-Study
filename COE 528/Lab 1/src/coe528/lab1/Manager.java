package coe528.lab1;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author barathankalanathan
 */
import java.util.Scanner;
import java.util.*;


public class Manager {
    Scanner input = new Scanner(System.in);
    
    List<Flight> flights;
    List<Ticket> tickets;
    
    public Manager () {
        this.flights = new ArrayList<>();
        this.tickets = new ArrayList<>();
    }
    
    public void createFlights(){
        int flightNumber; 
        int capacity;
        double originalPrice;
        String origin;
        String destination;
        String departureTime;

        flights.add(new Flight(1, "Toronto", "London", "na", 3, 1000));  
        
        Scanner a = new Scanner (System.in);
        Scanner b = new Scanner (System.in);
        Scanner c = new Scanner (System.in);
        Scanner d = new Scanner (System.in);
        
        System.out.println("\nEnter the Flight origin: ");
        origin = a.nextLine();
        
        System.out.println("\nEnter the flight capacity: ");
        capacity = a.nextInt();
        
        System.out.println("\nEnter your flight number: ");
        flightNumber = a.nextInt();

        System.out.println("\nEnter the flight destination: ");
        destination = b.nextLine();

        System.out.println("\nEnter the departure date and time: ");
        departureTime = c.nextLine();

        System.out.println("\nEnter the original price of ticket: ");
        originalPrice = d.nextDouble();
        
        Flight F = new Flight (flightNumber, origin, destination, departureTime, capacity, originalPrice);
        flights.add(F);
        
        
        System.out.println("\n Flight has been created: ");
        System.out.println(F);
    }
    
    public void displayAvailableFlights (String origin, String destination) {
        int size;
        int seats;
        String statement1,statement2;
        
        size = flights.size();
        
        System.out.println("\nFlights from " + origin + " to " + destination + ":");
        boolean ans = false;
        for(Flight i: flights){
            if(i.getOrigin().equals(origin))
                if(i.getDestination().equals(destination))
                    if(i.getNumberOfSeatsLeft()>0){
                        System.out.println(i);
                        ans = true;
                    }
        }
        if (ans == false)
            System.out.println("No flights available");
        
    }
    public Flight getFlight(int flightNumber) {
        int size  = flights.size();
        for (int i = 0; i<size; i++){
            if (flights.get(i).getFlightNumber()==flightNumber){
                return flights.get(i);
            }
        }
        return null;
    }
    public void bookSeat (int flightNumber,Passenger p ){
        int size = flights.size();
        boolean ans= false;
        int index = 0, seats;
        for (int i = 0; i<size; i++){
            if (flights.get(i).getFlightNumber()==flightNumber){
                ans=true;
                index=i;
                break;
            }
        }
        double price;
        seats= flights.get(index).getNumberOfSeatsLeft();
        if (ans == true && (seats>0)){
            flights.get(index).bookASeat();
            price=p.applyDiscount(flights.get(index).getOriginalPrice());
            Ticket a = new Ticket(p,flights.get(index),price);
            tickets.add(a);
            System.out.println("\nCongrats! You have now been booked for a flight: "+flightNumber);
            System.out.println("Tickets: "+a);
        } else {
            if (ans == true && seats == 0){
                System.out.println("\nUnfortunately the capacity for Flight #"+flightNumber+ " is full,and cannot rebook the ticket for this class");
            }
            else if (ans == false){
                System.out.println("\nUnfortunately this Flight #"+flightNumber+ " does not exist");
            }
        }
    }
    public static void main (String [] args){
        
        Manager M =new Manager();
        Flight F;
        Passenger P;
        Scanner a = new Scanner (System.in);
        Scanner b = new Scanner (System.in);
        String input, destination, origin, name;
        int FlightNumber;
        int age;
        int years;
        boolean ans = false;
        
        while (ans!=true) {
            System.out.println("\n Choose one of the following letter \n");
            System.out.println("Letter a to create a flight");
            System.out.println("Letter b to display all available flights");
            System.out.println("Letter c to get flight info from number");
            System.out.println("Letter d to book a seat");
            System.out.println("Letter x to end the program \n");
            System.out.println("Please enter the letter: ");
            input = a.nextLine();

            switch (input) {
                case "a":
                    M.createFlights();
                    break;

                case "b":
                    System.out.println("\nEnter the flight Origin: ");
                    origin = a.nextLine();
                    System.out.println("\nEnter the flight destination: ");
                    destination=a.nextLine();
                    M.displayAvailableFlights(origin,destination);
                    break;

                case "c":
                    System.out.println("\nEnter the flight Number: ");
                    FlightNumber=b.nextInt();
                    F=M.getFlight(FlightNumber);
                    if (F==null){
                        System.out.println("Flight #"+FlightNumber+" does not exist");     
                    } else {
                        System.out.println("Information regarding the Flight"+FlightNumber+":");
                        System.out.println(F);
                    }
                    break; 
                case "d":
                    System.out.println("\nSelect n if passenger is a non member, Select m if passenger is a member");
                    input=a.nextLine();
                    System.out.println("\nEnter age: ");
                    age=b.nextInt();
                    System.out.println("\nEnter passengers name: ");
                    name=a.nextLine();
                    System.out.println("\nEnter flight Number: ");
                    FlightNumber=b.nextInt();

                    if (input.equals("n")==true){
                        P = new NonMember(name,age);
                        M.bookSeat(FlightNumber,P);
                    } else if (input.equals("m") == true){
                        System.out.println("\nEnter the amount of years has the passenger been a member: ");
                        years=b.nextInt();
                        P=new Member(name,age,years);
                        M.bookSeat(FlightNumber,P);
                    }
                    break;

                case "x":
                    ans=true;
                    System.out.println("\nThe program has now ended");
                    break;

                default:
                    System.out.println("\nYou have entered an invalid option");
                    break;
            }
        }
    }
}


