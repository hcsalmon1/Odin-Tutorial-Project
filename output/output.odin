package output

import "core:fmt"
import "core:strings"

run :: proc() {
	
	//To print output to the console you need to import 'core:fmt'
	//This contains ways to deal with output and strings.
	//The simplest procedure is 'print':
	
	fmt.print("   Printing something.\n");
	
	//You use print when you want to print many things on the same line
	//You will need to use new line '\n' characters to manually control this yourself.
	//If you want to print something then go to the next line you can use 'println':
	
	fmt.println("   Printing something then going to the next line");
	
	//There's no need for a new line character here.
	
	//You can insert variables into this function directly:
	number := 10;
	fmt.println(number);
	
	word:string = "word";
	fmt.println(word);
	
	//To have multiple variables we use commas:
	fmt.println("   number =", number, "word =", word);
	//A space will be inserted for you in between commas
	
	//Here we have an array of byte which is the same as a u8 or char:
	letter_array := [5]byte{'a', 'b', 'c', 'd', 'e'};
	fmt.println(
		letter_array[0], 
		letter_array[1], 
		letter_array[2], 
		letter_array[3], 
		letter_array[4]
	);
	
	//The problem with runes is that they can be numbers or characters.
	//To specify the type we will need to use 'printf':
	
	fmt.printf("   %c %c %c %c %c\n",
		letter_array[0], 
		letter_array[1], 
		letter_array[2], 
		letter_array[3], 
		letter_array[4]
	);
	//In printf we insert variables directly into the first string using print codes.
	//Here they are:
	//		%d		-for integers and floats
	//		%i		-for integers
	//		%c		-for characters / runes
	//		%s		-for strings
	//		%f		-for floats
	//		%.2f		-prints a float with 2 decimal points
	
	//You can control the format fully using printf but you will need to know the codes.
	
	
}