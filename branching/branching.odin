package branching

import "core:fmt"

run :: proc() {
	
	showing_if_statements();
	showing_switch_statements();

}

showing_if_statements :: proc() {

	//If statements are the same as other languages
	//except they don't use brackets:
	
	age:int = 18;
	if age < 18 {
		fmt.printf("Too young, age: %i\n", age);
	}
	else if age < 60 {
		fmt.printf("valid age, age: %i\n", age);
	}
	else {
		fmt.printf("Too old, age: %i\n", age);
	}
	
	//You can put declarations in the first if:
	
	fmt.printf("   ");
	if x := 10; x > 10 { //this creates a variable first, then checks it
	
		
	}
	else if x < 10 {//x can still be used in other else blocks
	
		
	}
	else {
	
		
	}
	
	number:int = 20;
	//unlike c you can't just put an integer in an if statement
	
	//	if number { 			- no
		
	//	}
	
	//	if number == 10 {	- yes
		
	//	}
}

showing_switch_statements :: proc()
{
	//Switches are written like this:
	
	number:int = 3;
	
	switch number {

		case 1:
			fmt.printf("Number is 1\n");
		case 2:
			fmt.printf("Number is 2\n");
		case 3:
			fmt.printf("Number is 3\n");
	}
	
	//You can also use bool values:
	
	switch {

		case number < 3:
			fmt.printf("Number is less than 3\n");
		case number == 3:
			fmt.printf("Number is 3\n");
		case:
			fmt.printf("Number is higher than 3\n");
	}
	
	//This is like a cleaner way to write an if statement chain
	
	
	character :rune = 'a';
	
	switch character {

		case 'A'..='Z', 'a'..='z':
			fmt.printf("Character is a letter\n");
			
		case '0'..='9':
			fmt.printf("Character is a number\n");
	}
	
	
	
}