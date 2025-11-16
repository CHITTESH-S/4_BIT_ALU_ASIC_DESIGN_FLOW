# 🧩 4-Bit ALU — RTL → GDSII ASIC Flow (OpenLane / SKY130)

🌟 This repo shows an end-to-end ASIC flow for a **4-bit ALU** (RTL → simulation → synthesis → PnR → GDSII) using **OpenLane / SkyWater SKY130** and open-source EDA tools. A Silicon Journey from Verilog ▶️ Layout (Sky130 + OpenLane).

<p align="center">
  <img src="https://img.shields.io/badge/Status-Completed-success?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Flow-RTL_TO_GDSII-blueviolet?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Open_Source-EDA-red?style=for-the-badge" />
  <img src="https://img.shields.io/badge/PDK-Sky130-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Frequency-100MHz-orange?style=for-the-badge" />
</p>

<p align="center">

<img width="1024" height="1024" alt="conceptual_rtl_to_gds_flow" src="https://github.com/user-attachments/assets/8af28e36-7afd-47d0-b074-e10806c6f3fb" />

</p>

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

## 🚀 Complete Design Flow

### Step 1: 📝 RTL Design

**Create the design directory:**
```bash
mkdir -p alu_design/{rtl,sim,synth,outputs}
cd alu_design
```

**Create RTL files:**
- `rtl/alu4bit.v` - Main ALU design
- `rtl/alu4bit_tb.v` - Testbench

---

### Step 2: 🧪 Simulation & Verification

**Commands:**
```bash
cd sim/
iverilog -o sim/alu.vvp rtl/alu4bit.v rtl/alu4bit_tb.v
./sim/alu.sim
```

**View waveforms:**
```bash
gtkwave sim/alu.vcd
```

<p align="center">

<img width="1024" height="1024" alt="rtl_output" src="https://github.com/user-attachments/assets/0da9fb3d-ae01-43bd-93ec-562b68567134" />

</p>


**✅ Results:**
- Simulation completed successfully
- All 8 operations verified
- Timing: 0-280 ns simulation window
- VCD file generated: `sim/alu.vcd`

---

### Step 3: 🔧 Synthesis

**Create synthesis script:**
```bash
cd synth/
nano synth.ys
```

**Synthesis script (`synth.ys`):**
```tcl
# Read design
read_verilog ../rtl/alu4bit.v

# Hierarchy
hierarchy -check -top alu4bit

# Synthesis
synth -top alu4bit

# Technology mapping
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Clean
clean

# Write outputs
write_verilog alu4bit_synth.v
write_json alu4bit_synth.json
```

**Run synthesis:**
```bash
yosys synth.ys | tee alu_synth.log
```
<p align="center">

<img width="1024" height="1024" alt="synth" src="https://github.com/user-attachments/assets/f9e88038-0260-494e-9a9f-c4091676f39c" />

</p>

**✅ Synthesis Results:**
```
=== alu4bit ===
   Number of wires:                170
   Number of wire bits:            291
   Number of public wires:           7
   Number of public wire bits:      21
   Number of ports:                  6
   Number of port bits:             17
   Number of cells:                117
     $_ANDNOT_                       46
     $_AND_                           8
     $_DFFE_PP_                       4
     $_NAND_                          5
     $_NOR_                           3
     $_NOT_                           1
     $_ORNOT_                        11
     $_OR_                           28
     $_SDFF_PP0_                      4
     $_XNOR_                          2
     $_XOR_                           9
```
<p align="center">

<img width="1024" height="1024" alt="synth_output" src="https://github.com/user-attachments/assets/e9b5ddc9-a315-4723-9a27-021cafa897f8" />

</p>

---

### Step 4: 🏗️ Physical Design (OpenLane)

#### 4.1 Setup OpenLane Environment

**Set environment variables:**
```bash
export PDK_ROOT=/home/chittesh/OpenLane/pdks
export PDK=sky130A
export STD_CELL_LIBRARY=sky130_fd_sc_hd
```
<p align="center">

<img width="1024" height="1024" alt="setting_pdk" src="https://github.com/user-attachments/assets/f201f0ba-db33-4133-ab15-eeb7582741d5" />

</p>

#### 4.2 Create Design Structure

```bash
mkdir -p designs/alu4bit/src
cp ~/alu_design/rtl/alu4bit.v designs/alu4bit/src/
```

#### 4.3 Configuration File

