----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Lucia Brown
-- 
-- Create Date: 10/31/2023 02:00:11 PM
-- Design Name: 
-- Module Name: DP_FullAdder_22336688 - Behavioral
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

 entity DP_FullAdder_22336688 is
 Port ( x : in STD_LOGIC ;
 y : in STD_LOGIC ;
 c_in : in STD_LOGIC ;
 s : out STD_LOGIC ;
 C_out : out STD_LOGIC );
 end DP_FullAdder_22336688 ;

architecture Behavioral of DP_FullAdder_22336688 is
 signal s0 , s1 , s2 : std_logic ;
 -- Propagation Delay according to StdentID e.g. 22336688 
 constant AND_gate_delay : Time := 9 ns ; 
 constant NAND_gate_delay : Time := 9 ns ; 
 constant OR_gate_delay : Time := 7 ns ; 
 constant NOR_gate_delay : Time := 7 ns ;
 constant XOR_gate_delay : Time := 4 ns ; 
 constant XNOR_gate_delay : Time := 4 ns ; 
constant NOT_gate_delay : Time := 3 ns ;

 begin

 s0 <= x XOR y after XOR_gate_delay ;
 s1 <= x And Y after AND_gate_delay ;
 s2 <= s0 AND c_in after AND_gate_delay ;
 s <= s0 XOR c_in after XOR_gate_delay ;
 c_out <= s2 OR s1 ;

	 end Behavioral ;