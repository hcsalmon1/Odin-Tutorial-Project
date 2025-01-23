package debug

import "core:fmt"
import "core:mem"

BYTE_TO_MEGABYTE_MULTIPLIER :: 0.000001;

show_allocated :: proc(track: ^mem.Tracking_Allocator) {

    fmt.printf("   %d allocated\n", track^.current_memory_allocated);
}

show_allocated_bits :: proc(track: ^mem.Tracking_Allocator) {

    current_memory_allocated:i64 = track^.current_memory_allocated;
    memory_allocated_in_bits:f64 = cast(f64)current_memory_allocated / 8.0;
    fmt.printf("   %f bits allocated\n", memory_allocated_in_bits);
}

show_allocated_bytes :: proc(track: ^mem.Tracking_Allocator) {

    fmt.printf("   %d bytes allocated\n", track^.current_memory_allocated);
}

show_allocated_megabytes :: proc(track: ^mem.Tracking_Allocator) {

    current_memory_allocated:i64 = track^.current_memory_allocated;
    memory_allocated_in_megabytes:f64 = cast(f64)current_memory_allocated * BYTE_TO_MEGABYTE_MULTIPLIER;
    fmt.printf("   %.6f MB allocated\n", memory_allocated_in_megabytes);
}

show_freed_bits :: proc(track: ^mem.Tracking_Allocator) {
    total_memory_freed:i64 = track^.total_memory_freed;
    memory_freed_in_bits:f64 = cast(f64)total_memory_freed / 8.0;
    fmt.printf("   %f bits allocated\n", memory_freed_in_bits);
}

show_total_allocated :: proc(track: ^mem.Tracking_Allocator) {

    fmt.printf("   %d total allocated\n", track^.total_memory_allocated);
}

show_total_allocated_bytes :: proc(track: ^mem.Tracking_Allocator) {

    fmt.printf("   %d total bytes allocated\n", track^.total_memory_allocated);
}

show_total_allocated_bits :: proc(track: ^mem.Tracking_Allocator) {

    total_memory_allocated:i64 = track^.total_memory_allocated;
    memory_allocated_in_bits:f64 = cast(f64)total_memory_allocated / 8.0;
    fmt.printf("   %d total bits allocated\n", memory_allocated_in_bits);
}

show_total_allocated_megabytes :: proc(track: ^mem.Tracking_Allocator) {

    total_memory_allocated:i64 = track^.total_memory_allocated;
    memory_allocated_in_megabytes:f64 = cast(f64)total_memory_allocated * BYTE_TO_MEGABYTE_MULTIPLIER;
    fmt.printf("%d total bits allocated\n", memory_allocated_in_megabytes);
}

detect_leak :: proc(track: ^mem.Tracking_Allocator) {
    fmt.println("\nDetect leak:");
    fmt.printf("   %d total memory allocated\n", track^.total_memory_allocated);
    fmt.printf("   %d total memory freed\n", track^.total_memory_freed);
    if (track^.total_memory_allocated == track^.total_memory_freed) {

        fmt.println("   No memory leaks\n");
        return;
    }
    fmt.println("   Potential memory leak\n");
}

detect_leak_assert :: proc(track: ^mem.Tracking_Allocator) {
    fmt.println("\nDetect leak:");
    fmt.printf("   %d total memory allocated\n", track^.total_memory_allocated);
    fmt.printf("   %d total memory freed\n", track^.total_memory_freed);
    assert(track^.total_memory_allocated == track^.total_memory_freed);
    fmt.println("   No memory leaks\n");
}

show_all_allocated_info :: proc(track: ^mem.Tracking_Allocator) {

    fmt.println("Allocation info:");
    fmt.printf("   total allocated: %d bytes\n", track^.total_memory_allocated);
	fmt.printf("   total freed: %d bytes\n", track^.total_memory_freed);
    fmt.printf("   total allocation count: %d\n", track^.total_allocation_count);
    fmt.printf("   total free count: %d\n", track^.total_free_count);
    fmt.printf("   peak allocated: %d bytes\n", track^.peak_memory_allocated);
    fmt.printf("   current allocated: %d bytes\n\n", track^.current_memory_allocated);
}

detailed_leak_report :: proc(track: ^mem.Tracking_Allocator) {

    fmt.println("\nDetailed Leak Report:");

    if len(track.allocation_map) == 0 {

        fmt.println("   No memory leaks detected.");

    } else {

        for key, entry in track.allocation_map {

            fmt.printf("   Leak detected: %v bytes allocated at %v\n", entry.size, entry.location);
        }
    }
}

reset_allocation_stats :: proc(track: ^mem.Tracking_Allocator) {
    track^.total_memory_allocated = 0;
    track^.total_memory_freed = 0;
    track^.peak_memory_allocated = 0;
    track^.total_allocation_count = 0;
    track^.total_free_count = 0;
    track^.current_memory_allocated = 0;
    fmt.println("   Tracking stats have been reset.");
}