----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/23/2023 05:52:08 PM
-- Design Name: 
-- Module Name: CPU_Processor_Test01_22336688 - Behavioral
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
entity CPU_Processor_Test01_22336688 is
Port ( 
MW : in  std_logic;
InstAddress : in std_logic_vector(31 downto 0);
MM : in std_logic;
Clock : in std_logic;
DR : in std_logic_vector(4 downto 0);
FS : in std_logic_vector(4 downto 0);
IR_IN : in std_logic_vector(31 downto 0);
MB : in std_logic;
MD : in std_logic;
RW : in std_logic;
SA : in std_logic_vector(4 downto 0);
SB : in std_logic_vector(4 downto 0);
TA : in std_logic_vector(3 downto 0);
TB : in std_logic_vector(3 downto 0);
TD : in std_logic_vector(3 downto 0);
C:out std_logic;
V:out std_logic;
N:out std_logic;
Z: out std_logic
);
end CPU_Processor_Test01_22336688;

architecture Behavioral of CPU_Processor_Test01_22336688 is
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
 
 signal MuxM_out, RAM_out, DP_Add_out, DP_DataOut_out : std_logic_vector(31 downto 0);
 
 component CPU_Mux2_32Bit_22336688
 port(S : in STD_LOGIC;
 In0 : in STD_LOGIC_VECTOR (31 downto 0);
 In1 : in STD_LOGIC_VECTOR (31 downto 0);
Z : out STD_LOGIC_VECTOR (31 downto 0));
 end component;
 
  component CPU_RAM_22336688
  port(Address : in std_logic_vector(31 downto 0);
Clock : in std_logic;
DataIn : in std_logic_vector(31 downto 0);
WriteEnable : in std_logic;
DataOut : out std_logic_vector(31 downto 0));
 end component;
 
  component DP_Datapath_22336688
  port(IR_IN : in STD_LOGIC_VECTOR(31 DOWNTO 0);
MB : in STD_LOGIC;
DATA_IN : in STD_LOGIC_VECTOR(31 DOWNTO 0);
MD : in STD_LOGIC;
FS : in STD_LOGIC_VECTOR(4 DOWNTO 0);
Clock : in STD_LOGIC;
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

begin
MuxM :  CPU_Mux2_32Bit_22336688 port map(
S=>MM,
In0=>DP_Add_out,
In1=>InstAddress,
Z=>MuxM_out
);
RAM : CPU_RAM_22336688 port map(
Address=>MuxM_out,
Clock=>Clock,
DataIn=>DP_DataOut_out,
WriteEnable=>MW,
DataOut=>RAM_out
);
Datapath: DP_Datapath_22336688 port map(
IR_IN=>IR_IN,
MB=>MB,
DATA_IN=>RAM_out,
MD=>MD,
FS=>FS,
Clock=>Clock,
DR=>DR,
RW=>RW,
SA=>SA,
SB=>SB,
TA=>TA,
TB=>TB,
TD=>TD,
ADD=>DP_Add_out,
DATA_OUT=>DP_DataOut_out,
C=>C,
N=>N,
V=>V,
Z=>Z
);

end Behavioral;
