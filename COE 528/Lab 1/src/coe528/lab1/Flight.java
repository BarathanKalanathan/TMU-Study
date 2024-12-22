package coe528.lab1;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */

/**
 *
 * @author barathankalanathan
 */
public class Flight {
    
    int flightNumber;
    String origin;
    String destination;
    String departureTime;
    int capacity;
    int numberOfSeatsLeft;
    double originalPrice;
    
    Flight(int flightNumber, String origin, String destination, String departureTime, int capacity, double originalPrice){
       this.flightNumber=flightNumber;
       this.origin=origin;
       this.destination=destination;
       this.departureTime=departureTime;
       this.capacity=capacity;
       this.numberOfSeatsLeft=capacity;
       this.originalPrice=originalPrice;
    
       if (origin.equals(destination)){
           throw new IllegalArgumentException("Origin and destination are the same");
        }
    }

//    Flight(int flightNum, int capacity, String origin, String destination, String departTimeDate, double originalPrice) {
//        throw new UnsupportedOperationException("Not supported yet."); 
//    }
    
        public void setFlightNumber(int flightNumber) {
            this.flightNumber = flightNumber;
        }

        public int getFlightNumber() {
            return flightNumber;
        }

        public void setOrigin(String origin) {
            this.origin = origin;
        }

        public String getOrigin() {
            return origin;
        }

        public void setDestination(String destination) {
            this.destination = destination;
        }

        public String getDestination() { 
            return destination;
        }

        public void setDepartureTime(String departureTime) {
            this.departureTime = departureTime;
        }

        public String getDepartureTime() {
            return departureTime;
        }

        public void setCapacity(int capacity) {
            this.capacity = capacity;
        }

        public int getCapacity() {
            return capacity;
        }

        public void setNumberOfSeatsLeft(int numberOfSeatsLeft) {
            this.numberOfSeatsLeft = numberOfSeatsLeft;
        }

        public int getNumberOfSeatsLeft() {
            return numberOfSeatsLeft;
        }

        public void setOriginalPrice(double originalPrice) {
            this.originalPrice = originalPrice;
        }

        public double getOriginalPrice() {
            return originalPrice;
        }
    
    public boolean bookASeat(){
        if (numberOfSeatsLeft>0){
            numberOfSeatsLeft--;
            return true;
        }
        else{
            return false;
        }
    }
    @Override
    public String toString(){
        return String.format ("Flight %d, %s to %s, %s, orginal price: $%.2f",this.flightNumber,this.origin,this.destination, this.departureTime,this.originalPrice);
    }
}
    

