# Verilog Digital Design Modules

This repository contains a collection of **Verilog HDL modules** for common digital logic circuits, arithmetic units, counters, registers, and other building blocks used in digital systems.  
It is intended for **students, beginners, and enthusiasts** who want to learn and experiment with digital design concepts.

---

## 📂 Repository Structure

The modules are organized into functional categories:

### 1. **Arithmetic & Data Processing**
- `ALU.v` – Arithmetic Logic Unit
- `Binary_Adder.v` – Binary Adder
- `Binary_Adder_Substractor.v` – Binary Adder/Subtractor
- `Binary_Substractor.v` – Binary Subtractor
- `Half_Adder.v` – Half Adder
- `Full_Adder.v` – Full Adder
- `Half_Substractor.v` – Half Subtractor
- `BCDtoExcess3.v` – BCD to Excess-3 Converter
- `BinarytoGray.v` – Binary to Gray Converter
- `GraytoBinary.v` – Gray to Binary Converter
- `parity_generator.v` – Parity Generator

---

### 2. **Logic Gates & Combinational Circuits**
- `and_gate.v` – AND Gate
- `OR_Gate.v` – OR Gate
- `Mux2to1.v`, `Mux4to1.v`, `Mux5to1.v`, `Mux8to1.v`, `Mux16to1.v` – Multiplexers
- `Demux2to1.v`, `Demux4to1.v` – Demultiplexers
- `Encoder8to3.v` – 8-to-3 Encoder
- `priority_Encoder.v` – Priority Encoder
- `Decoder3to8.v` – 3-to-8 Decoder
- `Comparator.v` – Comparator
- `SevenSegmentDisplay.v` – Seven Segment Display Driver

---

### 3. **Sequential Circuits**
- **Flip-Flops:**
  - `D_Latch.v`
  - `D_Flipflop.v`
  - `JK_Flipflop.v`
  - `JK_FlipflopNegEdge.v`
  - `T_Flipflop.v`
  - `SRlatch.v`
  - `SR_Flipflop.v`
- **Registers:**
  - `PIPO_register.v` – Parallel In Parallel Out
  - `PISO_register.v` – Parallel In Serial Out
  - `SIPO_Register.v` – Serial In Parallel Out
  - `SISO_register.v` – Serial In Serial Out

---

### 4. **Counters**
- `ModNcounter.v` – Mod-N Counter
- `RippleCounter3bit.v` – 3-bit Ripple Counter
- `RippleDownCounter3bit.v` – 3-bit Ripple Down Counter
- `SynchronousUpCounter.v` – Synchronous Up Counter
- `SynchronousDownCounter.v` – Synchronous Down Counter
- `SyncUpDownCounter.v` – Synchronous Up/Down Counter
- `UPDownCounter.v` – Up/Down Counter
- `ring_counter.v` – Ring Counter
- `jhonson_counter.v` – Johnson Counter

---

## ▶️ Usage

1. **Clone the repository**
   ```bash
   git clone https://github.com/raviraj-09/Verilog.git
   cd Verilog

🛠 Requirements
Verilog simulator (ModelSim, Vivado, Xilinx ISE, or iverilog)

Basic knowledge of digital logic design

A text editor (VS Code recommended)

🤝 Contributing
If you have improvements, optimizations, or new modules to add:

Fork this repository

Make your changes

Submit a pull request

Author: Ravi Raj
📧 Email: raviraj225566@gmail.com
📌 GitHub: raviraj-09
