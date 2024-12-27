package defer_keyword

import "core:fmt"

run :: proc() {
	
	//The defer keyword will run that code at the end of scope

	{//This creates a scope
		word_1 :: "   This";
		word_2 :: "    is ";
		word_3 :: "    an ";
		word_4 :: "   example";
		//here we print these in order
		defer fmt.println(word_1);
		defer fmt.println(word_2);
		defer fmt.println(word_3);
		defer fmt.println(word_4);
		//However they will be printed in reverse order
		//The newer defer statement will always be run first
	}
	
	//Defer is useful for allocating memory as it ensure the memory is freed:
	heap_int:^int = new(int);
	defer free(heap_int); //This guarantees the memory is freed whenever the scope ends
	
	//Often when there is an early return in a function you would have to free memory
	//before every return statement. But as defer always runs when the scope ends you
	//only need to write it once.
	
	//You can only use defer a block of code:
	
	{
		index := 0;
		number_to_find :: 5;
		number_array := [5]int{1, 2, 3, 4, 5};
		index_found:bool = false;
		defer { //This will print after everything
			fmt.println("deferred result:");
			fmt.println("   index:", index);
			fmt.println("   index found:", index_found);
		}
		
		current_index := 0;
		for number in number_array
		{
			if number == number_to_find
			{
				index = current_index;
				index_found = true;
				break;
			}
			current_index += 1;
		}

	} //defer will run here
	
	//You can also defer an if statement
	
	do_something := true;
	
	defer if do_something == true
	{
		fmt.println("   defer: do something is true");
	}
	
}