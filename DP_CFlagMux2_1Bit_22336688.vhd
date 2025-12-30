----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/01/2023 03:00:30 PM
-- Design Name: 
-- Module Name: DP_CFlagMux2_1Bit_22336688 - Behavioral
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
entity DP_CFlagMux2_1Bit_22336688 is
Port(
C_ALU : in std_logic;
C_Shift : in std_logic;
FS4 : in std_logic;
C : out std_logic
);
end DP_CFlagMux2_1Bit_22336688;
architecture Behavioral of DP_CFlagMux2_1Bit_22336688 is

 constant AND_gate_delay : Time := 9 ns ; 
 constant NAND_gate_delay : Time := 9 ns ; 
 constant OR_gate_delay : Time := 7 ns ; 
 constant NOR_gate_delay : Time := 7 ns ;
 constant XOR_gate_delay : Time := 4 ns ; 
 constant XNOR_gate_delay : Time := 4 ns ; 
constant NOT_gate_delay : Time := 3 ns ;

signal and0 : std_logic; signal and1 : std_logic;
signal FS4_not : std_logic;

begin

FS4_not <= not FS4 after not_gate_delay;
and0 <= FS4 and C_Shift after and_gate_delay;
and1 <=FS4_not and C_ALU after and_gate_delay;

c <= and0 or and1 after or_gate_delay;

end Behavioral;
