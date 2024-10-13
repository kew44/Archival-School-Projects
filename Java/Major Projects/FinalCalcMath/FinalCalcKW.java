import java.awt.*;
import javax.swing.*;

class FinalCalcKW{
   public static void main (String[] args){
	JFrame frame = new JFrame("FinalCalc");
	         frame.setSize(400,350);
	         frame.setLocation(30,85);
	         frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	Container pane = frame.getContentPane();
	         frame.setVisible(true);
	      
	//Creating the major components
	JTextField firstNumber= new JTextField(20);
	JTextField secondNumber= new JTextField(20);	
	JTextField result= new JTextField(20);

	JButton pwrButton = new JButton("Power");
	JButton rootButton = new JButton("Root");
	JButton addButton = new JButton("Add");
	JButton subButton = new JButton("Subtract");
	JButton multButton = new JButton("Multiply");
	JButton divButton = new JButton("Divide");
	JButton clrButton = new JButton("Clear");
	JButton shwPdButton = new JButton("Show Pad");

	pane.setLayout(new GridLayout(12,7));

	pane.add(new JLabel("Enter a number"));
	pane.add(firstNumber);
	pane.add(new JLabel("Enter a number"));
	pane.add(secondNumber);
	pane.add(new JLabel("Result"));
	pane.add(result);
	pane.add(pwrButton);
	pane.add(rootButton);
	pane.add(addButton);
	pane.add(subButton);
	pane.add(multButton);
	pane.add(divButton);
	pane.add(clrButton);
	pane.add(shwPdButton);

	DoFinalMathKW listener = new DoFinalMathKW(firstNumber, secondNumber, result);
	pwrButton.addActionListener(listener);
	rootButton.addActionListener(listener);
	addButton.addActionListener(listener);
	subButton.addActionListener(listener);
	multButton.addActionListener(listener);
	divButton.addActionListener(listener);
	clrButton.addActionListener(listener);
	shwPdButton.addActionListener(listener);
	frame.pack();
	frame.show();
   }
}
