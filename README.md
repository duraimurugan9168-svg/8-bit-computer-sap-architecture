# 8-bit-computer-sap-architecture
## Project Overview

This project presents the design and implementation of an **8-bit SAP-1 (Simple-As-Possible) Computer** using **Verilog HDL**. The system demonstrates the fundamental concepts of computer architecture, including instruction execution, data transfer, memory access, and control signal generation.

The computer is built by integrating essential CPU components such as the Program Counter (PC), Memory Address Register (MAR), Instruction Register (IR), Accumulator, B Register, Arithmetic Logic Unit (ALU), RAM, Output Register, and a Finite State Machine (FSM)-based Control Unit. The architecture follows the **Fetch–Decode–Execute** cycle to execute instructions stored in memory.

This project was developed as a learning platform for understanding digital system design, RTL development, FPGA implementation, and basic processor architecture. It provides hands-on experience in designing individual hardware modules and integrating them into a complete working computer system.


## Tools & Hardware

| Category | Specification |
|-----------|--------------|
| FPGA Board | Spartan-7 XC7S50 |
| Design Tool | AMD Vivado 2025 Edition |
| Hardware Description Language | Verilog HDL |
| Simulator | Vivado Simulator |
| Verification Method | Self-Checking Testbench |

## SAP-1 Computer Operational Principle

The SAP-1 Computer operates using the **Fetch → Decode → Execute** cycle controlled by a Finite State Machine (FSM).

#### Fetch

* The Program Counter (PC) provides the address of the next instruction.
* The instruction is fetched from memory and loaded into the Instruction Register (IR).
* The PC increments to the next address.

#### Decode

* The Control Unit decodes the instruction stored in the IR.
* Required control signals are generated for execution.

#### Execute

The operation depends on the instruction:

* **LDA** – Load data from memory into the Accumulator.
* **ADD** – Add memory data to the Accumulator.
* **SUB** – Subtract memory data from the Accumulator.
* **OUT** – Transfer the Accumulator value to the Output Register.
* **HLT** – Stop program execution.

#### Data Transfer

* All modules communicate through a common 8-bit bus.
* Data moves between registers, memory, and the ALU based on control signals.

#### Program Flow

* The computer continuously fetches, decodes, and executes instructions until a **HLT** instruction is encountered.
