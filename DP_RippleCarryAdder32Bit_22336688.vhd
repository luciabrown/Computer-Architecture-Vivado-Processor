----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2023 02:02:51 PM
-- Design Name: 
-- Module Name: DP_RippleCarryAdder32Bit_22336688 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
 library IEEE ;
 use IEEE . STD_LOGIC_1164 .ALL;

 entity DP_RippleCarryAdder32Bit_22336688 is
 Port ( x , y : in STD_LOGIC_VECTOR (31 downto 0) ;
 c_in : in STD_LOGIC ;
 s : out STD_LOGIC_VECTOR (31 downto 0) ;
 c_out : out STD_LOGIC ;
 v : out STD_LOGIC);
 end DP_RippleCarryAdder32Bit_22336688 ;

 architecture Behavioral of DP_RippleCarryAdder32Bit_22336688 is
 
  COMPONENT DP_FullAdder_22336688
 Port ( x : in STD_LOGIC ;
 y : in STD_LOGIC ;
 c_in : in STD_LOGIC ;
 s : out STD_LOGIC ;
 c_out : out STD_LOGIC );
 END COMPONENT ;
 
 signal c_out0 , c_out1 , c_out2 , c_out3 : std_logic ;
  signal c_out4 , c_out5 , c_out6 , c_out7 : std_logic ;
   signal c_out8 , c_out9 , c_out10 , c_out11 : std_logic ;
    signal c_out12 , c_out13 , c_out14 , c_out15 : std_logic ;
 signal c_out16 , c_out17 , c_out18 , c_out19 : std_logic ;
  signal c_out20 , c_out21 , c_out22 , c_out23 : std_logic ;
   signal c_out24 , c_out25 , c_out26 , c_out27 : std_logic ;
    signal c_out28 , c_out29 , c_out30, c_out31 : std_logic ;
 
  -- Propagation Delay according to StdentID e.g. 22336688 
 constant AND_gate_delay : Time := 9 ns ; 
 constant NAND_gate_delay : Time := 9 ns ; 
 constant OR_gate_delay : Time := 7 ns ; 
 constant NOR_gate_delay : Time := 7 ns ;
 constant XOR_gate_delay : Time := 4 ns ; 
 constant XNOR_gate_delay : Time := 4 ns ; 
