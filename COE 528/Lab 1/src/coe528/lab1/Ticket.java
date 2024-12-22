package coe528.lab1;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author barathankalanathan
 */
public class Ticket {
        private Passenger passenger;
        private Flight flight;
        private double price;
        private int number;
        private static int totalTicket;
    
    public Ticket(Passenger passenger, Flight flight, double price){
        this.passenger=passenger;
        this.flight=flight;
        this.price=price;  
        this.number= ++this.totalTicket;
    }
        public void setPassenger(Passenger passenger) {
            this.passenger = passenger;
        }

        public Passenger getPassenger() {
            return passenger;
        }

        public void setFlight(Flight flight) {
            this.flight = flight;
        }

        public Flight getFlight() {
            return flight;
        }

        public void setPrice(double price) {
            this.price = price;
        }

        public double getPrice() {
            return price;
        }

        public void setNumber(int number) {
            this.number = number;
        }

        public int getNumber() {
            return number;
        }
  
  @Override
     public String toString() {
         return passenger.getName() + ", " + flight + ", ticket price: $" + price;
     }
}
   
   
   

