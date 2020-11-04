`timescale 1ns/1ps
import axi_vip_pkg::*;
import design_1_axi_vip_0_0_pkg::*;

module no_late();

    localparam int LP_CLK_PERI = 16;
    localparam int LP_RST_PERI = 64;

    // DUT instance
    logic INIT, CLK, RESET;
	design_1_wrapper dut(.*);

    task rst_gen();
        RESET = '0;
        #(LP_RST_PERI);
        RESET = '1;
    endtask

    task clk_gen();
        CLK = '0;
        forever #(LP_CLK_PERI/2) CLK = ~CLK;
    endtask

    task clk_dly(int n);
        repeat(n) @(posedge CLK);
    endtask

	design_1_axi_vip_0_0_slv_mem_t agent;

  task user_gen_wready();
     axi_ready_gen                           wready_gen;
     wready_gen = agent.wr_driver.create_ready("awready");
//     wready_gen.set_ready_policy(XIL_AXI_READY_GEN_OSC);
     wready_gen.set_ready_policy(XIL_AXI_READY_GEN_AFTER_VALID_SINGLE);
     wready_gen.set_low_time(1);
     wready_gen.set_high_time(2);
     agent.wr_driver.send_awready(wready_gen);
  endtask


	task init_agent();
    agent = new("slave vip mem agent",dut.design_1_i.axi_vip_0.inst.IF); // agent is newed
    agent.start_slave();     
//	user_gen_wready();                                             //  agent starts to run
	endtask




    // Testscenario
    initial begin
		INIT = 1'b0;
        fork
            init_agent();
            clk_gen();
            rst_gen();
        join_none

        ////clk_dly(10);


        //wr_tran();
        clk_dly(10);
		INIT = 1'b1;
        clk_dly(1);
		INIT = 1'b0;
 

        clk_dly(200);

        //rd_tran();

        //clk_dly(100);
        $finish(2);
    end
endmodule