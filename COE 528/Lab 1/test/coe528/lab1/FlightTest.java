/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package coe528.lab1;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author barathankalanathan
 */
public class FlightTest {
    
    public FlightTest() {
    }

@BeforeClass
public static void setUpClass() {
}

@AfterClass
public static void tearDownClass() {
}

@Test
public void testConstructor(){
Flight instance = new Flight(3840, "Toronto", "Paris", "01/30/2024 11:11", 1, 250 );
}
@Test
public void testInvalidConstructor(){
Flight instance = new Flight(3840, "Toronto", "Toronto", "01/30/2024 11:11", 1, 250 );
}

@Test
public void testSetFlightNumber() {
System.out.println("setFlightNumber");
Flight instance = new Flight(3840, "Paris", "Toronto", "01/30/2024 11:11", 1, 250 );
int expResult = 4840;
instance.setFlightNumber(expResult);
int result = instance.getFlightNumber();
assertEquals(expResult, result);
}
@Test
public void testGetFlightNumber() {
int expResult = 1;
System.out.println("getFlightNumber");
Flight instance = new Flight(expResult, "Toronto", "Paris", "01/30/2024 11:11", 1, 250 );
int result = instance.getFlightNumber();
assertEquals(expResult, result);
}

@Test
public void testSetCapacity() {
System.out.println("setCapacity");
int capacity = 30;
Flight instance = new Flight(3840, "Toronto", "Paris", "01/30/2024 11:11", 1, 250 );
instance.setCapacity(capacity);
int result = instance.getCapacity();
assertEquals(capacity, result);
}

@Test
public void testGetCapacity() {
System.out.println("getCapacity");
int expResult = 30;
Flight instance = new Flight(3840, "Toronto", "Paris", "01/30/2024 11:11", expResult, 250 );
int result = instance.getCapacity();
assertEquals(expResult, result);
}

@Test
public void testSetNumberOfSeatsLeft() {
System.out.println("setNumberOfSeatsLeft");
Flight instance = new Flight(3840, "Toronto", "Paris", "01/30/2024 11:11", 1, 250 );
int numberOfSeatsLeft = 49;
instance.setNumberOfSeatsLeft(numberOfSeatsLeft);
int result = instance.getNumberOfSeatsLeft();
assertEquals(numberOfSeatsLeft, result);
}

@Test
public void testGetNumberOfSeatsLeft() {
System.out.println("getNumberOfSeatsLeft");
int expResult = 45;
Flight instance = new Flight(3840, "Toronto", "Paris", "01/30/2024 11:11", 1, 250 );
instance.setNumberOfSeatsLeft(45);
int result = instance.getNumberOfSeatsLeft();
assertEquals(expResult, result);
}

@Test
public void testSetOrigin() {
System.out.println("setOrigin");
String origin = "Berlin";
Flight instance = new Flight(3840, "Toronto", "Paris", "01/30/2024 11:11", 1, 250 );
instance.setOrigin(origin);
String result = instance.getOrigin();
assertEquals(origin, result);
}

@Test
public void testGetOrigin() {
System.out.println("getOrigin");
String expResult = "Berlin";
Flight instance = new Flight(3840, expResult, "Paris", "01/30/2024 11:11", 1, 250 );
String result = instance.getOrigin();
assertEquals(expResult, result);
}

@Test
public void testSetDestination() {
System.out.println("setDestination");
String destination = "Berlin";
Flight instance = new Flight(3840, "Toronto", "Paris", "01/30/2024 11:11", 1, 250 );
instance.setDestination(destination);
String result = instance.getDestination();
assertEquals(destination, result);
}

@Test
public void testGetDestination() {
System.out.println("getDestination");
String expResult = "Berlin";
Flight instance = new Flight(3840, "Toronto", expResult, "01/30/2024 11:11", 1, 250 );
String result = instance.getDestination();
assertEquals(expResult, result);
}

@Test
public void testSetDepartureTime() {
System.out.println("setDepartureTime");
String departureTime = "01/13/2024 9:45 PM";
Flight instance = new Flight(3840, "Toronto", "Paris", "01/30/2024 11:11", 1, 250 );
instance.setDepartureTime(departureTime);
String result = instance.getDepartureTime();
assertEquals(departureTime, result);
}

@Test
public void testGetDepartureTime() {
System.out.println("getDepartureTime");
String expResult = "01/13/2024 9:45 PM";
Flight instance = new Flight(3840, "Toronto", "Paris", expResult, 1, 250 );
String result = instance.getDepartureTime();
assertEquals(expResult, result);
}

@Test
public void testSetOriginalPrice() {
System.out.println("setOriginalPrice");
double originalPrice = 359;
Flight instance = new Flight(3840, "Toronto", "Paris", "01/30/2024 11:11", 1, 250 );
instance.setOriginalPrice(originalPrice);
double result = instance.getOriginalPrice();
assertEquals(originalPrice, result, 0.0000000000001);
}

@Test
public void testGetOriginalPrice() {
System.out.println("getOriginalPrice");
double expResult = 492;
Flight instance = new Flight(3840, "Toronto", "Paris", "01/30/2024 11:11", 1, expResult );
double result = instance.getOriginalPrice();
assertEquals(expResult, result, 0);
}

@Test
public void testBookASeat() {
System.out.println("bookASeat");
Flight instance = new Flight(3840, "Toronto", "Paris", "01/30/2024 11:11", 1, 381 );
boolean expResult = true;
boolean result = instance.bookASeat();
assertEquals(expResult, result);
}

@Test
public void testToString() {
System.out.println("toString");
Flight instance = new Flight(3840, "Toronto", "Paris", "01/30/2024 11:11", 1, 381 );
String expResult = "Flight 3840, Toronto to Paris, 01/30/2024 11:11, orginal price: $381.00";
String result = instance.toString();
assertEquals(expResult, result);
}
}