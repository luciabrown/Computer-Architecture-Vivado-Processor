----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2023 02:34:41 PM
-- Design Name: 
-- Module Name: DP_SingleBit_B_Logic_22336688- Behavioral
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

entity CPU_Mux2_32Bit_22336688 is
 Port (S : in STD_LOGIC;
 In0 : in STD_LOGIC_VECTOR (31 downto 0);
 In1 : in STD_LOGIC_VECTOR (31 downto 0);
Z : out STD_LOGIC_VECTOR (31 downto 0));
end CPU_Mux2_32Bit_22336688;

 architecture Behavioral of CPU_Mux2_32Bit_22336688 is
 
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1

signal and000 : std_logic; signal and100 : std_logic; signal S_not : std_logic;
signal and001 : std_logic; signal and101 : std_logic;
signal and002 : std_logic; signal and102 : std_logic;
signal and003 : std_logic; signal and103 : std_logic;
signal and004 : std_logic; signal and104 : std_logic;
signal and005 : std_logic; signal and105 : std_logic;
signal and006 : std_logic; signal and106 : std_logic;
signal and007 : std_logic; signal and107 : std_logic;
signal and008 : std_logic; signal and108 : std_logic;
signal and009 : std_logic; signal and109 : std_logic;
signal and010 : std_logic; signal and110 : std_logic;
signal and011 : std_logic; signal and111 : std_logic;
signal and012 : std_logic; signal and112 : std_logic;
signal and013 : std_logic; signal and113 : std_logic;
signal and014 : std_logic; signal and114 : std_logic;
signal and015 : std_logic; signal and115 : std_logic;
signal and016 : std_logic; signal and116 : std_logic;
signal and017 : std_logic; signal and117 : std_logic;
signal and018 : std_logic; signal and118 : std_logic;
signal and019 : std_logic; signal and119 : std_logic;
signal and020 : std_logic; signal and120 : std_logic;
signal and021 : std_logic; signal and121 : std_logic;
signal and022 : std_logic; signal and122 : std_logic;
signal and023 : std_logic; signal and123 : std_logic;
signal and024 : std_logic; signal and124 : std_logic;
signal and025 : std_logic; signal and125 : std_logic;
signal and026 : std_logic; signal and126 : std_logic;
signal and027 : std_logic; signal and127 : std_logic;
signal and028 : std_logic; signal and128 : std_logic;
signal and029 : std_logic; signal and129 : std_logic;
signal and030 : std_logic; signal and130 : std_logic;
signal and031 : std_logic; signal and131 : std_logic;

begin

S_not <= not S after not_gate_delay;
and000 <= In0(0) and S_not after and_gate_delay;
and100 <= In1(0) and S after and_gate_delay;
Z(0) <= and000 or and100 after or_gate_delay;	

and001 <= In0(1) and S_not after and_gate_delay;
and101 <= In1(1) and S after and_gate_delay;
Z(1) <= and001 or and101 after or_gate_delay;

and002 <= In0(2) and S_not after and_gate_delay;
and102 <= In1(2) and S after and_gate_delay;
Z(2) <= and002 or and102 after or_gate_delay;

and003 <= In0(3) and S_not after and_gate_delay;
and103 <= In1(3) and S after and_gate_delay;
Z(3) <= and003 or and103 after or_gate_delay;

and004 <= In0(4) and S_not after and_gate_delay;
and104 <= In1(4) and S after and_gate_delay;
Z(4) <= and004 or and104 after or_gate_delay;	

and005 <= In0(5) and S_not after and_gate_delay;
and105 <= In1(5) and S after and_gate_delay;
Z(5) <= and005 or and105 after or_gate_delay;

and006 <= In0(6) and S_not after and_gate_delay;
and106 <= In1(6) and S after and_gate_delay;
Z(6) <= and006 or and106 after or_gate_delay;

and007 <= In0(7) and S_not after and_gate_delay;
and107 <= In1(7) and S after and_gate_delay;
Z(7) <= and007 or and107 after or_gate_delay;

and008 <= In0(8) and S_not after and_gate_delay;
and108 <= In1(8) and S after and_gate_delay;
Z(8) <= and008 or and108 after or_gate_delay;	

