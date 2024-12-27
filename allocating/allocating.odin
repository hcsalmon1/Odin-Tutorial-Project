

package allocating

import "core:fmt"
import "core:mem"
import "core:mem/virtual"


//Allocation syntax:
//			heap_int:^int = new(int); 	- creates an int on the heap
//			heap_int^ = 10;				- sets the value of the pointer
//			free(heap_int);				- frees the memory
//			int_slice := make([]int, 10); - creates slices, dynamic arrays and maps on the heap
//			delete(int_slice);			- frees memory of the slice, dynamic array and map
//			free_all();					- frees all allocations, only works with arena allocators


//			arena allocators are allocators that allows you to free all allocations with a single free.


run :: proc() {
	
	basic_allocations();
	custom_allocations();
	
}

basic_allocations :: proc() {
	
	//This will create memory on the heap that will exist until destroyed
	heap_int:^int = new(int);
	//The type needs to be a pointer.
	//the defer keyword will perform this code at the end of scope
	defer free(heap_int);
	//This will free the memory when the function ends
	
	heap_int^ = 10;
	//we set the value using the pointer like this	
	

	//so when the procedure ends the memory will be freed
	fmt.printf("heap_int: %i\n", heap_int^);
		
	
	//We create an array on the heap like so:
	heap_array:^[10]int = new([10]int);
	defer free(heap_array);
	
	for i := 0; i < 10; i += 1
	{
		heap_array^[i] = i;
	}
	
	for i := 0; i < 10; i += 1
	{
		fmt.printf("%i,", heap_array^[i]);
	}
	fmt.println("");
}

custom_allocations :: proc() {
	
	show_arena_allocator();
	//show_tracking_allocator();
}

show_arena_allocator :: proc() {
	
	arena: virtual.Arena;
	//buffer for the arena_allocator
	arena_buffer: [200]byte;
	//This can be stack of heap memory
	
	//We create the buffer
	arena_init_error := virtual.arena_init_buffer(&arena, arena_buffer[:]);
	if arena_init_error != nil
	{
		fmt.panicf("Error initialising arena allocator %v\n", arena_init_error);
	}
	
	//We convert it to an actual allocator
	arena_allocator := virtual.arena_allocator(&arena);
	
	//Get an array of characters using the arena allocator
	char_array:^[10]byte = testing_allocators(arena_allocator);
	
	//Print the characters
	for i := 0; i < 10; i += 1
	{
		fmt.printf("%c, ", char_array^[i]);
	}
	fmt.printf("\n");
}

show_tracking_allocator :: proc() {
	
	tracking: mem.Tracking_Allocator;

}


testing_allocators :: proc(allocator := context.allocator) -> ^[10]byte {
	
	//Set the allocator to be used in this function to the allocator in the parameters
	context.allocator = allocator
	char_array:^[10]byte = new([10]byte);

	LETTERS := [?]byte{'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'};
	
	for i := 0; i < 10; i += 1
	{
		char_array^[i] = LETTERS[i];
	}
	return char_array;
}