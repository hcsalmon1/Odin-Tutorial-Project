
package variables

import "core:fmt"
import "core:strings"

Run :: proc() {

	fmt.printf("\nShowing variables:\n");
	creating_variables();
	arrays();
	show_strings();
}

//Variable syntax:

//		CONSTANT_NUMBER :: 10; 		- constant number (constants have no type)
//		number:= 10; 				- inferred mutable integer
//		number:int = 10; 			- specified mutable integer
//		x, y: int; 					- declares multiple variables on one line
//		x = 50;						- assigns value to x
//		VALUE :int: 20;				- specifies the type of a constant
//		number, word = 2, "Hi!";	- declares and infers two different variable types on the same line

//Array syntax:
//		number_array := [3]int{1, 2, 3};		- mutable array of 3
//		number_array :: [3]int{5, 4, 3};		- immutable array of 3
//		number_array :: [?]int{1, 2, 3};		- inferred array size

//		number_slice := []int {6, 7, 8};		- a mutable slice of integers
//		number_slice :: []int {1, 2, 3};		- immutable slice of integers	
//		multidimensional_array := [3][3]int {	- 3x3 multidimensional array
//			{1,2,3},
//			{4,5,6},
//			{7,8,9},
//		};

//Basic types:

//		int				-basic signed integer type
//		uint			-basic unsigned integer type

//		i8 i16 i32 i64 i128
//		u8 u16 u32 u64 u128
//			these determine the bits and sign type
//			i - signed and can be negative
//			u - unsigned and can't be negative

//		f32 f64	- floats

//		uintptr 	- pointer sized integer
//		rawptr 		- void * in c

//		rune 		- signed 32-bit integer to represent unicode character
//		string		- pointer to a u8 array with a length

//		byte		- same as a u8

//		cstring 	- pointer to a u8 array
//		bool		- basic true or false
//		b8 b16 b32 b64 - sized booleans


creating_variables :: proc() {

	fmt.print("\n   Creating Variables:\n");
	//Create a variable with ':='
	number := 10;
	//We write the name and don't need to specify a type.
	//This will default to an 'int' type

	//If you use '::'
	NUMBER :: 10;
	//This will be a constant type and can't be changed.

	//to specify the type write the type inbetween the ':' and the '='
	specifiedNumber: int = 20;
	//To specify a constant use : TYPE :
	SPECIFIED_CONSTANT: int : 10;

	fmt.printf("   number = %i\n", number);
	fmt.printf("   NUMBER = %i\n", NUMBER);
	fmt.printf("   specifiedNumber = %i\n", specifiedNumber);

	//If you don't set a value
	undefined: int;
	//the default value is 0

	fmt.printf("   undefined = %i\n", undefined);

	uninitialised: int = ---; //this value is not set

	INT_SIZE := size_of(int);

	fmt.printf("   intsize: %i\n", INT_SIZE);

	random_number, random_word, isTrue := 1, "Fine", true;

	fmt.println("   random_number:", random_number, ", random_word:", random_word, ", isTrue:", isTrue);

}


pointers :: proc() {

	pointer: ^int; // pointer to an integer
	x: int = 10;
	pointer = &x; // point to the address of 'x'

	pointer^ += 10; //change the value

	//To declare a pointer the '^' goes on the left.
	//To use a pointer the '^' goes on the right.

}

arrays :: proc() {

	fmt.printf("\n   Arrays:\n");

	//You create an array like so:
	numberArray := [5]int{1, 2, 3, 4, 5};

	fmt.printf("   numberArray: \n");
	for number, index in numberArray {

		fmt.printf("   index: %i value: %i\n", index, number);
	}

	numberSlice := []int{6, 7, 8, 9, 10};

	fmt.printf("\n   numberSlice: \n");
	for number, index in numberSlice {

		fmt.printf("   index: %i value: %i\n", index, number);
	}

	CONSTANT_ARRAY :: [?]int{0, 1, 0, 1, 0};
	//use a question mark to not specify the size.

	fmt.printf("\n   CONSTANT_ARRAY: \n");
	for number, index in CONSTANT_ARRAY {
		
		fmt.printf("   index: %i value: %i\n", index, number);
	}

}

show_strings :: proc() {

	word: string : "No"; //This is a constant string
	word_mut: string = "yes"; //This is mutable string

	word_mut = "yes!"; //So you can change it.

	containsO: bool = strings.contains(word, "o");
	fmt.println("word contains 'o' =", containsO);

	stringLength: int = len(word);
	fmt.println("word length =", stringLength);

	//Concatenate
	hello: string : "hello";
	world: string : "world";
	hello_world: string = hello + world;
	//This only works with constants strings

	fmt.println("both:", hello_world);

	//Cut

	phrase: string : "This is an example";
	//cut is like substring in other languages
	cut_phrase := strings.cut(phrase, 0, 7);
	//It allows you to remove part of a string.
	//The parameters are the string to cut, the starting index and the end index.
	//You are choosing the part of the string to keep.
	fmt.println("'", phrase, "' cut = '", cut_phrase, "'");

	//Finding index of a character

	input: string : "Name: Mark";
	letter_index: int = strings.index_byte(input, ' ');
	if letter_index != -1 {

		fmt.println("found index:", letter_index);
		last_index: int = len(input) - 1;
		name_found: string = strings.cut(input, letter_index + 1, last_index);
		//Here we cut the string to only have the name left
		//We use the last_index function to find the last index in the string.
		fmt.printf("found name: '%s'\n", name_found);
	} 
	else {

		fmt.println("letter not found");
	}

	//Replace

	example_phrase: string : "This is an example";
	replaced_example_phrase, allocation_success := strings.replace_all(example_phrase, " ", "_");
	
	if allocation_success == true {

		fmt.println("before:", example_phrase);
		fmt.println("after:", replaced_example_phrase);
	} 
	else {

		fmt.println("error replacing");
	}

	removed_example, remove_allocation_success := strings.remove_all(example_phrase, " ");
	if remove_allocation_success == true {

		fmt.println("before:", example_phrase);
		fmt.println("after:", removed_example);
	} 
	else {

		fmt.println("error replacing");
	}
}
