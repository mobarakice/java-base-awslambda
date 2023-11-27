package com.example;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.primechecker.PrimeNumber;

public class PrimeNumberLambda implements RequestHandler<Request, Response> {
    @Override
    public Response handleRequest(Request input, Context context) {
//        Gson gson = new Gson();
//        Request request = gson.fromJson(input,Request.class);
        boolean isPrime = new PrimeNumber().isPrime(input.getNumber());

        var response = String.valueOf(input.getNumber());
        if (isPrime) {
             response = response +" is a prime number.";
        } else {
            response = response + " is not a prime number.";
        }
        var r = new Response();
        r.setResult(response);
        return r;
    }
}
