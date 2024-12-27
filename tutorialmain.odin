
package main

import "core:fmt"
import "core:os"
import "variables"
import "procedures"
import "loops"
import "branching"
import "output"
import "allocating"
import "defer_keyword"
import "structs"
import "show_raylib"

main :: proc() {

	//procedures.run();
	//variables.Run();
	//loops.run();
	//branching.run();
	//output.run();
	//allocating.run();
	//structs.run();
	//defer_keyword.run();
	//show_raylib.run();

	fmt.print("Press Enter to close");
	buf: [256]byte;	
	num_bytes, err := os.read(os.stdin, buf[:]);
}
