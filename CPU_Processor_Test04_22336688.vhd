----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/25/2023 12:14:55 PM
-- Design Name: 
-- Module Name: CPU_Processor_Test04_22336688 - Behavioral
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
entity CPU_Processor_Test04_22336688 is
Port (
StatusVector : in std_logic_vector(3 downto 0);
Clock : in std_logic;
Reset : in std_logic;
Opcode : in std_logic_vector(16 downto 0);
FL : out std_logic;
FS : out std_logic_vector (4 downto 0);
IL : out std_logic;
MB : out std_logic;
MD : out std_logic;
MM : out std_logic;
MW : out std_logic;
PI : out std_logic;
PL : out std_logic;
RC : out std_logic;
RN : out std_logic;
RV : out std_logic;
RZ : out std_logic;
TA : out std_logic_vector (3 downto 0);
TB : out std_logic_vector (3 downto 0);
TD : out std_logic_vector (3 downto 0)

 );
end CPU_Processor_Test04_22336688;

architecture Behavioral of CPU_Processor_Test04_22336688 is
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
 
 signal  CAR_out, MuxC_out, NA_out : std_logic_vector (16 downto 0);
 signal  MC_out, MuxS_out : std_logic;
 signal MS_out : std_logic_vector(2 downto 0);
  
  component CPU_SMux_22336688
  port(
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
  end component;
  
    component CPU_Mux2_17Bit_22336688
  port(
  In0 : in std_logic_vector(16 downto 0);
In1 :  in std_logic_vector(16 downto 0);
Sel : in std_logic;
Z : out std_logic_vector(16 downto 0)
  );
  end component;
  
    component CPU_CAR_22336688
  port(
  Address: in std_logic_vector(16 downto 0 );
Clock: in std_logic;
LoadAdd: in std_logic;
Reset :in std_logic;
CMAdd : out std_logic_vector(16 downto 0 )
  );
  end component;
  
    component CPU_ControlMemory_22336688
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
RW : out std_logic;
RV : out std_logic;
RZ : out std_logic;
TA : out std_logic_vector (3 downto 0);
TB : out std_logic_vector (3 downto 0);
TD : out std_logic_vector (3 downto 0)
  );
  end component;

begin
MuxS:CPU_SMux_22336688 port map(
C_Flag=>StatusVector(0),
MS=>MS_out,
N_Flag=>StatusVector(2),
Not_C_Flag=>StatusVector(0),
Not_Z_Flag=>StatusVector(3),
One=>'1',
V_Flag=>StatusVector(1),
Z_Flag=>StatusVector(3),
Zero=>'0',
CAR=>MuxS_out

);
MuxC:CPU_Mux2_17Bit_22336688 port map(
In0=>NA_out,
In1=>Opcode,
Sel=>MC_out,
Z=>MuxC_out
);
CAR: CPU_CAR_22336688 port map(
Address=>MuxC_out,
Clock=>Clock,
LoadAdd=>MuxS_out,
Reset=>Reset,
CMAdd=>CAR_out
);
ControlROM:CPU_ControlMemory_22336688 port map(
Address=>CAR_out,
FL=>FL,
FS=>FS,
IL=>IL,
MB=>MB,
MC=>MC_out,
MD=>MD,
MM=>MM,
MS=>MS_out,
MW=>MW,
NA=>NA_out,
PI=>PI,
PL=>PL,
RC=>RC,
RN=>RN,
RV=>RV,
RZ=>RZ,
TA=>TA,
TB=>TB,
TD=>TD
);


end Behavioral;
