module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    assign ringer = (ring && ~vibrate_mode);
    assign motor = (ring && vibrate_mode);
endmodule


/*
When should the ringer be ON?

The ringer should be on when:
There’s an incoming call (ring = 1), and
The phone is not in vibrate mode (vibrate_mode = 0).
If there’s no incoming call (ring = 0), the ringer should always be off, regardless of the vibrate_mode.
When should the vibration motor be ON?

The motor should be on when:
There’s an incoming call (ring = 1), and
The phone is in vibrate mode (vibrate_mode = 1).
If there’s no incoming call (ring = 0), the motor should always be off, regardless of vibrate_mode.
Truth Table
Let’s construct a truth table to show how the inputs determine the outputs:

ring	vibrate_mode	ringer	motor
0	X	0	0
1	0	1	0
1	1	0	1

*/