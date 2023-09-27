# HDL_FitBit
Implementing some features of  FitBit on an FPGA

## FEATURES TO IMPLEMENT (display on 7-segment screen)
### 1) Total_Step Count
* The total number of steps or pulses being counted
* When the count reaches 9999 (saturates) = A) Assert S1 as soon as count becomes more than 9999
* When reset is asserted (active high) = A) Step count will be 0000, B) S1 will go low if previously high

### 2) Distance Covered
* Display distance as a unit of 0.5 miles
* 2048 steps = 0.5 mile
* (0, 0.5) -> 0
* (0.5, 1.0) -> 0.5
* (1.0,1.5) -> 1.0
* Correct distance should be displayed even when the display count for the number of steps saturates at 9999

### 3) 
