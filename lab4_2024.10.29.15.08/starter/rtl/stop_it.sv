// Copyright (c) 2024 Ethan Sifferman.
// All rights reserved. Distribution Prohibited.

module stop_it import stop_it_pkg::*; (
    input  logic        rst_ni,

    input  logic        clk_4_i,
    input  logic        go_i,
    input  logic        stop_i,
    input  logic        load_i,

    input  logic [15:0] switches_i,
    output logic [15:0] leds_o,

    output logic        digit0_en_o,
    output logic [3:0]  digit0_o,
    output logic        digit1_en_o,
    output logic [3:0]  digit1_o,
    output logic        digit2_en_o,
    output logic [3:0]  digit2_o,
    output logic        digit3_en_o,
    output logic [3:0]  digit3_o
);


assign digit0_o = game_counter[3:0];
assign digit1_o = game_counter[4];
assign digit2_o = target_number[3:0];
assign digit3_o = target_number[4];

logic [4:0] target_number;
logic [4:0] game_counter;

logic game_counter_en;
logic game_counter_rst;
game_counter game_counter_inst (
    .clk_4_i(clk_4_i),
    .rst_ni(game_counter_rst),
    .en_i(game_counter_en),
    .count_o(game_counter)
);

logic lsfr_next;
lfsr lfsr_inst (
    .clk_i(clk_4_i),
    .rst_ni(rst_ni),
    .next_i(lsfr_next),
    .rand_o(target_number)
);



// time_counter created to count of how many quarter-seconds have passed
logic [4:0] quarter_secs;
logic time_en;
logic time_rst;
time_counter time_inst (
    .clk_4_i(clk_4_i),
    .rst_ni(time_rst), // reset when low
    .en_i(time_en), // increment if enabled is high
    .count_o(quarter_secs) // counter output
);

logic increment_score;
logic led_off;
led_shifter led_inst(
    .clk_i(clk_4_i),
    .rst_ni(rst_ni),

    .shift_i(increment_score),

    .switches_i(switches_i),
    .load_i(load_i),

    .off_i(led_off),
    .leds_o(leds_o)
);



logic won_d;
logic won_q;

always_ff @(posedge clk_4_i) begin
    if (!rst_ni) begin
        won_q <= 0;
    end
    else begin
        won_q <= won_d;
    end
end



state_t state_d, state_q;
always_ff @(posedge clk_4_i) begin
    if (!rst_ni) begin
        state_q <= WAITING_TO_START;
    end else begin
        state_q <= state_d;
    end
end



always_comb begin
    state_d = state_q;

    won_d = won_q;

    digit0_en_o = 0;
    digit1_en_o = 0;
    digit2_en_o = 0;
    digit3_en_o = 0;

    time_rst = 1;
    time_en = 0;


    led_off = 0;

    increment_score = 0;

    game_counter_en = 0;
    game_counter_rst = 1;

    lsfr_next = 0;


    unique case (state_q)

        WAITING_TO_START: begin
            digit0_en_o = 1;
            digit1_en_o = 1;
            digit3_en_o = 0;
            digit2_en_o = 0;

            if (go_i) begin
                lsfr_next = 1;
                time_rst = 0;
                game_counter_rst = 0;

                state_d = STARTING;
            end

        end

        STARTING: begin

            digit0_en_o = 1;
            digit1_en_o = 1;
            digit3_en_o = 1;
            digit2_en_o = 1;


            time_en = 1; // start counting
            if (quarter_secs == 5'b00111) begin
                time_en = 0; // stop counting

                // set up things for next state
                time_rst = 0; // reset clock to ensure counting starts at 0

                // start decrementing
                state_d = DECREMENTING;
            end

        end

        DECREMENTING: begin

            // target number stays the same, but game_counter starts to decrement
            game_counter_en = 1; // enable decrement

            digit0_en_o = 1;
            digit1_en_o = 1;
            digit3_en_o = 1;
            digit2_en_o = 1;

            // stop decrementing when the stop signal is called
            if (stop_i) begin
                game_counter_en = 0; // stop decrementing

                // check if correct
                if (game_counter == target_number) begin


                    if (leds_o == 16'b1111111111111111) begin
                        won_d = 1;
                    end

                    increment_score = 1;

                    time_rst = 0; // reset clock

                    state_d = CORRECT;
                end
                // if incorrect
                else begin
                    // set up
                    time_rst = 0; // reset clock

                    state_d = WRONG;
                end

            end

        end
        WRONG: begin
            time_en = 1; // start counting


            if (quarter_secs % 2 == 0) begin // flash left if even
                digit0_en_o = 0;
                digit1_en_o = 0;

                digit2_en_o = 1;
                digit3_en_o = 1;

            end
            else begin // flash right if odd
                digit0_en_o = 1;
                digit1_en_o = 1;

                digit2_en_o = 0;
                digit3_en_o = 0;
            end

            if (quarter_secs == 5'b01111) begin
                time_en = 0; // stop counting

                // go to waiting to start
                state_d = WAITING_TO_START;
            end

        end
        CORRECT: begin
            time_en = 1; // start counting
            if (quarter_secs % 2 == 0) begin // flash off if even
                digit0_en_o = 1;
                digit1_en_o = 1;
                digit2_en_o = 1;
                digit3_en_o = 1;
            end
            else begin // flash on if odd
                digit0_en_o = 0;
                digit1_en_o = 0;
                digit2_en_o = 0;
                digit3_en_o = 0;
            end

            if (quarter_secs == 5'b01111) begin
                time_en = 0; // stop counting

                if (won_q) begin

                    time_rst = 0; // reset clock in preparation

                    state_d = WON;
                end
                else begin


                    // go to waiting to start
                    state_d = WAITING_TO_START;
                end

            end

        end

        WON: begin

            digit0_en_o = 1;
            digit1_en_o = 1;
            digit2_en_o = 1;
            digit3_en_o = 1;
            time_en = 1; // start counting
            if (quarter_secs % 2 == 0) begin // flash off
                led_off = 1;
            end
            else begin // flash on
                led_off = 0;
            end

            // if reset button is pressed, revert to waiting to start
            if (!rst_ni) begin
                // end counting
                time_en = 0;
                // end flashing
                led_off = 0;

                state_d = WAITING_TO_START;
            end

        end

        default: begin
            state_d = WAITING_TO_START;
        end
    endcase
end

endmodule
