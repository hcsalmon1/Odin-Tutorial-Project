

package structs

import "core:fmt"
import "core:time"

Vector3 :: struct {

	x:f64,
	y:f64,
	z:f64,
};

Timer :: struct {

	startTimeInMilliseconds:u64,
	endTimeInMilliseconds:u64,
}

StartTimer :: proc(timer:^Timer) {

	now:time.Time = time.now(); //this function returns the time since 1970 in nanoseconds
	timer.startTimeInMilliseconds = u64(now._nsec / 1_000_000); //we divide by 1 million to get milliseconds
}

StopTimer :: proc(timer:^Timer) {

	now:time.Time = time.now();
	timer.endTimeInMilliseconds = u64(now._nsec / 1_000_000);
}

PrintTimePassed :: proc(timer:^Timer) {

	if timer.endTimeInMilliseconds < timer.startTimeInMilliseconds
	{
		fmt.println("time in ms: 0");
		return;
	}
	timePassedInMS :u64 = timer.endTimeInMilliseconds - timer.startTimeInMilliseconds;
	fmt.println("time in ms:", timePassedInMS);
}

run :: proc() {

	makingStructs();
	makingATimer();
}

makingStructs :: proc() {

	position1: Vector3; //this is uninitialized
	position1 = Vector3{}; 
	//The values will be zero
	
	position2 := Vector3{1, 2, 3};
	//The values will be set in order

	position3 := Vector3{z=1, y=2};
	//You can set values out of order if you specify.
	//The missing value will be zero
	
	fmt.printf("position1: %f, %f, %f\n", position1.x, position1.y, position1.z);
	fmt.printf("position1: %f, %f, %f\n", position2.x, position2.y, position2.z);
	fmt.printf("position1: %f, %f, %f\n", position3.x, position3.y, position3.z);
}

makingATimer :: proc() {
	
	FIVE_SECONDS :: 5_000_000_000;
	
	timer:Timer;
	StartTimer(&timer);
	time.sleep(FIVE_SECONDS); //wait five seconds
	StopTimer(&timer);
	PrintTimePassed(&timer);
}