**Create `designs/alu4bit/config.json`:**
```json
{
    "DESIGN_NAME": "alu4bit",
    "VERILOG_FILES": "dir::src/*.v",
    "CLOCK_PERIOD": 10,
    "CLOCK_PORT": "clk",
    "FP_CORE_UTIL": 40,
    "PL_TARGET_DENSITY": 0.5
}
```

<p align="center">

<img width="1024" height="1024" alt="openlane_setup" src="https://github.com/user-attachments/assets/120e449d-3d1a-434d-88f9-f67c3eeeb66f" />

</p>

#### 4.4 Run OpenLane Flow

**Using Docker (recommended):**
```bash
make mount
```

**Inside Docker container:**
```bash
./flow.tcl -design alu4bit
```

<p align="center">

<img width="1024" height="1024" alt="run_docker1" src="https://github.com/user-attachments/assets/f179d77c-e75a-4a94-b805-eb57bb809c15" />

</p>

**✅ Flow Progress:**
```
[STEP 1]  ✓ Synthesis
[STEP 2]  ✓ STA
[STEP 3]  ✓ Floorplanning
[STEP 4]  ✓ IO Placement
[STEP 5]  ✓ Tap/Decap Insertion
[STEP 6]  ✓ PDN Generation
[STEP 7]  ✓ Global Placement
[STEP 8]  ✓ Placement STA
[STEP 9]  ✓ Resizer Optimization
[STEP 10] ✓ Detailed Placement
[STEP 11] ✓ Placement STA
[STEP 12] ✓ Clock Tree Synthesis
[STEP 13] ✓ CTS STA
[STEP 14] ✓ Resizer Timing Opt
[STEP 15] ✓ Global Routing Resizer
[STEP 16] ✓ Routing STA
[STEP 17] ✓ Resizer Timing
[STEP 18] ✓ STA
[STEP 19] ✓ Global Routing
[STEP 20] ✓ Write Netlist
[STEP 21] ✓ Routing STA
[STEP 22] ✓ Fill Insertion
[STEP 23] ✓ Detailed Routing
[STEP 24] ✓ Wire Length Check
[STEP 25-31] ✓ SPEF Extraction & Multi-Corner STA
[STEP 32] ✓ IR Drop Analysis
[STEP 33] ✓ GDSII Generation (Magic)
[STEP 34] ✓ GDSII Generation (KLayout)
[STEP 35] ✓ XOR Check
[STEP 36] ✓ SPICE Export
[STEP 37-38] ✓ Powered Verilog
[STEP 39] ✓ LVS
[STEP 40] ✓ DRC (Magic)
[STEP 41] ✓ Antenna Check
[STEP 42] ✓ ERC

[SUCCESS]: Flow complete.
```

<p align="center">

<img width="1024" height="1024" alt="run_docker2" src="https://github.com/user-attachments/assets/dfe1b64b-01b9-4ff6-bedf-0a2326e4eed0" />

</p>

---

## 📊 Final Results

### Physical Design Metrics

| Metric | Value |
|--------|-------|
| 📐 **Die Area** | 0.0033 mm² (40.94 × 40.8 µm) |
| 🎯 **Core Utilization** | 40% |
| 🔢 **Total Cells** | 270 |
| ├─ Logic Cells | 66 |
| ├─ Decap Cells | 25 |
| ├─ Filler Cells | 85 |
| └─ Welltap Cells | 57 |
| 📏 **Wire Length** | 1,811 µm |
| 🔗 **Vias** | 587 |
| 📦 **GDSII Size** | 506 KB |

### Timing Analysis

| Parameter | Value | Status |
|-----------|-------|--------|
| ⏱️ **Clock Period** | 10 ns (100 MHz) | ✅ |
| 📈 **Critical Path** | 1.65 ns | ✅ |
| 🎯 **Setup Slack (WNS)** | 0.0 ns | ✅ No Violations |
| ⏰ **Hold Slack (TNS)** | 0.0 ns | ✅ No Violations |
| 🚀 **Max Frequency** | 606 MHz | ✅ |

### Power Analysis (Typical Corner)

| Type | Power |
|------|-------|
| ⚡ **Internal Power** | 0.0824 µW |
| 🔄 **Switching Power** | 0.0307 µW |
| 💤 **Leakage Power** | 0.553 pW |
| 💡 **Total Power** | ~0.113 µW |

### Verification Status

