
package show_raylib

import "core:fmt"
import "vendor:raylib"


SCREEN_WIDTH  :: 800;
SCREEN_HEIGHT :: 450;

colourIndex := 0;
frameCount := 0;

run :: proc() {

	raylib.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Window");
	defer raylib.CloseWindow();

	raylib.SetTargetFPS(60);

	for !raylib.WindowShouldClose()
	{ // Detect window close button or ESC key
		update_game();
		draw_game();
	}
}

update_game :: proc() {

}

draw_game :: proc() {
	
	frameCount += 1;
	raylib.BeginDrawing()
	defer raylib.EndDrawing()
	
	colourGradient :f64 = 0; 
	
	colors := [9]raylib.Color {
		raylib.Color{255, 63, 63, 255}, // red
		raylib.Color{255, 252, 54, 255},    // yellow
		raylib.Color{116, 255, 54, 255},    // Green
		raylib.Color{55, 255, 213, 255}, // light blue
		raylib.Color{49, 66, 255,  255},  // dark blue
		raylib.Color{137, 47, 255, 255}, //purple
		raylib.Color{230, 45, 255,255}, //pink
		raylib.Color{255,255,255,255}, //black
		raylib.Color{0,0,0,255}, //white
	};
	
	COLOUR_COUNT :: 9;
	
	
	startColour := colors[colourIndex % COLOUR_COUNT];
	endColour := colors[(colourIndex + 1) % COLOUR_COUNT];
	
	for x := 0; x < SCREEN_WIDTH; x += 1 {

		for y := 0; y < SCREEN_HEIGHT; y += 1 {

			t :u8 = u8(x);
			color:raylib.Color = Lerp(startColour, endColour, t);
			raylib.DrawPixel(i32(x), i32(y), color);
		}
	}
	if (frameCount > 500) {

		frameCount = 0;
		colourIndex += 1;
		if colourIndex >= COLOUR_COUNT
		{
			colourIndex = 0;
		}
	}
}

Lerp :: proc(start:raylib.Color, end:raylib.Color, t:u8) -> raylib.Color {

	return raylib.Color{
		start.r + (end.r - start.r) * t,
		start.g + (end.g - start.g) * t,
		start.b + (end.b - start.b) * t, 255
	};
}