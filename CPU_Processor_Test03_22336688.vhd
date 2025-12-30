----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/23/2023 06:55:09 PM
-- Design Name: 
-- Module Name: CPU_Processor_Test03_22336688 - Behavioral
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
entity CPU_Processor_Test03_22336688 is
Port ( 
MM: in std_logic;
MW: in std_logic;
FS: in std_logic_vector(4 downto 0);
MB: in std_logic;
MD: in std_logic;
RW: in std_logic;
TA: in std_logic_vector(3 downto 0);
TB: in std_logic_vector(3 downto 0);
IL: in std_logic;
TD: in std_logic_vector(3 downto 0);
Clock: in std_logic;
LoadFlags: in std_logic;
PI: in std_logic;
PL: in std_logic;
Reset: in std_logic;
Reset_C: in std_logic;
Reset_N: in std_logic;
Reset_V: in std_logic;
Reset_Z: in std_logic;
Opcode : out std_logic_vector(16 downto 0);
StatusVector : out std_logic_vector(3 downto 0)
);
end CPU_Processor_Test03_22336688;

architecture Behavioral of CPU_Processor_Test03_22336688 is
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
 
 signal ZeroFill_out, SignExt_out, DP_Add_out, DP_DataOut_out, PC_out, MuxM_out, RAM_out : std_logic_vector(31 downto 0);
 signal C_out, N_out, V_out, Z_out : std_logic;
 signal IR_DR_out, IR_SA_out, IR_SB_out : std_logic_vector(4 downto 0);
 
 component CPU_ZeroFill_22336688
 port(
 SB : in std_logic_vector(4 downto 0);
MuxB : out std_logic_vector(31 downto 0)
 );
 end component;
 
  component CPU_SignExtend_22336688
 port(
 Input : in std_logic_vector(9 downto 0);
Output : out std_logic_vector(31 downto 0)
 );
 end component;
 
  component DP_Datapath_22336688
 port(
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
 end component;
 
  component CPU_PC_22336688
 port(
 Clock : in std_logic;
Displacement : in std_logic_vector(31 downto 0);
PI : in std_logic;
Reset : in std_logic; 
PL : in std_logic;
InstAdd : out std_logic_vector(31 downto 0)
 );
 end component;
 
  component CPU_Mux2_32Bit_22336688
 port(
 S : in STD_LOGIC;
 In0 : in STD_LOGIC_VECTOR (31 downto 0);
 In1 : in STD_LOGIC_VECTOR (31 downto 0);
Z : out STD_LOGIC_VECTOR (31 downto 0)
 );
 end component;
 
  component CPU_RAM_22336688
 port(
 Address : in std_logic_vector(31 downto 0);
Clock : in std_logic;
DataIn : in std_logic_vector(31 downto 0);
WriteEnable : in std_logic;
DataOut : out std_logic_vector(31 downto 0)
 );
 end component;
 
  component CPU_IR_22336688
 port(
 Clock: in std_logic;
IL: in std_logic;
Instruction: in std_logic_vector(31 downto 0);
DR: out std_logic_vector(4 downto 0);
Opcode: out std_logic_vector(16 downto 0);
SA: out std_logic_vector(4 downto 0);
SB: out  std_logic_vector(4 downto 0)
 );
 end component;
 
  component CPU_StatusRegister_22336688
 port(
 Clock : in std_logic;
C_Flag : in std_logic;
Reset_C : in std_logic;
N_Flag : in std_logic;
LoadFlags : in std_logic;
Reset_N : in std_logic;
V_Flag : in std_logic;
Reset_V : in std_logic;
Z_Flag : in std_logic;
Reset_Z : in std_logic;
StatusVector : out std_logic_vector(3 downto 0)
 );
 end component;
 
begin
ZeroFill:CPU_ZeroFill_22336688 port map(
SB=>IR_SB_out,
MuxB=>ZeroFill_out
);
SignExt:CPU_SignExtend_22336688 port map(
Input(9)=>IR_DR_out(4),
Input(8)=>IR_DR_out(3),
Input(7)=>IR_DR_out(2),
Input(6)=>IR_DR_out(1),
Input(5)=>IR_DR_out(0),
Input(4)=>IR_SB_out(4),
Input(3)=>IR_SB_out(3),
Input(2)=>IR_SB_out(2),
Input(1)=>IR_SB_out(1),
Input(0)=>IR_SB_out(0),
Output=>SignExt_out
);
Datapath:DP_Datapath_22336688 port map(
IR_IN=>ZeroFill_out,
MB=>MB,
Reset=>Reset,
DATA_IN=>RAM_out,
MD=>MD,
FS=>FS,
Clock=>Clock,
DR=>IR_DR_out,
RW=>RW,
SA=>IR_SA_out,
SB=>IR_SB_out,
TA=>TA,
TB=>TB,
TD=>TD,
DATA_OUT=>DP_DataOut_out,
C=>C_out,
N=>N_out,
V=>V_out,
Z=>Z_out,
ADD=>DP_Add_out
);
MuxM:CPU_Mux2_32Bit_22336688 port map(
 S=>MM,
 In0=>DP_DataOut_out,
 In1=>PC_out,
 Z=>MuxM_out
);
PC:CPU_PC_22336688 port map(
Clock=>Clock,
Displacement=>SignExt_out,
PI=>PI,
Reset=>Reset,
PL=>PL,
InstAdd=>PC_OUT
);
RAM:CPU_RAM_22336688 port map(
Address=>MuxM_out,
Clock=>Clock,
DataIn=>DP_DataOut_out,
WriteEnable=>MW,
DataOut=>RAM_out
);
InstReg:CPU_IR_22336688 port map(
Clock=>Clock,
IL=>IL,
Instruction=>RAM_out,
DR=>IR_DR_out,
Opcode=>Opcode,
SA=>IR_SA_out,
SB=>IR_SB_out
);
StatReg:CPU_StatusRegister_22336688 port map(
Clock=>Clock,
C_Flag=>C_out,
Reset_C=>Reset_C,
N_Flag=>N_out,
LoadFlags=>LoadFlags,
Reset_N=>Reset_N,
V_Flag=>V_out,
Reset_V=>Reset_V,
Z_Flag=>Z_out,
Reset_Z=>Reset_Z,
StatusVector=>StatusVector
);
end Behavioral;
