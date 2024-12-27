
package input

import "core:fmt"
import "core:os"
import "core:strings"


run :: proc() {

	//To get console input we need to import 'core:os'
	fmt.print("Write something: "); 
	//to get input we use os.read
	buf: [256]byte; //This function takes an array of bytes as input
	num_bytes, err := os.read(os.stdin, buf[:]);
	//This function returns an int and an error
	//The integer stores the size of the input
	
	//We convert it to string like so:
	input := string(buf[:num_bytes]);
			
	fmt.printf(input);
}