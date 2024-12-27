
package procedures

import "core:fmt"
import "core:strings"

run :: proc() {

	fmt.printf("Showing Procedures:\n");
	
	number := 10;
	fmt.printf("   number before: %i\n", number);
	
	number = plus_10(number);
	fmt.printf("   number after plus 10: %i\n", number);

	fmt.printf("   Getting two return values from a function:\n");
	number2, is_true := get_two_things();
	fmt.printf("   number: %i, is_true: %t\n", number2, is_true);
	
	constant_parameters(1);
	
	default_value();
	default_value(10);

	number3 :int = 10;
	pointer_parameter(&number3);
	fmt.printf("   number3: %i\n", number3);
}

//Procedures, AKA functions, are declared like this

//	name :: proc(parameter:type) {
//	
//	}

//if you want to specify a return type use ->

plus_10 :: proc(input: int) -> int {

	return input + 10;
}

//Parameters go in the brackets

//Functions / methods are called 'procedures' in Odin.
//This is because the word function comes from mathematics.
//A function is normally where input and output is always the same
//and only input and local variables are used.
//As global variables can be used and changed, and this isn't a 
//functional language, procedure is a more appropriate
//name.

//procedures can have multiple return types

get_two_things :: proc() -> (int, bool) {

	return 1, true;
}

//This will return an int and a bool in that order.
//To call this function you will need to use two variables:

//	number, is_true = get_two_things();

//We can set two values with one function.

//Parameters are constant

constant_parameters :: proc(number:int) {

	//number += 1; //You can't do this
	//To change the value you need to copy it:
	number_copy := number + 1;
}


//Default values
default_value :: proc(number := 0){

	fmt.println(number);
}

//To give a parameter a default value use this syntax
//		name := 0
//This means that if you put in a value then the variable will be
//that value. If you don't include a value then it will be zero.

//if you want to specify the type then you use this:
//		number := int(0)
//This casts it to an int

pointer_parameter :: proc(number:^int){

	number^ += 10;
}

