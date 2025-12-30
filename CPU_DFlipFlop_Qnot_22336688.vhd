----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2023 11:56:46 AM
-- Design Name: 
-- Module Name: CPU_DFlipFlop_Qnot_22336688 - Behavioral
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
entity CPU_DFlipFlop_Qnot_22336688 is
Port ( 
D : in std_logic;
Clock : in std_logic;
Reset : in std_logic;
Q_not : out std_logic;
Q : out std_logic
);
end CPU_DFlipFlop_Qnot_22336688;

architecture Behavioral of CPU_DFlipFlop_Qnot_22336688 is
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
 
 signal Q_t0, Q_t, Q_not_t0, Q_not_t, Reset_not, X0, X, K, S0, S, R0, R, L, Y0, Y, Z, M : std_logic;

begin
L<=D and R after and_gate_delay; 
Z<=Clock and S after and_gate_delay;
R0<=Z and Y after and_gate_delay;
R<= not R0 after not_gate_delay;
Reset_not<= not Reset after not_gate_delay;
Y0<=Reset_not and L after AND_gate_delay;
Y<= not Y0 after not_gate_delay;
X0<=Y and S after and_gate_Delay;
K<= not X0 and Clock after and_gate_delay;
S0<= K and Reset_not after and_gate_delay;
S<= not S0 after not_gate_delay;
M<=R and Q_t after and_gate_delay;
Q_t0<= S and Q_not_t after and_gate_delay;
Q_not_t0<= M and Reset_not after and_gate_delay;
Q_t<= not Q_t0 after not_gate_delay;
Q_not_t<= not Q_not_t0 after not_gate_delay;

Q_not<=Q_not_t;
Q<=Q_t;


end Behavioral;
