# Traffic Light Controller using Verilog

This project implements a Traffic Light Controller using Verilog HDL.  
The design models a simple traffic signal system for an intersection using a Finite State Machine (FSM).

## Overview

The controller manages the traffic lights for two roads (Road A and Road B).  
At any time, one road has a green signal while the other has a red signal, ensuring safe traffic flow.

The system cycles through different states:
- Road A Green
- Road A Yellow
- Road B Green
- Road B Yellow

Each state is maintained for a specific clock duration before transitioning to the next state.

## Features

- Finite State Machine (FSM) based design
- Sequential logic implementation
- Automatic state transitions
- Safe traffic signal sequencing
- Verilog testbench for simulation
