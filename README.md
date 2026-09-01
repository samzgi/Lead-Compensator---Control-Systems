# Lead Compensator Design – Control Systems I

## Overview

This repository contains the MATLAB analysis and design work for an analog lead compensator developed as part of the **Control Systems I Application Project** at Ege University.

The objective is to improve the transient response of the plant while targeting approximately **10% maximum overshoot** and a **settling time of 2 seconds or less**.

## Plant

The plant is:

\[
G(s)=\frac{1}{s(s+6)}
\]

## Design Specifications

- Maximum overshoot: approximately 10%
- Settling time: ≤ 2 s
- Unity-feedback configuration
- Analog lead compensator implementation

## Lead Compensator

The selected compensator parameters are:

- Zero: \(z=3\)
- Pole: \(p=2\)
- Gain: \(K_c=11\)

Therefore,

\[
C(s)=11\frac{s+3}{s+2}
\]

The compensated open-loop transfer function is:

\[
L(s)=\frac{11(s+3)}{s(s+2)(s+6)}
\]

## MATLAB Analysis

The MATLAB script evaluates the uncompensated and compensated systems using:

- Step response analysis
- Rise time
- Settling time
- Maximum overshoot
- Root locus
- Bode plots
- Pole-zero map

### Reported Results

| System | Rise Time | Settling Time | Overshoot |
|---|---:|---:|---:|
| Uncompensated | 8.34 s | 9.51 s | 0% |
| Lead Compensated | 0.61 s | 2.13 s | 10.50% |

The MATLAB design therefore provides a significant improvement in transient response, with performance close to the specified design targets.

## Implementation Workflow

The project followed a practical control-system design workflow:

**MATLAB/Simulink → Proteus Simulation → Physical PCB Implementation**

The compensator was also implemented using an LM741-based analog circuit and tested in Proteus and on the physical PCB.

## Repository Structure

```text
Lead-Compensator---Control-Systems/
├── README.md
├── matlab/
│   └── lead_compensator_analysis.m
├── simulink/
│   └── lead_compensator.slx
├── figures/
│   ├── step_response.png
│   ├── root_locus_uncompensated.png
│   ├── root_locus_compensated.png
│   ├── bode_uncompensated.png
│   ├── bode_compensated.png
│   └── pole_zero_map.png
├── proteus/
│   └── README.md
└── report/
    └── Lead_Compensator_Final_Report.pdf
```

> Binary files such as the Simulink model, Proteus project, figures, and PDF report can be added to the corresponding folders when available.

## Tools

- MATLAB / Control System Toolbox
- Simulink
- Proteus
- LM741 operational amplifier
- Analog circuit / PCB implementation

## Authors

**Sam Zoghi**  
**Amirkia Mahd Gharehbagh**

Ege University – Electrical-Electronics Engineering

## License

This project is shared for educational and portfolio purposes.