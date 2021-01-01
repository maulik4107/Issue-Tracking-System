package com.issuetracker.others;

public class GenerateOTP {

	//declaring a of return type String 
	//which on calling provides the otp 
	    public static String generateOTP()  
	    {  //int randomPin declared to store the otp 
	        //since we using Math.random() hence we have to type cast it int 
	        //because Math.random() returns decimal value 
	        int randomPin   =(int) (Math.random()*9000)+1000; 
	        String otp  = String.valueOf(randomPin); 
	        return otp; //returning value of otp 
	    } 
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		 String otpSting  =generateOTP();//function calling 
	        System.out.println("OTP : "+otpSting); 
	}

}
