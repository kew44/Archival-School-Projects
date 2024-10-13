import javax.swing.*;
import java.awt.event.*;
import java.lang.Math.*;

class DoFinalMathKW implements ActionListener{
	JPanel padPanel;
      DoFinalMathKW(JTextField first, JTextField second, JTextField result){
	inputOne = first;
	inputTwo = second;
	output = result;
      }

      public void actionPerformed(ActionEvent e){
	double first, second;
	first = Double.parseDouble(inputOne.getText().trim());
	second = Double.parseDouble(inputTwo.getText().trim());

	if (e.getActionCommand().equals("Power"))
   	   output.setText(String.valueOf(Math.pow(first,second)));
	else if (e.getActionCommand().equals("Root"))
   	   output.setText(String.valueOf(Math.pow(first,1/second)));
	else if (e.getActionCommand().equals("Add"))
	   output.setText(String.valueOf(first+second));
	else if (e.getActionCommand().equals("Subtract"))
   	   output.setText(String.valueOf(first-second));
	else if (e.getActionCommand().equals("Multiply"))
   	   output.setText(String.valueOf(first*second));
	else if (e.getActionCommand().equals("Divide"))
   	   output.setText(String.valueOf(first/second));
	else if (e.getActionCommand().equals("Show Pad"))
	   padPanel.setVisible(true);
	else if (e.getActionCommand().equals("Clear"))
  	   inputOne.setText(" ");
   	   inputTwo.setText(" ");
   	   output.setText(" ");


      }

      private JTextField inputOne, inputTwo, output;
}
