# 64bit-Processor-RTL-to-GDS-OpenROAD
# 🚀 64-bit Processor Design (RTL to GDS) using OpenROAD

## 📌 Overview

This project implements a **64-bit processor** and demonstrates the complete **RTL-to-GDSII physical design flow** using the OpenROAD toolchain.

The design includes core modules like ALU, register file, and datapath, along with verification (testbench) and physical design outputs.

---

## 📁 Project Structure

```bash
64bit-Processor-RTL-to-GDS-OpenROAD/
│
├── src/        # Verilog RTL source files
│   ├── ALU64.v
│   ├── reg64.v
│   └── Datapath64.v
│
├── tb/         # Testbench files for simulation
│
├── openroad/   # OpenROAD configuration & scripts
│   ├── config.mk
│   └── design.sdc
│
├── reports/    # Timing, area, and power reports
│
├── results/    # Generated outputs (placement, routing, GDS)
│
├── docs/       # Documentation, diagrams, screenshots
│
└── README.md
```

---

## ⚙️ Tools & Technologies

* Verilog HDL
* OpenROAD Flow
* Yosys (Synthesis)
* OpenSTA (Timing Analysis)
* Magic / KLayout (Layout Visualization)

---

## 🔄 Design Flow

1. RTL Design (Verilog)
2. Functional Verification (Testbench)
3. Logic Synthesis (Yosys)
4. Floorplanning
5. Placement
6. Clock Tree Synthesis (CTS)
7. Routing
8. Timing & Power Analysis
9. GDSII Generation

---

## 🧠 Key Modules

### 🔹 ALU (Arithmetic Logic Unit)

* Performs arithmetic and logic operations
* Supports operations like ADD, SUB, AND, OR

### 🔹 Register File

* 64-bit wide registers
* Stores intermediate computation data

### 🔹 Datapath

* Connects ALU and registers
* Executes instruction-level operations

---

## 🧪 Verification

* Testbench files are included in the `tb/` directory
* Used to verify functionality of RTL modules before synthesis

---

## 📊 Results

* Successful RTL-to-GDSII flow execution
* Reports generated for:

  * Timing (setup/hold)
  * Area utilization
  * Power estimation

---

## ▶️ How to Run

### Step 1: Clone Repository

```bash
git clone <your-repo-link>
cd 64bit-Processor-RTL-to-GDS-OpenROAD
```

### Step 2: Run OpenROAD Flow

```bash
make DESIGN_CONFIG=designs/nangate45/your_design.mk
```

### Step 3: Waveform generation
for example :
```bash
gtkwave processor.vcd
gtkwave datapath.vcd
```

---

## 📸 Outputs

Screenshots and design visuals can be found in:

```
docs/
```

Recommended to include:

* Floorplan
* Placement
* Routing
* Final Layout

---

## 👨‍💻 Author

**Ansh Gupta**
B.Tech Student

---

## 🚀 Future Improvements

* Pipeline architecture implementation
* Cache memory integration
* Power optimization techniques

---
