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