constant NOT_gate_delay : Time := 3 ns ;

 begin
 -- Instantiate the least significant bit
 bit0 : DP_FullAdder_22336688 PORT MAP (
 x => x (0) ,
 y => y (0) ,
 c_in => c_in ,
 s => s (0) ,
 c_out => c_out0
 );

 bit1 : DP_FullAdder_22336688 PORT MAP (
 x => x (1) ,
 y => y (1) ,
 c_in => c_out0 ,
 s => s (1) ,
 c_out => c_out1
 );

 bit2 : DP_FullAdder_22336688 PORT MAP (
 x => x (2) ,
 y => y (2) ,
 c_in => c_out1 ,
 s => s (2) ,
 c_out => c_out2
 );
 
  bit3 : DP_FullAdder_22336688 PORT MAP (
 x => x (3) ,
 y => y (3) ,
 c_in => c_out2 ,
 s => s (3) ,
 c_out => c_out3
 );

 bit4 : DP_FullAdder_22336688 PORT MAP (
 x => x (4) ,
 y => y (4) ,
 c_in => c_out3 ,
 s => s (4) ,
 c_out => c_out4
 );
 
  bit5 : DP_FullAdder_22336688 PORT MAP (
 x => x (5) ,
 y => y (5) ,
 c_in => c_out4 ,
 s => s (5) ,
 c_out => c_out5
 );

 bit6 : DP_FullAdder_22336688 PORT MAP (
 x => x (6) ,
 y => y (6) ,
 c_in => c_out5 ,
 s => s (6) ,
 c_out => c_out6
 );
 
  bit7 : DP_FullAdder_22336688 PORT MAP (
 x => x (7) ,
 y => y (7) ,
 c_in => c_out6 ,
 s => s (7) ,
 c_out => c_out7
 );

 bit8 : DP_FullAdder_22336688 PORT MAP (
 x => x (8) ,
 y => y (8) ,
 c_in => c_out7 ,
 s => s (8) ,
 c_out => c_out8
 );
 
  bit9 : DP_FullAdder_22336688 PORT MAP (
 x => x (9) ,
 y => y (9) ,
 c_in => c_out8 ,
 s => s (9) ,
 c_out => c_out9
 );

 bit10 : DP_FullAdder_22336688 PORT MAP (
 x => x (10) ,
 y => y (10) ,
 c_in => c_out9 ,
 s => s (10) ,
 c_out => c_out10
 );
 
  bit11 : DP_FullAdder_22336688 PORT MAP (
 x => x (11) ,
 y => y (11) ,
 c_in => c_out10 ,
 s => s (11) ,
 c_out => c_out11
 );

 bit12 : DP_FullAdder_22336688 PORT MAP (
 x => x (12) ,
 y => y (12) ,
 c_in => c_out11 ,
 s => s (12) ,
 c_out => c_out12
 );
 
  bit13 : DP_FullAdder_22336688 PORT MAP (
 x => x (13) ,
 y => y (13) ,
 c_in => c_out12 ,
 s => s (13) ,
 c_out => c_out13
 );

 bit14 : DP_FullAdder_22336688 PORT MAP (
 x => x (14) ,
 y => y (14) ,
 c_in => c_out13 ,
 s => s (14) ,
 c_out => c_out14
 );
 
  bit15 : DP_FullAdder_22336688 PORT MAP (
 x => x (15) ,
 y => y (15) ,
 c_in => c_out14,
 s => s (15) ,
 c_out => c_out15
 );

 bit16 : DP_FullAdder_22336688 PORT MAP (
 x => x (16) ,
 y => y (16) ,
 c_in => c_out15 ,
 s => s (16) ,
 c_out => c_out16
 );
 
  bit17 : DP_FullAdder_22336688 PORT MAP (
 x => x (17) ,
 y => y (17) ,
 c_in => c_out16 ,
 s => s (17) ,
 c_out => c_out17
 );

 bit18 : DP_FullAdder_22336688 PORT MAP (
 x => x (18) ,
 y => y (18) ,
 c_in => c_out17 ,
 s => s (18) ,
 c_out => c_out18
 );
 
  bit19 : DP_FullAdder_22336688 PORT MAP (
 x => x (19) ,
 y => y (19) ,
 c_in => c_out18 ,
 s => s (19) ,
 c_out => c_out19
 );

 bit20 : DP_FullAdder_22336688 PORT MAP (
 x => x (20) ,
 y => y (20) ,
 c_in => c_out19 ,
 s => s (20) ,
 c_out => c_out20
 );
 
  bit21 : DP_FullAdder_22336688 PORT MAP (
 x => x (21) ,
 y => y (21) ,
 c_in => c_out20 ,
 s => s (21) ,
 c_out => c_out21
 );

 bit22 : DP_FullAdder_22336688 PORT MAP (
 x => x (22) ,
 y => y (22) ,
 c_in => c_out21 ,
 s => s (22) ,
 c_out => c_out22
 );
 
  bit23 : DP_FullAdder_22336688 PORT MAP (
 x => x (23) ,
 y => y (23) ,
 c_in => c_out22 ,
 s => s (23) ,
 c_out => c_out23
 );

 bit24 : DP_FullAdder_22336688 PORT MAP (
 x => x (24) ,
 y => y (24) ,
 c_in => c_out23 ,
 s => s (24) ,
 c_out => c_out24
 );
 
  bit25 : DP_FullAdder_22336688 PORT MAP (
 x => x (25) ,
 y => y (25) ,
 c_in => c_out24 ,
 s => s (25) ,
 c_out => c_out25
 );

 bit26 : DP_FullAdder_22336688 PORT MAP (
 x => x (26) ,
 y => y (26) ,
 c_in => c_out25 ,
 s => s (26) ,
 c_out => c_out26
 );
 
  bit27 : DP_FullAdder_22336688 PORT MAP (
 x => x (27) ,
 y => y (27) ,
 c_in => c_out26 ,
 s => s (27) ,
 c_out => c_out27
 );

 bit28 : DP_FullAdder_22336688 PORT MAP (
 x => x (28) ,
 y => y (28) ,
 c_in => c_out27 ,
 s => s (28) ,
 c_out => c_out28
 );

 bit29 : DP_FullAdder_22336688 PORT MAP (
 x => x (29) ,
 y => y (29) ,
 c_in => c_out28 ,
 s => s (29) ,
 c_out => c_out29
 );

 bit30 : DP_FullAdder_22336688 PORT MAP (
 x => x (30) ,
 y => y (30) ,
 c_in => c_out29 ,
 s => s (30) ,
 c_out => c_out30
 );
 
  bit31 : DP_FullAdder_22336688 PORT MAP (
 x => x (31) ,
 y => y (31) ,
 c_in => c_out30 ,
 s => s (31) ,
 c_out => c_out31
 );
 
 c_out <= c_out31;
 v <= c_out31 xor c_out30 after xor_gate_delay;
 
 
 
end Behavioral;