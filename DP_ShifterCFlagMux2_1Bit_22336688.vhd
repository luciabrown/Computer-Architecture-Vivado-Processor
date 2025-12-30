----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/01/2023 03:18:28 PM
-- Design Name: 
-- Module Name: DP_ShifterCFlagMux2_1Bit_22336688 - Behavioral
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
entity DP_ShifterCFlagMux2_1Bit_22336688 is
Port(
S1 :in std_logic;
S2 : in std_logic;
C : out std_logic;
B : in std_logic_vector (31 downto 0 )
);
end DP_ShifterCFlagMux2_1Bit_22336688;

architecture Behavioral of DP_ShifterCFlagMux2_1Bit_22336688 is

constant AND_gate_delay : Time := 9 ns ; 
 constant NAND_gate_delay : Time := 9 ns ; 
 constant OR_gate_delay : Time := 7 ns ; 
 constant NOR_gate_delay : Time := 7 ns ;
 constant XOR_gate_delay : Time := 4 ns ; 
 constant XNOR_gate_delay : Time := 4 ns ; 
constant NOT_gate_delay : Time := 3 ns ;

signal and0 : std_logic; signal and1 : std_logic;signal  s1_not : std_logic;
signal  s2_not : std_logic;
signal and10 : std_logic; signal and11 : std_logic;
begin
s1_not <= not s1 after not_gate_delay;
s2_not <= not s2 after not_gate_delay;

and0 <= s2 and s1_not after and_gate_delay; --10
and1 <= s2_not and s1 after and_gate_delay; --01

and10 <= and0 and B(31) after and_gate_delay;
and11 <= and1 and B(0) after and_gate_delay;
C <= and10 or and11 after or_gate_delay;
end Behavioral;