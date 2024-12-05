
# Multiply/Add with Ready Valid

```bash
# open in VS Code
code .

# lint with Verilator and Verible
make lint

# simulate with Verilator
make sim

# synthesize with Yosys, then simulate with Verilator
make gls

# view waveforms
gtkwave dump.fst
```
