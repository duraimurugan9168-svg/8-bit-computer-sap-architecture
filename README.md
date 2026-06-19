# 8-bit-computer-sap-architecture
## Project Overview

This project implements an 8-bit SAP-1 (Simple-As-Possible) Computer using Verilog HDL.
It demonstrates the fundamentals of computer architecture and instruction execution.
The design integrates modules such as the PC, MAR, IR, registers, ALU, RAM, and output register.
An FSM-based control unit generates the required control signals.
The system follows the Fetch–Decode–Execute cycle to process instructions.
It serves as a platform for learning digital system design and RTL development.
The project also provides practical experience with FPGA implementation and processor architecture.

---

## Problem Statement

Understanding how a computer executes instructions at the hardware level can be challenging due to the complexity of modern processors. This project addresses this problem by designing and implementing an **8-bit SAP (Simple-As-Possible) Computer** using Verilog HDL. The system demonstrates fundamental computer architecture concepts such as instruction fetching, decoding, execution, memory access, arithmetic operations, and control signal generation through a modular and educational CPU design.

**INPUTS**

* Clock (`clk`)
* Reset (`reset`)
* Program instructions stored in memory
* Data stored in memory

**CONDITIONS**

* System Reset
* Fetch Cycle
* Decode Cycle
* Execute Cycle
* Halt Instruction (`HLT`)

**LOGICAL FLOW**

```text
PROGRAM MEMORY
       ↓
     FETCH
       ↓
     DECODE
       ↓
    EXECUTE
       ↓
REGISTER / ALU OPERATION
       ↓
      OUTPUT
```

The processor executes instructions sequentially using a Finite State Machine (FSM)-based Control Unit and an 8-bit shared bus architecture. Correct operation is maintained through synchronized register transfers, controlled memory access, and timing-state (T-cycle) based instruction execution.

---

## Tools & Hardware

| Category | Specification |
|-----------|--------------|
| FPGA Board | Spartan-7 XC7S50 |
| Design Tool | AMD Vivado 2025 Edition |
| Hardware Description Language | Verilog HDL |
| Simulator | Vivado Simulator |
| Verification Method | Self-Checking Testbench |

---

## Instruction Set Architecture (ISA)

The 8-bit SAP Computer supports the following instructions:

| Opcode | Instruction   | Description                                      |
| ------ | ------------- | ------------------------------------------------ |
| `0001` | **LDA addr**  | Load Accumulator (A) from memory                 |
| `0010` | **ADD addr**  | Add memory data to Accumulator (A)               |
| `0011` | **SUB addr**  | Subtract memory data from Accumulator (A)        |
| `0100` | **DIV addr**  | Divide Accumulator (A) using memory operand      |
| `0101` | **AND addr**  | Perform bitwise AND operation                    |
| `0110` | **OR addr**   | Perform bitwise OR operation                     |
| `0111` | **XOR addr**  | Perform bitwise XOR operation                    |
| `1000` | **XNOR addr** | Perform bitwise XNOR operation                   |
| `1001` | **STA addr**  | Store Accumulator (A) data into memory           |
| `1010` | **OUT**       | Transfer Accumulator (A) data to Output Register |
| `1011` | **HLT**       | Halt program execution                           |

### Instruction Format

```text
+--------+------------+
| Opcode |  Address   |
+--------+------------+
| 4 bits |   4 bits   |
+--------+------------+
```

* **Opcode (4 bits):** Specifies the operation to be performed.
* **Address (4 bits):** Memory location used by address-based instructions.
* Total instruction width: **8 bits**.
---

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
## Control Unit Timing States (T-Cycles)

The SAP-1 Control Unit is implemented using a Finite State Machine (FSM) that generates sequential timing states (T0–T5). These states control the fetch and execution of instructions by activating the required control signals.

```text
T0 → T1 → T2 → T3 → T4 → T5
↑                          ↓
└──────────────────────────┘
```

### State Description

* **T0** – Load memory address from the Program Counter (PC) into the Memory Address Register (MAR).
* **T1** – Fetch instruction from memory into the Instruction Register (IR) and increment the PC.
* **T2** – Decode the instruction opcode.
* **T3** – Begin instruction execution.
* **T4** – Continue instruction execution (if required).
* **T5** – Complete instruction execution and prepare for the next instruction.

### Instruction Execution

| Instruction | T3           | T4              | T5              |
| ----------- | ------------ | --------------- | --------------- |
| **LDA**     | Load Address | Read Data       | Load A Register |
| **ADD**     | Load Address | Load B Register | A ← A + B       |
| **SUB**     | Load Address | Load B Register | A ← A − B       |
| **OUT**     | OUT ← A      | —               | —               |
| **HLT**     | Halt CPU     | —               | —               |

The FSM continuously cycles through the timing states until a **HLT** instruction is encountered.
