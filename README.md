# Elevator
This repository contains the implementation, verification, and testing of a digital circuit that simulates an elevator controller on an FPGA board.


The ELEVATOR module encapsulates the core functionality for easy testbench verification. It consists of three sub-modules:
      ELEVATOR_FSM: A 4-state Finite State Machine where each state corresponds to a specific floor. The sequence of states is influenced by two main inputs: in (the target floor) and stop (which halts the elevator at the current floor).
      CHANGE_DETECTOR: A module designed to detect when a button for a different floor is pressed. It uses a register to store the previous input and compares it to the current input on every positive clock edge. If a difference is detected, it outputs a change pulse lasting exactly one clock cycle.
      COUNTER: A parameterized 4-bit counter. It relies on the signal from the CHANGE_DETECTOR to increment the count of visited floors only when a valid input change occurs.
The TOP module represents the highest level of the design and is specifically built for physical deployment on the FPGA board. It integrates the core ELEVATOR logic with two additional hardware-interfacing modules:
      CLK_DELAY: A clock divider used to slow down the high-frequency clock coming from the FPGA so the elevator's movement is humanly visible. It utilizes a 32-bit internal counter and outputs its 28th bit as the delayed clock signal (clk_delay).
      FLOOR_TRANSCODER: Controls a 7-segment display to show the current floor. It uses active-low logic, meaning a segment turns on when a logic 0 is applied and turns off with a logic 1. It supports 4 inputs corresponding to the floors
      