| Check | Status |
|-------|--------|
| ✅ **DRC (Magic)** | 0 violations |
| ✅ **LVS (Netgen)** | Clean - Layout matches schematic |
| ✅ **Antenna Check** | 0 violations |
| ✅ **ERC** | Pass |
| ✅ **XOR (Magic vs KLayout)** | No differences |

---

## 📁 Project Structure

```
alu_design/
├── rtl/
│   ├── alu4bit.v          # Main ALU design
│   └── alu4bit_tb.v       # Testbench
├── sim/
│   └── alu.vcd            # Simulation waveform
├── synth/
│   ├── synth.ys           # Yosys synthesis script
│   ├── alu4bit_synth.v    # Synthesized netlist
│   ├── alu4bit_synth.json # JSON netlist
│   └── alu_synth.log      # Synthesis log
└── outputs/
    └── waveform.png       # Waveform screenshot

OpenLane/designs/alu4bit/
├── config.json            # OpenLane configuration
├── src/
│   └── alu4bit.v         # RTL source
└── runs/
    └── RUN_2025.11.16_04.02.04/
        ├── logs/          # All stage logs
        ├── reports/       # Timing, area, power reports
        │   └── metrics.csv
        └── results/
            └── final/
                ├── gds/   # alu4bit.gds (GDSII layout)
                ├── def/   # DEF files
                ├── lef/   # LEF files
                ├── verilog/ # Final netlist
                ├── spef/  # Parasitic extraction
                └── spi/   # SPICE netlist
```

---

## 📸 Screenshots

### Simulation Waveform

<p align="center">

<img width="1024" height="1024" alt="rtl_output" src="https://github.com/user-attachments/assets/7fa7fceb-ed29-4abd-8fbc-0e89900d8fd3" />

</p>

### Layout Views
```bash
# View final GDSII layout
klayout ~/OpenLane/designs/alu4bit/runs/RUN_2025.11.16_04.02.04/results/final/gds/alu4bit.gds
```
<p align="center">

<img width="1024" height="1024" alt="Output_KLayout" src="https://github.com/user-attachments/assets/92021eae-1060-4f9d-b8de-7203f1ac1293" />

</p>

### View with Magic
```bash
magic -T ~/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech \
      ~/OpenLane/designs/alu4bit/runs/RUN_2025.11.16_04.02.04/results/final/gds/alu4bit.gds
```
<p align="center">

<img width="1024" height="1024" alt="magic_view" src="https://github.com/user-attachments/assets/18640106-91d7-47e6-9765-c006c2f01290" />

</p>

### View in Magic (with MAG file - native format)
```bash
magic -T ~/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech \
      ~/OpenLane/designs/alu4bit/runs/RUN_2025.11.16_04.02.04/results/final/mag/alu4bit.mag
```
<p align="center">

<img width="1024" height="1024" alt="magic" src="https://github.com/user-attachments/assets/eff68fa3-7e03-4afd-ae3d-e019e99119de" />

</p>

---

## 🎓 Key Learnings

✅ **RTL Design:** Implemented synthesizable Verilog with proper coding practices  
✅ **Verification:** Functional simulation and waveform analysis  
✅ **Synthesis:** Technology mapping to Sky130 standard cells  
✅ **Physical Design:** Complete automated PnR flow with OpenLane  
✅ **Timing Closure:** Achieved target frequency with zero violations  
✅ **Signoff:** DRC/LVS clean layout ready for fabrication  

---

## 📚 References

- [OpenLane Documentation](https://openlane.readthedocs.io/)
- [SkyWater Sky130 PDK](https://skywater-pdk.readthedocs.io/)
- [Yosys Manual](https://yosyshq.net/yosys/documentation.html)
- [Magic VLSI](http://opencircuitdesign.com/magic/)
- [KLayout](https://www.klayout.de/)

---

## 👨‍💻 Author

Chittesh S 
📧 Email: chitteshmsd7831@gmail.com 
🔗 LinkedIn: [Your Profile](https://www.linkedin.com/in/chittesh-s-280580290/)  
🐱 GitHub: [Your GitHub](https://github.com/CHITTESH-S)

---

## 📄 License

This project is open-source under the Apache 2.0 License.

---

<p align="center">
  <b>⭐ If you find this project useful, please give it a star! ⭐</b>
</p>

<p align="center">
  Made with ❤️ using Open-Source EDA tools
</p>

---
