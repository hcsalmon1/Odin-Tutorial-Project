package loops

import "core:fmt"
import "core:strings"


run :: proc() {

	//There is only one type of loop in Odin, the for loop.
	//The basic for loop is this:

	fmt.printf("\nShowing loops:\n\n");
	
	fmt.printf("   showing basic for loop:\n   ");
	
	for i := 0; i < 10; i += 1 
	{
		fmt.printf("%i, ", i);
	}
	fmt.printf("\n");

	//There are no brackets needed in loop or if statements
	//There is also no way to use ++ to increment a value.
	// += is required.

	//To make the equivalent of a while loop you do this:

	for {
		break;
	}

	//This loop will go forever unless you break.
	
	fmt.printf("   while loop equivalent:\n   ");
	x := 0;
	for x < 5 {

		fmt.printf("%i, ", x);
		x += 1;
	}
	
	//The first and second part of the loop are optional.
	
	//multidimensional array to show 
	number_array := [3][3]int {
		{0, 1, 2},
		{3, 4, 5},
		{6, 7, 8},
	};
	
	fmt.printf("\n   showing nested for loops:\n");
	for x_index := 0; x_index < 3; x_index += 1 {

		for y_index := 0; y_index < 3; y_index += 1 {

			fmt.printf("   x: %i y: %i = %i\n", 
			x_index, y_index, number_array[x_index][y_index]);
		}
	}
	
	//Inside a for loop you need to use curly braces or the word 'do'
	
	fmt.printf("   loop with do:\n   ");
	for i := 0; i < 3; i += 1 do fmt.printf("%i, ", i);
	fmt.printf("\n");
	
	//the 'do' can be on the same line like this.
	
	//You can do foreach style loop like this:
	
	word:string = "An example";
	fmt.printf("   Printing characters in a string:\n   ");
	for character in word {

		fmt.printf("%c,", character);
	}
	fmt.printf("\n");
	
	//You can also loop backwards using #reverse
	
	fmt.printf("   Printing characters in reverse:\n   ");
	#reverse for character in word {

		fmt.printf("%c,", character);
	}
	fmt.printf("\n");
	
	//You can also do the python style loops
	
	for i in 0..<10 { //this goes until 9
		
	}
	
	for i in 0..=10 { //this goes until 10
		
	}
}