and009 <= In0(9) and S_not after and_gate_delay;
and109 <= In1(9) and S after and_gate_delay;
Z(9) <= and009 or and109 after or_gate_delay;

and010 <= In0(10) and S_not after and_gate_delay;
and110 <= In1(10) and S after and_gate_delay;
Z(10) <= and010 or and110 after or_gate_delay;

and011<= In0(11) and S_not after and_gate_delay;
and111 <= In1(11) and S after and_gate_delay;
Z(11) <= and011 or and111 after or_gate_delay;

and012 <= In0(12) and S_not after and_gate_delay;
and112 <= In1(12) and S after and_gate_delay;
Z(12) <= and012 or and112 after or_gate_delay;	

and013 <= In0(13) and S_not after and_gate_delay;
and113 <= In1(13) and S after and_gate_delay;
Z(13) <= and013 or and113 after or_gate_delay;

and014 <= In0(14) and S_not after and_gate_delay;
and114 <= In1(14) and S after and_gate_delay;
Z(14) <= and014 or and114 after or_gate_delay;

and015 <= In0(15) and S_not after and_gate_delay;
and115 <= In1(15) and S after and_gate_delay;
Z(15) <= and015 or and115 after or_gate_delay;

and016 <= In0(16) and S_not after and_gate_delay;
and116 <= In1(16) and S after and_gate_delay;
Z(16) <= and016 or and116 after or_gate_delay;	

and017 <= In0(17) and S_not after and_gate_delay;
and117 <= In1(17) and S after and_gate_delay;
Z(17) <= and017 or and117 after or_gate_delay;

and018 <= In0(18) and S_not after and_gate_delay;
and118 <= In1(18) and S after and_gate_delay;
Z(18) <= and018 or and118 after or_gate_delay;

and019 <= In0(19) and S_not after and_gate_delay;
and119 <= In1(19) and S after and_gate_delay;
Z(19) <= and019 or and119 after or_gate_delay;

and020 <= In0(20) and S_not after and_gate_delay;
and120 <= In1(20) and S after and_gate_delay;
Z(20) <= and020 or and120 after or_gate_delay;	

and021<= In0(21) and S_not after and_gate_delay;
and121<= In1(21) and S after and_gate_delay;
Z(21) <= and021 or and121 after or_gate_delay;

and022 <= In0(22) and S_not after and_gate_delay;
and122 <= In1(22) and S after and_gate_delay;
Z(22) <= and022 or and122 after or_gate_delay;

and023 <= In0(23) and S_not after and_gate_delay;
and123 <= In1(23) and S after and_gate_delay;
Z(23) <= and023 or and123 after or_gate_delay;

S_not <= not S after not_gate_delay;
and024 <= In0(24) and S_not after and_gate_delay;
and124 <= In1(24) and S after and_gate_delay;
Z(24) <= and024 or and124 after or_gate_delay;	

and025 <= In0(25) and S_not after and_gate_delay;
and125 <= In1(25) and S after and_gate_delay;
Z(25) <= and025 or and125 after or_gate_delay;

and026 <= In0(26) and S_not after and_gate_delay;
and126 <= In1(26) and S after and_gate_delay;
Z(26) <= and026 or and126 after or_gate_delay;

and027 <= In0(27) and S_not after and_gate_delay;
and127 <= In1(27) and S after and_gate_delay;
Z(27) <= and027 or and127 after or_gate_delay;

S_not <= not S after not_gate_delay;
and028 <= In0(28) and S_not after and_gate_delay;
and128 <= In1(28) and S after and_gate_delay;
Z(28) <= and028 or and128 after or_gate_delay;	

and029 <= In0(29) and S_not after and_gate_delay;
and129 <= In1(29) and S after and_gate_delay;
Z(29) <= and029 or and129 after or_gate_delay;

and030 <= In0(30) and S_not after and_gate_delay;
and130 <= In1(30) and S after and_gate_delay;
Z(30) <= and030 or and130 after or_gate_delay;

and031 <= In0(31) and S_not after and_gate_delay;
and131 <= In1(31) and S after and_gate_delay;
Z(31) <= and031 or and131 after or_gate_delay;

end Behavioral ;
