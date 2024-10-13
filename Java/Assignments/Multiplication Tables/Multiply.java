/*
   Chapter 4:	Programming Assignment 1
   Programmer:
   Date:
   Filename:
   Purpose:
*/

import java.io.*;

public class Multiply
{
  public static void main (String[] args ) throws IOException
  {
    //Declaring variables
    int multiplier;
    int correct;
    boolean done = false;

    //Opening messages
    System.out.println("\t\tWelcome to the Multiplication Quiz");
    System.out.println("");

    //Calling the user-defined methods
    multiplier = getNumber();
    correct = takeQuiz(multiplier);
    System.out.println("\t\tYou got "+correct+ " correct!" );
  }

   public static int getNumber() throws IOException
   {
      //Declaring variables
      BufferedReader dataIn = new BufferedReader (new InputStreamReader(System.in));
      String inputData;
      int multiplier;

      //Get a value from user
      System.out.print("Enter the multiplication table you wish to practice: ");
         inputData = dataIn.readLine();
         multiplier = Integer.parseInt( inputData );

      //Return a value to main
      return multiplier;
   }

   public static int takeQuiz(int multiplier) throws IOException
   {
     //Declaring variables
      BufferedReader dataIn = new BufferedReader (new InputStreamReader(System.in));
      String inputData;
      int answer;
      int count = 0;
      int correct = 0;

      while ( count <= 12)
      {
         //Display question and get answer
         System.out.println( "What is "+count + " times " + multiplier +"?" );
            inputData = dataIn.readLine();
            answer     = Integer.parseInt( inputData );

         if (answer == count * multiplier)
         {
            System.out.println("\tCorrect!");
	    	correct = correct + 1;
         }

         else
         {
           	System.out.println("\tIncorrect");
         }

         count = count + 1;
      }
      return correct;
   }
}


