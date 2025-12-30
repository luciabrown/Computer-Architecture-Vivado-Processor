----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 08:22:21 PM
-- Design Name: 
-- Module Name: CPU_Processor_22336688 - Behavioral
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
entity CPU_Processor_22336688 is
Port ( 
Clock: in std_logic;
Reset: in std_logic
);
end CPU_Processor_22336688;

architecture Behavioral of CPU_Processor_22336688 is
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
 
 component  CPU_ControlMemory_22336688
 port(
Address : in std_logic_vector(16 downto 0);
FL : out std_logic;
FS : out std_logic_vector (4 downto 0);
IL : out std_logic;
MB : out std_logic;
MC : out std_logic;
MD : out std_logic;
MM : out std_logic;
MS : out std_logic_vector (2 downto 0);
MW : out std_logic;
NA : out std_logic_vector (16 downto 0);
PI : out std_logic;
PL : out std_logic;
RC : out std_logic;
RN : out std_logic;
RV : out std_logic;
RW : out std_logic;
RZ : out std_logic;
TA : out std_logic_vector (3 downto 0);
TB : out std_logic_vector (3 downto 0);
TD : out std_logic_vector (3 downto 0));
 end component;
 
 component CPU_IR_22336688
 port (Clock: in std_logic;
IL: in std_logic;
Instruction: in std_logic_vector(31 downto 0);
DR: out std_logic_vector(4 downto 0);
Opcode: out std_logic_vector(16 downto 0);
SA: out std_logic_vector(4 downto 0);
SB: out  std_logic_vector(4 downto 0));
 end component;
 
  component CPU_SignExtend_22336688
 port (Input : in std_logic_vector(9 downto 0);
Output : out std_logic_vector(31 downto 0));
 end component;
 
  component CPU_PC_22336688
 port (Clock : in std_logic;
Displacement : in std_logic_vector(31 downto 0);
PI : in std_logic;
Reset : in std_logic; 
PL : in std_logic;
InstAdd : out std_logic_vector(31 downto 0));
 end component;
 
  component CPU_Mux2_32Bit_22336688
 port (S : in STD_LOGIC;
 In0 : in STD_LOGIC_VECTOR (31 downto 0);
 In1 : in STD_LOGIC_VECTOR (31 downto 0);
Z : out STD_LOGIC_VECTOR (31 downto 0));
 end component;
 
  component CPU_RAM_22336688
 port (Address : in std_logic_vector(31 downto 0);
Clock : in std_logic;
DataIn : in std_logic_vector(31 downto 0);
WriteEnable : in std_logic;
DataOut : out std_logic_vector(31 downto 0));
 end component;
 
  component CPU_ZeroFill_22336688
 port (SB : in std_logic_vector(4 downto 0);
MuxB : out std_logic_vector(31 downto 0));
 end component;
 
  component DP_Datapath_22336688
 port (IR_IN : in STD_LOGIC_VECTOR(31 DOWNTO 0);
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
ADD : out STD_LOGIC_VECTOR(31 DOWNTO 0));
 end component;
 
  component CPU_StatusRegister_22336688
 port (Clock : in std_logic;
C_Flag : in std_logic;
Reset_C : in std_logic;
N_Flag : in std_logic;
LoadFlags : in std_logic;
Reset_N : in std_logic;
V_Flag : in std_logic;
Reset_V : in std_logic;
Z_Flag : in std_logic;
Reset_Z : in std_logic;
StatusVector : out std_logic_vector(3 downto 0));
 end component;
 
  component CPU_SMux_22336688
 port (C_Flag : in std_logic;
MS : in std_logic_vector(2 downto 0);
N_Flag: in std_logic;
Not_C_Flag: in std_logic;
Not_Z_Flag: in std_logic;
One: in std_logic;
V_Flag: in std_logic;
Z_Flag: in std_logic;
Zero: in std_logic;
CAR : out std_logic);
 end component;
 
  component CPU_Mux2_17Bit_22336688
 port (In0 : in std_logic_vector(16 downto 0);
In1 :  in std_logic_vector(16 downto 0);
Sel : in std_logic;
Z : out std_logic_vector(16 downto 0));
 end component;
 
  component CPU_CAR_22336688
 port (Address: in std_logic_vector(16 downto 0 );
Clock: in std_logic;
LoadAdd: in std_logic;
Reset :in std_logic;
CMAdd : out std_logic_vector(16 downto 0 ));
 end component;
 
 signal ROM_FL_Out: std_logic:='0';
 signal ROM_FS_Out: std_logic_vector(4 downto 0):= (others => '0');  
 signal ROM_IL_Out: std_logic:='0';
 signal ROM_MB_Out: std_logic:='0';
 signal ROM_MC_Out: std_logic:='0';
 signal ROM_MD_Out: std_logic:='0';
 signal ROM_MM_Out: std_logic:='0';
 signal ROM_MS_Out: std_logic_vector(2 downto 0):= (others => '0');  
 signal ROM_MW_Out: std_logic:='0';
 signal ROM_NA_Out: std_logic_vector(16 downto 0) := (others => '0');  
  signal ROM_PI_Out: std_logic:='0';
 signal ROM_PL_Out: std_logic:='0';
 signal ROM_RC_Out: std_logic:='0';
 signal ROM_RN_Out: std_logic:='0';
 signal ROM_RV_Out,ROM_RW_Out: std_logic:='0';
 signal ROM_RZ_Out: std_logic:='0';
 signal ROM_TA_Out: std_logic_vector(3 downto 0):= (others => '0');     
 signal ROM_TB_Out: std_logic_vector(3 downto 0):= (others => '0');  
 signal ROM_TD_Out: std_logic_vector(3 downto 0):= (others => '0');  
 
 signal IR_DR_Out, IR_SA_Out, IR_SB_Out : std_logic_vector(4 downto 0) := (others => '0');   
 signal IR_Opcode_Out : std_logic_vector(16 downto 0):= (others => '0');  
 
 signal SignExtend_Out,PC_Out, MuxM_Out, ZeroFill_Out, RAM_Out : std_logic_vector(31 downto 0):= (others => '0');
 
 signal Datapath_ADD_Out, Datapath_DATAOUT_Out : std_logic_vector(31 downto 0) := (others => '0');
 signal Datapath_C_Out,Datapath_V_Out,Datapath_N_Out,Datapath_Z_Out : std_logic:='0';
 
 signal StatReg_Out : std_logic_vector(3 downto 0):= (others => '0');
 
 signal MuxC_Out, CAR_Out  : std_logic_vector(16 downto 0):= (others => '0');
 
 signal MuxS_Out :std_logic:='0';

