# Verilog Timer Counter Module

The "timer_counter" module is a Verilog design for a timer counter with an input-based interface. It implements a timer functionality with a specified bit width (N) and counts up from 0 to a user-defined final value (final_value). The module operates on a positive edge-triggered clock (clk) and a synchronous active-low reset (reset_n) to initialize and reset the counter.

## Module Ports:

- `clk` (input): The positive edge-triggered clock signal that synchronizes the counter's operations.
- `reset_n` (input): The synchronous active-low reset signal used to initialize the counter to zero.
- `enable` (input): The control signal to enable or disable the counter's counting operation.
- `final_value` (input): A user-defined value that specifies the terminal count for the counter.
- `done` (output): An output signal indicating that the counter has reached the `final_value` and completed its counting operation.

## Module Parameters:

- `N` (parameter): A parameter specifying the bit width of the counter. It determines the size of the internal counter register.

## Internal Signals:

- `Q_reg` (reg [N-1:0]): A registered signal that holds the current count value of the counter. It stores the current count and updates on the positive edge of the clock or when a reset is asserted.
- `Q_next` (reg [N-1:0]): A registered signal representing the next count value of the counter. It is calculated based on the current count (`Q_reg`) and will be used to update `Q_reg` after the positive clock edge.

## Behavior:

The module behaves as follows:

1. Upon the negative edge of the reset signal (`reset_n`), the counter is asynchronously reset to zero (`'b0`).
2. On the positive edge of the clock signal (`clk`), if the `enable` signal is asserted, the counter updates its value to `Q_next`, effectively incrementing the count.
3. If the `enable` signal is deasserted, the counter maintains its current value, and the count remains constant.
4. The `done` signal is assigned to be high when the counter's current value (`Q_reg`) matches the `final_value`, indicating that the counting operation has completed.
5. The `Q_next` value is calculated based on the `done` signal; if `done` is high, `Q_next` is set to zero (`'b0`), otherwise, `Q_next` is incremented by one from the current count value (`Q_reg + 1`).


Note: The module assumes that the `enable` and `reset_n` inputs are glitch-free and synchronous to the positive clock edge. It is essential to ensure proper synchronization and glitch-free operation in the external circuitry driving these signals.
