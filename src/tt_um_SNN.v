`default_nettype none

module tt_um_SNN  
(
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);



    // use bidirectionals as outputs
    assign uio_oe = 8'b00000000;
    assign uio_out[7:0] = 8'd0;
    assign uo_out[7:2] = 6'd0;

    // instantiate segment display
    spiking_network spiking_network_demo(.clk(clk), .neuron_1(ui_in[0]), .neuron_2(ui_in[1]), .neuron_3(ui_in[2]),
    .neuron_7(uo_out[0]),.neuron_8(uo_out[1]));

    // leaky leaky1(.current(ui_in), .clk(clk), .rst(rst_n), .spike(uio_out[7]), .state(uo_out[7:0]));





endmodule