begin
ControlROM:CPU_ControlMemory_22336688 port map(
Address =>CAR_Out,
FL  =>ROM_FL_Out,
FS =>ROM_FS_Out,
IL  =>ROM_IL_Out,
MB  =>ROM_MB_Out,
MC  =>ROM_MC_Out,
MD  =>ROM_MD_Out,
MM  =>ROM_MM_Out,
MS  =>ROM_MS_Out,
MW  =>ROM_MW_Out,
NA  =>ROM_NA_Out,
PI  =>ROM_PI_Out,
PL  =>ROM_PL_Out,
RC  =>ROM_RC_Out,
RN =>ROM_RN_Out,
RV =>ROM_RV_Out,
RZ =>ROM_RZ_Out,
RW=>ROM_RW_Out,
TA  =>ROM_TA_Out,
TB  =>ROM_TB_Out,
TD  =>ROM_TD_Out
);
InstReg:CPU_IR_22336688 port map(
Clock=>Clock,
IL=>ROM_IL_Out,
Instruction=>RAM_Out,
DR=>IR_DR_Out,
Opcode=>IR_Opcode_Out,
SA=>IR_SA_Out,
SB=>IR_SB_Out
);
SignExt:CPU_SignExtend_22336688 port map(
Input(9)=>IR_DR_Out(4),
Input(8)=>IR_DR_Out(3),
Input(7)=>IR_DR_Out(2),
Input(6)=>IR_DR_Out(1),
Input(5)=>IR_DR_Out(0),
Input(4)=>IR_SB_Out(4),
Input(3)=>IR_SB_Out(3),
Input(2)=>IR_SB_Out(2),
Input(1)=>IR_SB_Out(1),
Input(0)=>IR_SB_Out(0),
Output =>SignExtend_Out
);
PC:CPU_PC_22336688 port map(
Clock=>Clock,
Displacement=>SignExtend_Out,
PI =>ROM_PI_Out,
Reset =>Reset,
PL =>ROM_PL_Out,
InstAdd =>PC_Out
);
MuxM:CPU_Mux2_32Bit_22336688 port map(
S =>ROM_MM_Out,
 In0 =>Datapath_ADD_Out,
 In1=>PC_Out,
Z =>MuxM_Out
);
RAM:CPU_RAM_22336688 port map(
Address =>MuxM_Out,
Clock =>Clock,
DataIn =>Datapath_DATAOUT_Out,
WriteEnable =>ROM_MW_Out,
DataOut =>RAM_Out
);
ZeroFill:CPU_ZeroFill_22336688 port map(
SB =>IR_SB_Out,
MuxB=>ZeroFill_Out
);
Datapath:DP_Datapath_22336688 port map(
IR_IN =>ZeroFill_Out,
MB =>ROM_MB_Out,
DATA_IN =>RAM_Out,
MD =>ROM_MD_Out,
FS =>ROM_FS_Out,
Clock =>Clock,
Reset=>Reset,
DR =>IR_DR_Out,
RW =>ROM_RW_Out,
SA =>IR_SA_Out,
SB=>IR_SB_Out,
TA=>ROM_TA_Out,
TB =>ROM_TB_Out,
TD =>ROM_TD_Out,
DATA_OUT=>Datapath_DATAOUT_Out,
C =>Datapath_C_Out,
N=>Datapath_N_Out,
Z=>Datapath_Z_Out,
V =>Datapath_V_Out,
ADD =>Datapath_ADD_Out
);
StatReg:CPU_StatusRegister_22336688 port map(
Clock =>Clock,
C_Flag =>Datapath_C_Out,
Reset_C =>ROM_RC_Out,
N_Flag=>Datapath_N_Out,
LoadFlags =>ROM_FL_Out,
Reset_N=>ROM_RN_Out,
V_Flag =>Datapath_V_Out,
Reset_V =>ROM_RV_Out,
Z_Flag =>Datapath_Z_Out,
Reset_Z =>ROM_RZ_Out,
StatusVector=>StatReg_Out
);
MuxC:CPU_Mux2_17Bit_22336688 port map(
In0 =>ROM_NA_Out,
In1 =>IR_Opcode_Out,
Sel =>ROM_MC_Out,
Z =>MuxC_Out
);
MuxS:CPU_SMux_22336688 port map(
C_Flag =>StatReg_Out(0),
MS =>ROM_MS_Out,
N_Flag=>StatReg_Out(2),
Not_C_Flag=>StatReg_Out(0),
Not_Z_Flag=>StatReg_Out(3),
V_Flag=>StatReg_Out(1),
One=>'1',
Z_Flag=>StatReg_Out(3),
Zero=>'0',
CAR =>MuxS_Out
);
CAR:CPU_CAR_22336688 port map(
Address=>MuxC_Out,
Clock=>Clock,
LoadAdd=>MuxS_Out,
Reset =>Reset,
CMAdd=>CAR_Out
);


end Behavioral;
