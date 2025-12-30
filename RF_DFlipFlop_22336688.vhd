----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Lucia Brown
-- 
-- Create Date: 18.09.2023 10:23:53
-- Design Name: 
-- Module Name: OR_22336688 - Behavioral
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

 entity RF_DFlipFlop_22336688 is
 Port ( CLK , D : in STD_LOGIC ;
 Q , Q_not : out STD_LOGIC );
 end RF_DFlipFlop_22336688 ;

 architecture Behavioral of RF_DFlipFlop_22336688 is

 signal Q_t , Q_not_t , X , S , R , Y , Z : STD_LOGIC ;

 -- Propagation Delay according to StdentID e.g. 22336688( DEC )
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 = 8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7 =6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1

 begin
 X <= Y nand S after NAND_gate_delay ;
 S <= X nand CLK after NAND_gate_delay ;
 Z <= S and CLK after AND_gate_delay ;
 R <= Z nand Y after NAND_gate_delay ;
 Y <= R nand D after NAND_gate_delay ;
 Q_t <= S nand Q_not_t after NAND_gate_delay ;
 Q_not_t <= R nand Q_t after NAND_gate_delay ;
 Q <= Q_t ;
 Q_not <= Q_not_t ;

 end Behavioral ;