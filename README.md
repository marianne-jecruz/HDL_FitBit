# HDL_FitBit
Implementing some features of  FitBit on an FPGA

## SWITCH MAPPING
* MODE = {Switch 3, Switch 2)
* RESET = Switch 1
* START = Switch 0
* S1 = LED0

## FEATURES TO IMPLEMENT (display on 7-segment screen)
### 1) Total_Step Count
* The total number of steps or pulses being counted
* When the count reaches 9999 (saturates) = A) Assert S1 as soon as count becomes more than 9999 B) Continue to count though. 
* When reset is asserted (active high) = A) Step count will be 0000, B) S1 will go low if previously high

### 2) Distance Covered
* Display distance as a unit of 0.5 miles
* 2048 steps = 0.5 mile
* (0, 0.5) -> 0
* (0.5, 1.0) -> 0.5
* (1.0,1.5) -> 1.0
* Correct distance should be displayed even when the display count for the number of steps saturates at 9999

### 3) Number of seconds with over 32 steps/second
* Within the first 9 seconds, how many seconds is the rate 32 steps per second or greater continuously held for?
* Hold this value after the 9-second window, until reset is asserted
* When reset is asserted = A)Clear value B) 9-second window should start from scratch and recount on first 9 seconds 

### 4) High Activity time greater than threshold 
* "high activity time" = at least one minute of activity at a rate >= 64 steps/second
* Detects high activity for at least 1 minute = A) H.A. timer goes from 0 to 60 seconds and B) Increment per second of continued activity (if rate is at or higher than 64)
* Display value freezes when step rate goes below 64 at any second, then should accumulate with additional high activity time if high activity is detected for 60+ seconds

### 5) Reset Functionality
* Clear step counter, distance counter, steps over 32 time, high activity time = 0000
* Pulse generator should also be reset
* Decimal values represented with _ instead of . (EG: 0.5 = 0_5)

### 6) Display Functionality
* Information from each feature displayed on 7-segment in a rotating fashion with a period of 2 seconds
* Order = total step count, distance covered, steps over 32, high activity time

## PULSE GENERATOR
* Generate pulse-sequence fed to Fitbit tracker module
* START signal goes high = start generating pulses
* START signal goes low = stop generating pulses
* Starts afresh when start goes high again
### Modes
* Walk Mode (MODE = 2'b00): 32 pulses/second
* Jog Mode (MODE = 2'b01): 64 pulses/second
* Run Mode (MODE = 2'b10): 128 pulses/second
* Hybrid Mode (MODE = 2'b11):
* ![image](https://github.com/marianne-jecruz/HDL_FitBit/assets/70409614/b726373a-04d4-431f-b169-402c6ad13202)

