----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Lucia Brown
-- 
-- Create Date: 11/03/2023 10:30:02 AM
-- Design Name: 
-- Module Name: DP_ZeroDetection_22336688 - Behavioral
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
entity DP_ZeroDetection_22336688 is
Port(
 F : in STD_LOGIC_VECTOR(31 DOWNTO 0);
Z : out STD_LOGIC);
end DP_ZeroDetection_22336688;

architecture Behavioral of DP_ZeroDetection_22336688 is

 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
 
 signal or00, or01, or02, or03,or04,or05,or06,or07,or08,or09,or010,or011,or012,or013,or014,or015 : std_logic;
signal or10,or11,or12,or13,or14,or15,or16,or17 :std_logic;
signal or20,or21,or22,or23 : std_logic;
signal or30,or31 : std_logic;
begin
or00 <= F(0) or F(1) after or_gate_delay;
or01<=F(2) or F(3) after or_gate_delay;
or02<=F(4) or F(5) after or_gate_delay;
or03<=F(6) or F(7) after or_gate_delay;
or04<=F(8) or F(9) after or_gate_delay;
or05<=F(10) or F(11) after or_gate_delay;
or06<=F(12) or F(13) after or_gate_delay;
or07<=F(14) or F(15) after or_gate_delay;
or08<=F(16) or F(17) after or_gate_delay;
or09<=F(18) or F(19) after or_gate_delay;
or010<=F(20) or F(21) after or_gate_delay;
or011<=F(22) or F(23) after or_gate_delay;
or012<=F(24) or F(25) after or_gate_delay;
or013<=F(26) or F(27) after or_gate_delay;
or014<=F(28) or F(29) after or_gate_delay;
or015<=F(30) or F(31) after or_gate_delay;

or10<=or00 or or01 after or_gate_delay;
or11<=or02 or or03 after or_gate_delay;
or12<=or04 or or05 after or_gate_delay;
or13<=or06 or or07 after or_gate_delay;
or14<=or08 or or09 after or_gate_delay;
or15<=or010 or or011 after or_gate_delay;
or16<=or012 or or013 after or_gate_delay;
or17<=or014 or or015 after or_gate_delay;

or20<=or10 or or11 after or_gate_delay;
or21<=or12 or or13 after or_gate_delay;
or22<=or14 or or15 after or_gate_delay;
or23<=or16 or or17 after or_gate_delay;

or30<=or20 or or21 after or_gate_delay;
or31<=or22 or or23 after or_gate_delay;

Z<= or30 nor or31 after nor_gate_delay;

end Behavioral;
