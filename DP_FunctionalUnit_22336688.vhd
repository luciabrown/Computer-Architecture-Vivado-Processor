----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2023 11:21:45 AM
-- Design Name: 
-- Module Name: DP_FunctionalUnit_22336688 - Behavioral
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
entity DP_FunctionalUnit_22336688 is
Port(
A : in STD_LOGIC_VECTOR(31 DOWNTO 0);
B : in STD_LOGIC_VECTOR(31 DOWNTO 0);
FS4 : in STD_LOGIC_VECTOR(4 downto 0);
C : out STD_LOGIC;
F : out STD_LOGIC_VECTOR(31 DOWNTO 0);
N : out STD_LOGIC;
Z : out STD_LOGIC;
V : out STD_LOGIC
);
end DP_FunctionalUnit_22336688;

architecture Behavioral of DP_FunctionalUnit_22336688 is
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
 
 COMPONENT DP_Shifter_22336688
 Port(S1,S2 :in STD_LOGIC;
 B : in STD_LOGIC_VECTOR(31 DOWNTO 0);
C : out STD_LOGIC;
 G : out STD_LOGIC_VECTOR(31 DOWNTO 0));
 end component;
  COMPONENT DP_ArithmeticLogicUnit_22336688
 Port(C_IN, S0, S1, S2 : in STD_LOGIC;
 A : in STD_LOGIC_VECTOR (31 downto 0);
 B : in STD_LOGIC_VECTOR (31 downto 0);
G : out STD_LOGIC_VECTOR (31 downto 0);
C, V : out STD_LOGIC);
 end component;
  COMPONENT CPU_Mux2_32Bit_22336688
 Port(S : in STD_LOGIC;
 In0 : in STD_LOGIC_VECTOR (31 downto 0);
 In1 : in STD_LOGIC_VECTOR (31 downto 0);
Z : out STD_LOGIC_VECTOR (31 downto 0));
 end component;
  COMPONENT DP_CFlagMux2_1Bit_22336688
 Port(C_ALU : in std_logic;
C_Shift : in std_logic;
FS4 : in std_logic;
C : out std_logic);
 end component;
 component DP_ZeroDetection_22336688
 Port( F : in STD_LOGIC_VECTOR(31 DOWNTO 0);
Z : out STD_LOGIC);
 end component;
 
 signal CShifterOut : std_logic;
 signal CALUOut : std_logic;
 signal GShifterOut : std_logic_vector(31 downto 0);
 signal GALUOut : std_logic_vector(31 downto 0);
 signal ZMuxOut : std_logic_vector(31 downto 0);
 
begin
Shifter : DP_Shifter_22336688 Port Map
(
S1 =>FS4(2),
S2=>FS4(3),
B=>B,
C=>CShifterOut,
G=>GShifterOut
);
ALU : DP_ArithmeticLogicUnit_22336688 Port Map
(
C_IN=>FS4(0),
S0=>FS4(1),
S1=>FS4(2),
S2=>FS4(3),
A=>A,
B=>B,
G=> GALUOut,
C=>CALUOut,
V=>V
);
MuxF : CPU_Mux2_32Bit_22336688 Port Map
(
S=>FS4(4),
In0=>GALUOut,
In1=>GShifterOut,
Z=>ZMuxOut
);
C_Flag : DP_CFlagMux2_1Bit_22336688 Port Map
(
C_ALU=>CALUOut,
C_Shift=>CShifterOut,
FS4=>FS4(4),
C=>C
);
Z_Flag : DP_ZeroDetection_22336688 Port Map
(
F=>ZMuxOut,
Z=> Z
);
F<=ZMuxOut;
N<=ZMuxOut(31);

end Behavioral;
