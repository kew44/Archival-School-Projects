/*
   Chapter 4      Programming Assignment #6
   Programmer:	  Kelsey Willett
   Program Name:  Traffic.java
*/
import java.io.*;
public class Traffic
{
	public static void main(String[] args)throws IOException
	{
		String actual, speed, times, ticket;
		double Actual, Speed, Times, Over, Price, TotalCost;

				BufferedReader dataIn = new BufferedReader(new InputStreamReader(System.in));
				System.out.println("What was the actual speed limit?");
		   			actual = dataIn.readLine();
							Actual = Double.parseDouble(actual);
							if (Actual < 0) throw new NumberFormatException();

						BufferedReader dataIn2 = new BufferedReader(new InputStreamReader(System.in));
						System.out.println("How fast was the speeder traveling?");
				   			speed = dataIn2.readLine();
									Speed = Double.parseDouble(speed);
									if (Speed < 0) throw new NumberFormatException();

											BufferedReader dataIn3 = new BufferedReader(new InputStreamReader(System.in));
											System.out.println("How many times has this person been caught speeding?");
									   			times = dataIn3.readLine();
														Times = Double.parseDouble(times);
														if (Times < 0) throw new NumberFormatException();

														BufferedReader dataIn4 = new BufferedReader(new InputStreamReader(System.in));
														System.out.println("What was the ticket price?");
												   			ticket = dataIn4.readLine();
																	Price = Double.parseDouble(ticket);
																	if (Price < 0) throw new NumberFormatException();
Over = (Speed - Actual);
TotalCost = ((Over *20) + (Times * 25) + 74.8);

System.out.println("The speeder was traveling " + Over + " miles per hour over the speed limit.");
System.out.println("The ticket price was $" + Price + " and the court fee is $74.80.");
System.out.println("The total cost is $" + TotalCost + ".");
}
}

/*Note:
This was first written in 2009.
Upon re-examination in 2012, it's obvious that we hadn't discussed "exception handling" in coursework.
	There should not be a negative "Over" or "TotalCost".
Also, formatting could have been better.
*/

