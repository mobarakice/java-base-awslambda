package com.example;

import com.primechecker.PrimeNumber;

public class App {
    public static void main(String... args){
        int number = 5;
        boolean isPrime = new PrimeNumber().isPrime(number);

        var response = String.valueOf(number);
        if (isPrime) {
            response = response +" is a prime number.";
        } else {
            response = response + " is not a prime number.";
        }
        System.out.println(response);
    }
}
