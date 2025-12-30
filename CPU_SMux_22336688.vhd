----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 08:08:29 PM
-- Design Name: 
-- Module Name: CPU_SMux_22336688 - Behavioral
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

entity CPU_SMux_22336688 is
Port ( 
C_Flag : in std_logic;
MS : in std_logic_vector(2 downto 0);
N_Flag: in std_logic;
Not_C_Flag: in std_logic;
Not_Z_Flag: in std_logic;
One: in std_logic;
V_Flag: in std_logic;
Z_Flag: in std_logic;
Zero: in std_logic;

CAR : out std_logic
);
end CPU_SMux_22336688;

architecture Behavioral of CPU_SMux_22336688 is
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
 
 signal S0_not, S1_not, S2_not: std_logic ; 
 signal and0 , and1, and2, and3,and4,and5,and6,and7 : std_logic ;
 signal and00,and01,and10,and11 : std_logic ;
 signal and000,and001,and010,and011,and100,and101,and110,and111 : std_logic ;
 signal or000,or001,or002,or003 : std_logic;
 signal or00,or01: std_logic;

begin
 S0_not <= not MS (0) after not_gate_delay; 
 S1_not <= not MS (1) after not_gate_delay;  
 S2_not <= not MS (2) after not_gate_delay; 

and00 <= S2_not and S1_not after and_gate_delay; 
and000 <= and00 and S0_not after and_gate_delay;  
and0 <= and000 and Zero after and_gate_delay;

and001 <= and00 and MS(0) after and_gate_delay;
and1 <= and001 and One after and_gate_delay; 

and01 <= S2_not and MS(1) after and_gate_delay;
and010 <= and01 and S0_not after and_gate_delay;
and2 <= and010 and C_Flag after and_gate_delay;

and011 <= and01 and MS(0) after and_gate_delay;
and3 <= and011 and V_Flag after and_gate_delay;

and10 <= MS(2) and S1_not after and_gate_delay;
and100 <= and10 and S0_not after and_gate_delay;
and4 <= and100 and Z_Flag after and_gate_delay;

and101 <= and10 and MS(0) after and_gate_delay;
and5 <= and101 and N_Flag after and_gate_delay;

and11 <= MS(2) and MS(1) after and_gate_delay;
and110 <= and11 and S0_not after and_gate_delay;
and6 <= and110 and Not_C_Flag after and_gate_delay;

and111 <= and11 and MS(0) after and_gate_delay;
and7 <= and111 and Not_Z_Flag after and_gate_delay;

or000<=and0 or and1 after or_gate_delay;
or001<=and2 or and3 after or_gate_delay;
or002<=and4 or and5 after or_gate_delay;
or003<=and6 or and7 after or_gate_delay;

or00<=or000 or or001 after or_gate_delay;
or01<=or002 or or003 after or_gate_delay;

CAR<=or00 or or01  after or_gate_delay;


end Behavioral;
