package debug

import "core:fmt"

println :: proc(input: any) {

    fmt.println(input);
}

print :: proc(input: any) {

    fmt.print(input);
}