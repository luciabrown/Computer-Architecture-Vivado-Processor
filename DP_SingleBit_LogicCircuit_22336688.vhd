----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2023 03:22:46 PM
-- Design Name: 
-- Module Name: DP_SingleBit_LogicCircuit_22336688 - Behavioral
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

 entity DP_SingleBit_LogicCircuit_22336688 is
 Port (S0,S1 :in STD_LOGIC;
 A : in STD_LOGIC;
 B : in STD_LOGIC;
 G : out STD_LOGIC);
 
 end DP_SingleBit_LogicCircuit_22336688 ;

architecture Behavioral of DP_SingleBit_LogicCircuit_22336688 is
 
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
 
signal AndIN_to_And  : std_logic;signal OrIN_to_And : std_logic;signal XorIN_to_And : std_logic;signal In2 : std_logic;
signal S0_not : std_logic; signal S1_not : std_logic; signal A_not : std_logic;

signal AndAnd_to_Or0 : std_logic; signal OrAnd_to_Or0: std_logic;

signal AndAnd_to_Or : std_logic;signal OrAnd_to_Or : std_logic;signal XorAnd_to_Or0 : std_logic;

signal G1 : std_logic; signal G0 : std_logic; signal XorAnd_to_Or : std_logic; signal NotAnd_to_Or0 : std_logic; signal NotAnd_to_Or : std_logic;

begin

AndIN_to_And<= A and B after and_gate_delay;
OrIN_to_And<= A or B after or_gate_delay;
XorIN_to_And <= A xor B after xor_gate_delay;
A_not <= not A after not_gate_delay;

S0_not <= not S0 after not_gate_delay;
S1_not <= not S1 after not_gate_delay;

AndAnd_to_Or0 <= AndIN_to_And and s0_not after and_gate_delay; --and 00
XorAnd_to_Or0 <= XorIN_to_And and s0_not after and_gate_delay; --xor 01
OrAnd_to_Or0 <= OrIN_to_And and s0 after and_gate_delay; --or 10
NotAnd_to_Or0 <= A_not and s0 after and_gate_delay; -- not 11

AndAnd_to_Or <= AndAnd_to_Or0 and s1_not after and_gate_delay;
OrAnd_to_Or <= OrAnd_to_Or0 and s1_not after and_gate_delay;
XorAnd_to_Or <=  XorAnd_to_Or0 and s1 after and_gate_delay;
NotAnd_to_Or <= NotAnd_to_Or0 and s1 after and_gate_delay;

G1 <= AndAnd_to_Or or OrAnd_to_Or after or_gate_delay;
G0 <= XorAnd_to_Or or G1 after or_gate_delay;
G <= G0  or NotAnd_to_Or after or_gate_delay;

end Behavioral;