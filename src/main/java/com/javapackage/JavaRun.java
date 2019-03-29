package com.javapackage;

public class JavaRun {

	
	   public int number;
	public boolean isEvenNumber(int number){
	         
	        boolean result = false;
	        if(number%2 == 0){
	            result = true;
	        }
	        return result;
	    }
	   
	   public void displaybook()
	    {
	        System.out.println("Number: " + isEvenNumber(number)); 
		   System.out.println("TestPass");
	    }
	   public static void main(String[] args) {
			// TODO Auto-generated method stub
			JavaRun obj = new JavaRun();
			obj.displaybook();
			
		}
}
