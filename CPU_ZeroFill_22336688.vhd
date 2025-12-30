----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 08:05:01 PM
-- Design Name: 
-- Module Name: CPU_ZeroFill_22336688 - Behavioral
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
entity CPU_ZeroFill_22336688 is
Port (
SB : in std_logic_vector(4 downto 0);
MuxB : out std_logic_vector(31 downto 0)
 );
end CPU_ZeroFill_22336688;

architecture Behavioral of CPU_ZeroFill_22336688 is
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1


begin
 MuxB(0)<=SB(0);
 MuxB(1)<=SB(1);
 MuxB(2)<=SB(2);
 MuxB(3)<=SB(3);
 MuxB(4)<=SB(4);
 
MuxB(5)<='0';
MuxB(6)<='0';
MuxB(7)<='0';
MuxB(8)<='0';
MuxB(9)<='0';
MuxB(10)<='0';
MuxB(11)<='0';
MuxB(12)<='0';
MuxB(13)<='0';
MuxB(14)<='0';
MuxB(15)<='0';
MuxB(16)<='0';
MuxB(17)<='0';
MuxB(18)<='0';
MuxB(19)<='0';
MuxB(20)<='0';
MuxB(21)<='0';
MuxB(22)<='0';
MuxB(23)<='0';
MuxB(24)<='0';
MuxB(25)<='0';
MuxB(26)<='0';
MuxB(27)<='0';
MuxB(28)<='0';
MuxB(29)<='0';
MuxB(30)<='0';
MuxB(31)<='0';
end Behavioral;
