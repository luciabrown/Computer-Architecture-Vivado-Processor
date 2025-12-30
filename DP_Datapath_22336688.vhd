----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2023 07:26:12 PM
-- Design Name: 
-- Module Name: DP_Datapath_22336688 - Behavioral
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

entity DP_Datapath_22336688 is
Port ( 
IR_IN : in STD_LOGIC_VECTOR(31 DOWNTO 0);
MB : in STD_LOGIC;
DATA_IN : in STD_LOGIC_VECTOR(31 DOWNTO 0);
MD : in STD_LOGIC;
FS : in STD_LOGIC_VECTOR(4 DOWNTO 0);
Clock, Reset : in STD_LOGIC;
DR : in STD_LOGIC_VECTOR(4 DOWNTO 0);
RW : in STD_LOGIC;
SA : in STD_LOGIC_VECTOR(4 DOWNTO 0);
SB : in STD_LOGIC_VECTOR(4 DOWNTO 0);
TA : in STD_LOGIC_VECTOR(3 DOWNTO 0);
TB : in STD_LOGIC_VECTOR(3 DOWNTO 0);
TD : in STD_LOGIC_VECTOR(3 DOWNTO 0);
DATA_OUT : out STD_LOGIC_VECTOR(31 DOWNTO 0);
C : out STD_LOGIC;
N : out STD_LOGIC;
Z : out STD_LOGIC;
V : out STD_LOGIC;
ADD : out STD_LOGIC_VECTOR(31 DOWNTO 0)
);
end DP_Datapath_22336688;

architecture Behavioral of DP_Datapath_22336688 is
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
 COMPONENT DP_FunctionalUnit_22336688
 PORT(
A : in STD_LOGIC_VECTOR(31 DOWNTO 0);
B : in STD_LOGIC_VECTOR(31 DOWNTO 0);
FS4 : in STD_LOGIC_VECTOR(4 downto 0);
C : out STD_LOGIC;
F : out STD_LOGIC_VECTOR(31 DOWNTO 0);
N : out STD_LOGIC;
Z : out STD_LOGIC;
V : out STD_LOGIC
 );
 END COMPONENT;
 COMPONENT RF_RegisterFile_32_15_22336688
 PORT(
  CLOCK, Reset : in STD_LOGIC;
  D : in STD_LOGIC_VECTOR (31 downto 0);
  DR : in STD_LOGIC_VECTOR (4 downto 0);
  RW : in STD_LOGIC;
  SA : in STD_LOGIC_VECTOR (4 downto 0);
  SB : in STD_LOGIC_VECTOR (4 downto 0);
  TA : in STD_LOGIC_VECTOR (3 downto 0);
  TB : in STD_LOGIC_VECTOR (3 downto 0);
  TD : in STD_LOGIC_VECTOR (3 downto 0);
  A :  out STD_LOGIC_VECTOR (31 downto 0);
  B :  out STD_LOGIC_VECTOR (31 downto 0)
 );
 END COMPONENT;
 
 signal RegFileAOut : std_logic_vector(31 downto 0);
 signal RegFileBOut : std_logic_vector(31 downto 0);
 signal MuxBOut : std_logic_vector(31 downto 0);
 signal MuxDOut : std_logic_vector(31 downto 0);
 signal FunctionalUnitOut : std_logic_vector(31 downto 0);

begin
MuxB : CPU_Mux2_32Bit_22336688 Port map
(
S=>MB,
In0=>RegFileBOut,
In1=>IR_IN,
Z=>MuxBOut
);
MuxD : CPU_Mux2_32Bit_22336688 Port map(
S=>MD,
In0=>FunctionalUnitOut,
In1=>DATA_IN,
Z=>MuxDOut
);
FunctionalUnit : DP_FunctionalUnit_22336688 Port map(
FS4=>FS,
B=>MuxBOut,
A=>RegFileAOut,
C=>C,
N=>N,
Z=>Z,
V=>V,
F=>FunctionalUnitOut
);
RegFile :RF_RegisterFile_32_15_22336688 Port map(
Clock=>Clock,
Reset=>Reset,
D=>MuxDOut,
DR=>DR,
RW=>RW,
SA=>SA,
SB=>SB,
TA=>TA,
TB=>TB,
TD=>TD,
A=>RegFileAOut,
B=>RegFileBOut
);

DATA_OUT<=MuxBOut;
ADD<=RegFileAOut;


end Behavioral;
