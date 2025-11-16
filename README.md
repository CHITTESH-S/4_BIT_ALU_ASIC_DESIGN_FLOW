# 🧩 4-Bit ALU — RTL → GDSII ASIC Flow (OpenLane / SKY130)

🌟 This repo shows an end-to-end ASIC flow for a **4-bit ALU** (RTL → simulation → synthesis → PnR → GDSII) using **OpenLane / SkyWater SKY130** and open-source EDA tools. A Silicon Journey from Verilog ▶️ Layout (Sky130 + OpenLane).

<p align="center">
  <img src="https://img.shields.io/badge/Status-Completed-success?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Flow-RTL_TO_GDSII-blueviolet?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Open_Source-EDA-red?style=for-the-badge" />
  <img src="https://img.shields.io/badge/PDK-Sky130-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Frequency-100MHz-orange?style=for-the-badge" />
</p>

---

## 📋 Table of Contents

🔍 [Project Summary](#-project-summary)

⚙️ [Tools & Versions](#️-tools--versions)

🧠 [ALU Functional Specification](#-alu-functional-spec)

🚀 [Complete Design Flow](#-complete-design-flow)
  - 📝 [Step 1: RTL Design](#step-1--rtl-design)
  - 🧪 [Step 2: Simulation](#step-2--simulation--verification)
  - 🔧 [Step 3: Synthesis](#step-3--synthesis)
  - 🏗️ [Step 4: Physical Design (OpenLane)](#step-4--physical-design-openlane)

📊 [Final Results](#-final-results)

📁 [Project Structure](#-project-structure)

🎯 [How to Run](#-how-to-run)

📚 [References](#-references)

---

## 🔍 Project Summary

| Parameter | Value |
|-----------|-------|
| 🎯 **Goal** | Implement a synthesizable 4-bit ALU and run the full RTL→GDSII flow |
| 🛠️ **Design** | 4-bit ALU with 8 arithmetic/logic operations |
| 📦 **PDK** | SkyWater Sky130A (130nm) |
| ⚡ **Target Frequency** | 100 MHz (10 ns period) |
| 🔧 **Flow** | OpenLane automated RTL-to-GDSII |
| ✅ **Status** | Complete with timing closure and DRC/LVS clean |

---

## ⚙️ Tools & Versions

| Tool | Purpose | Version |
|------|---------|---------|
| 🧩 **OpenLane** | Automated RTL-to-GDSII flow | v1.0.2 |
| 🔧 **Yosys** | RTL synthesis | 0.58+84 |
| 🐧 **Icarus Verilog** | RTL simulation | 12.0 |
| 🖼️ **GTKWave** | Waveform viewer | 3.3.104 |
| 🔍 **Magic** | DRC & layout viewing | 8.3 |
| 🧮 **Netgen** | LVS verification | 1.5 |
| 🗺️ **KLayout** | GDSII viewer | 0.30 |
| 🏗️ **OpenROAD** | Place & Route | 2.0 |

---

## 🧠 ALU Functional Spec

### Operations
**Width:** 4-bit operands `A[3:0]`, `B[3:0]`  
**Control:** `sel[2:0]` selects operation

| `sel` | Operation | Result |
|:-----:|-----------|--------|
| `000` | 🟩 AND | `A & B` |
| `001` | 🟥 OR | `A \| B` |
| `010` | ➕ ADD | `A + B` |
| `011` | ➖ SUB | `A - B` |
| `100` | ⚡ XOR | `A ^ B` |
| `101` | 🔼 SHL | `A << 1` |
| `110` | 🔽 SHR | `A >> 1` |
| `111` | 👀 PASS | `A` |

### RTL Design and Testbench 

- 🔌 **ALU_Design**
```verilog
module alu4bit (
    input        clk,
    input        rst,        // synchronous reset
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] sel,
    output reg [3:0] result
);

    reg [3:0] alu_out;

    // Combinational ALU logic
    always @(*) begin
        case (sel)
            3'b000: alu_out = A & B;   // AND
            3'b001: alu_out = A | B;   // OR
            3'b010: alu_out = A + B;   // ADD
            3'b011: alu_out = A - B;   // SUBTRACT
            3'b100: alu_out = A ^ B;   // XOR
            3'b101: alu_out = A << 1;  // SHIFT LEFT
            3'b110: alu_out = A >> 1;  // SHIFT RIGHT
            3'b111: alu_out = A;       // PASS A
            default: alu_out = 4'b0000;
        endcase
    end

    // Registered output
    always @(posedge clk) begin
        if (rst)
            result <= 4'b0000;
        else
            result <= alu_out;
    end

endmodule
```

- 🔌 **ALU_Testbench**
```verilog
`timescale 1ns/1ps
module alu_tb;

    reg clk;
    reg rst;
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] sel;
    wire [3:0] result;

    // DUT Instance
    alu4bit dut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .sel(sel),
        .result(result)
    );

    // Clock generation 10ns period
    always #5 clk = ~clk;

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);

        clk = 0;
        rst = 1;

        // Initialize
        A = 4'b0000;
        B = 4'b0000;
        sel = 3'b000;

        // Release reset
        #20 rst = 0;

        // Test vectors (deterministic)
        A = 4'b0111; B = 4'b0101;

        sel = 3'b000; #20; // AND
        sel = 3'b001; #20; // OR
        sel = 3'b010; #20; // ADD
        sel = 3'b011; #20; // SUBTRACT
        sel = 3'b100; #20; // XOR
        sel = 3'b101; #20; // SHIFT LEFT
        sel = 3'b110; #20; // SHIFT RIGHT
        sel = 3'b111; #20; // PASS A

        #100;
        $finish;
    end

endmodule
```
---







