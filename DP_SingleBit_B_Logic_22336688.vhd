----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2023 02:34:41 PM
-- Design Name: 
-- Module Name: DP_SingleBit_B_Logic_22336688- Behavioral
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

 entity DP_SingleBit_B_Logic_22336688 is
 Port (S0,S1 :in STD_LOGIC;
 B : in STD_LOGIC;
 Y : out STD_LOGIC);
 
 end DP_SingleBit_B_Logic_22336688 ;

 architecture Behavioral of DP_SingleBit_B_Logic_22336688 is
 
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
 
 signal and00 , and01 : std_logic ;
 signal B_not  : std_logic ;
 
 begin
    
 B_not <= not B after not_gate_delay;

 and00 <= B and S0 after and_gate_delay;
 and01 <= B_not and S1 after and_gate_delay;

 Y <= and00 or and01 after or_gate_delay;


 end Behavioral ;