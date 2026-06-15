# Digital-Logic-Design
Practical implementation and simulation of basic and universal logic gates.
## 🔍 Functional Logic Definitions & Truth Table
The simultaneous truth table below defines the exact behavioral logic mapping for every integrated gate output based on all possible binary input state combinations:

| Input A | Input B | AND (`out_and`) | NAND (`out_nand`) | OR (`out_or`) | NOR (`out_nor`) | NOT A (`out_not_a`) | XOR (`out_xor`) |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **0** | **0** | 0 | 1 | 0 | 1 | 1 | 0 |
| **0** | **1** | 0 | 1 | 1 | 0 | 1 | 1 |
| **1** | **0** | 0 | 1 | 1 | 0 | 0 | 1 |
| **1** | **1** | 1 | 0 | 1 | 0 | 0 | 0 |

### 💡 Core Gate Summaries:
* **AND:** High (`1`) only if both inputs are high.
* **NAND:** Inverse of AND; low (`0`) only when both inputs are high.
* **OR:** High (`1`) if at least one input is high.
* **NOR:** Inverse of OR; high (`1`) only when both inputs are low.
* **NOT:** Logical inverter that flips the state of Input A.
* **XOR:** High (`1`) only when inputs are different. Essential for arithmetic adders.
# 🚀 Advanced Digital Logic Design & Verification Portfolio

Welcome to my core Hardware Description Language (HDL) repository. This portfolio serves as a structured timeline of my progression in front-end digital integrated circuit (IC) design and VLSI validation frameworks. Every circuit contained here has been fully modeled in behavioral/structural Verilog HDL, compiled, and dynamically verified through comprehensive testbench simulation.

---

## 🛠️ Design Automation & Tool Stack
* **Hardware Description Language:** Verilog HDL (IEEE 1364-2005 Standard)
* **Simulation & Compilation Engine:** Icarus Verilog v10.0+
* **Waveform Analysis Tools:** EDA Playground & EPWave Visualizer
* **Design Paradigms:** Structural Gate-Level Modeling, Behavioral FSM Controllers, Hierarchical Testbench Verification

---

## 🗺️ Repository Architecture & Roadmap

This repository is organized hierarchically to show a clean engineering progression from basic static data-routing primitives up to clock-edge triggered memory architectures and sequential system control logic.

```text
Digital-Logic-Design/
├── Combinational_Circuits/
│   ├── basic_gates.v          # Logic Gate Foundations (AND, OR, NOT, XOR)
│   ├── adders_subtractors.v   # Half/Full Adders & Subtractors (Arithmetic Computing)
│   ├── mux_4to1.v             # 4-to-1 Multiplexer (Data Routing Pathways)
│   └── demux_1to2.v           # 1-to-2 Demultiplexer (Channel Distribution)
│
├── Sequential_Circuits/
│   ├── flip_flop_suite.v      # Unified Storage Cells (D, T, JK, & SR Flip-Flops)
│   └── tb_flip_flop_suite.v   # Parallel Synchronous Multi-Instantiated Testbench
│
└── State_Machines/
    ├── traffic_light.v        # Synchronous 3-Process FSM Controller
    └── tb_traffic_light.v     # Testbench with Internal Hierarchical State Probing
