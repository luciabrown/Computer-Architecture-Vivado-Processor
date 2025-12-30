----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 02:26:10 PM
-- Design Name: 
-- Module Name: CPU_PC_22336688 - Behavioral
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
entity CPU_PC_22336688 is
Port(
Clock : in std_logic;
Displacement : in std_logic_vector(31 downto 0); --32-bit vector for program counter increment
PI : in std_logic; --Input for a conditional branch
Reset : in std_logic; 
PL : in std_logic; --Load signal for the program counter
InstAdd : out std_logic_vector(31 downto 0) --Output representing the current instruction address.
);
end CPU_PC_22336688;


architecture Behavioral of CPU_PC_22336688 is
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
 
 COMPONENT CPU_Mux2_32Bit_22336688
 PORT(S : in STD_LOGIC;
 In0 : in STD_LOGIC_VECTOR (31 downto 0);
 In1 : in STD_LOGIC_VECTOR (31 downto 0);
Z : out STD_LOGIC_VECTOR (31 downto 0));
 END COMPONENT;
 COMPONENT DP_RippleCarryAdder32Bit_22336688
 PORT(
 x , y : in STD_LOGIC_VECTOR (31 downto 0) ;
 c_in : in STD_LOGIC ;
 s : out STD_LOGIC_VECTOR (31 downto 0)
);
 END COMPONENT;
 COMPONENT RF_Register32Bit_22336688
 PORT(CLK : in STD_LOGIC;
 D : in STD_LOGIC_VECTOR (31 downto 0) ;
 Load, Reset : in STD_LOGIC;
 Q  : out STD_LOGIC_VECTOR (31 downto 0));
 END COMPONENT;
 
 signal PL_PI_Mux_Out : STD_LOGIC_VECTOR (31 downto 0);
 signal Adder_Out : STD_LOGIC_VECTOR (31 downto 0);
 signal ResetMux_Out : STD_LOGIC_VECTOR (31 downto 0);
 signal PC_Out : STD_LOGIC_VECTOR (31 downto 0);
 signal PCLoad0: STD_LOGIC;
 signal PCLoad: STD_LOGIC;
 
begin
PCLoad0 <= Reset or PL after or_gate_delay;
PCLoad <=PI or PCLoad0 after or_gate_delay;

PL_PI_Mux:CPU_Mux2_32Bit_22336688 Port map
(
S=>PI,
In0=>Displacement,
In1=>X"00000001",
Z=>PL_PI_Mux_Out
);
Adder:DP_RippleCarryAdder32Bit_22336688 port map
(
x=>PC_Out,
y=>PL_PI_Mux_Out,
c_in=>'0',
s=>Adder_Out
);
ResetMux:CPU_Mux2_32Bit_22336688 port map
(
S=>Reset,
In0=>Adder_Out,
In1=>X"00000008",
Z=>ResetMux_Out
);
PC: RF_Register32Bit_22336688 port map
(
CLK=>Clock, 
Reset=>Reset,
D=>ResetMux_Out,
LOAD=>PCLoad,
Q=>PC_Out
);

InstAdd(31 downto 0)<=PC_Out(31 downto 0);

end Behavioral;
