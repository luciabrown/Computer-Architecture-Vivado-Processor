----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2023 12:32:36 PM
-- Design Name: 
-- Module Name: CPU_JKFlipFlop_22336688 - Behavioral
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
entity CPU_JKFlipFlop_22336688 is
Port (
K : in std_logic;
J : in std_logic;
Clock : in std_logic;
Reset : in std_logic;
Q : out std_logic;
Q_not : out std_logic
 );
end CPU_JKFlipFlop_22336688;

architecture Behavioral of CPU_JKFlipFlop_22336688 is
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
 
 signal K_notand_Q, J_andQ_not, OR_to_D, Q_out, Q_not_out : std_logic;
 
 component CPU_DFlipFlop_Qnot_22336688 port(
 D : in std_logic;
Clock : in std_logic;
Reset : in std_logic;
Q_not : out std_logic;
Q : out std_logic
 );
 end component;

begin
K_notand_Q<= not K and Q_out after and_gate_delay;
J_andQ_not<= J and Q_not_out after and_gate_delay;
OR_to_D<= K_notand_Q or J_andQ_not after or_gate_delay;

DFlipFlop : CPU_DFlipFlop_Qnot_22336688 port map(
Clock=>Clock,
D=>OR_to_D,
Reset=>Reset,
Q=>Q_out,
Q_not=>Q_not_out
);

Q<=Q_out;
Q_not<=Q_not_out;

end Behavioral;
