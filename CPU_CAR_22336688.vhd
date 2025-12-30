----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Lucia Brown
-- 
-- Create Date: 11/20/2023 08:12:15 PM
-- Design Name: 
-- Module Name: CPU_CAR_22336688 - Behavioral
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
entity CPU_CAR_22336688 is
Port ( 
Address: in std_logic_vector(16 downto 0 );
Clock: in std_logic;
LoadAdd: in std_logic;
Reset :in std_logic;
CMAdd : out std_logic_vector(16 downto 0 )
 );
end CPU_CAR_22336688;
architecture Behavioral of CPU_CAR_22336688 is
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
 
 signal Q_SUM_01, Q_SUM_02,Q_SUM_03, Q_SUM_04,Q_SUM_05,Q_SUM_06,Q_SUM_07,Q_SUM_08,Q_SUM_09,Q_SUM_10,Q_SUM_11,Q_SUM_12,Q_SUM_13,Q_SUM_14,Q_SUM_15, Toggle, Load : STD_LOGIC;
 signal Set00,Set01,Set02,Set03,Set04,Set05,Set06,Set07,Set08,Set09,Set10,Set11,Set12,Set13,Set14,Set15,Set16 : STD_LOGIC;
 signal Reset00,Reset01,Reset02,Reset03,Reset04,Reset05,Reset06,Reset07,Reset08,Reset09,Reset10,Reset11,Reset12,Reset13,Reset14,Reset15,Reset16: STD_LOGIC;
 signal Toggle01,Toggle02,Toggle03,Toggle04,Toggle05,Toggle06,Toggle07,Toggle08,Toggle09,Toggle10,Toggle11,Toggle12,Toggle13,Toggle14,Toggle15,Toggle16 : STD_LOGIC;
 signal K00,K01,K02,K03,K04,K05,K06,K07,K08,K09,K10,K11,K12,K13,K14,K15,K16 : STD_LOGIC;
 signal J00,J01,J02,J03,J04,J05,J06,J07,J08,J09,J10,J11,J12,J13,J14,J15,J16: STD_LOGIC;
 signal flipFlops_out: STD_LOGIC_VECTOR(16 downto 0);
 
 COMPONENT CPU_JKFlipFlop_22336688 PORT(
 K : in std_logic;
J : in std_logic;
Clock : in std_logic;
Reset : in std_logic;
Q : out std_logic
 );
 END COMPONENT;
 
 begin
Q_SUM_01<= flipFlops_out(0) and flipFlops_out(1) after and_gate_delay;
Q_SUM_02<=Q_SUM_01 and flipFlops_out(2) after and_gate_delay;
Q_SUM_03<=Q_SUM_02 and flipFlops_out(3) after and_gate_delay;
Q_SUM_04<=Q_SUM_03 and flipFlops_out(4) after and_gate_delay;
Q_SUM_05<=Q_SUM_04 and flipFlops_out(5) after and_gate_delay;
Q_SUM_06<=Q_SUM_05 and flipFlops_out(6) after and_gate_delay;
Q_SUM_07<=Q_SUM_06 and flipFlops_out(7) after and_gate_delay;
Q_SUM_08<=Q_SUM_07 and flipFlops_out(8) after and_gate_delay;
Q_SUM_09<=Q_SUM_08 and flipFlops_out(9) after and_gate_delay;
Q_SUM_10<=Q_SUM_09 and flipFlops_out(10) after and_gate_delay;
Q_SUM_11<=Q_SUM_10 and flipFlops_out(11) after and_gate_delay;
Q_SUM_12<=Q_SUM_11 and flipFlops_out(12) after and_gate_delay;
Q_SUM_13<=Q_SUM_12 and flipFlops_out(13) after and_gate_delay;
Q_SUM_14<=Q_SUM_13 and flipFlops_out(14) after and_gate_delay;
Q_SUM_15<=Q_SUM_14 and flipFlops_out(15) after and_gate_delay;

 Toggle<= not LoadAdd after not_gate_delay;
 Load<= not Toggle after not_gate_delay;
 
 Set00<= Address(0) and  not Toggle after and_gate_delay;
 Set01<= Address(1)  and  Load after and_gate_delay;
 Set02<= Address(2)  and  Load after and_gate_delay;
 Set03<= Address(3)  and  Load after and_gate_delay;
 Set04<= Address(4)  and  Load after and_gate_delay;
 Set05<= Address(5)  and  Load after and_gate_delay;
 Set06<= Address(6)  and  Load after and_gate_delay;
 Set07<= Address(7)  and  Load after and_gate_delay;
 Set08<= Address(8)  and  Load after and_gate_delay;
 Set09<= Address(9)  and  Load after and_gate_delay;
 Set10<= Address(10)  and  Load after and_gate_delay;
 Set11<= Address(11)  and  Load after and_gate_delay;
 Set12<= Address(12)  and  Load after and_gate_delay;
 Set13<= Address(13)  and  Load after and_gate_delay;
 Set14<= Address(14)  and  Load after and_gate_delay;
 Set15<= Address(15)  and  Load after and_gate_delay;
 Set16<= Address(16)  and Load after and_gate_delay;
 
 Reset00<= not Address(0) and  not Toggle after and_gate_delay;
 Reset01<= not Address(1) and  Load after and_gate_delay;
 Reset02<= not Address(2) and  Load after and_gate_delay;
 Reset03<= not Address(3) and  Load after and_gate_delay;
 Reset04<= not Address(4) and  Load after and_gate_delay;
 Reset05<= not Address(5) and  Load after and_gate_delay;
 Reset06<= not Address(6) and  Load after and_gate_delay;
 Reset07<= not Address(7) and  Load after and_gate_delay;
 Reset08<= not Address(8) and  Load after and_gate_delay;
 Reset09<= not Address(9) and  Load after and_gate_delay;
 Reset10<= not Address(10) and  Load after and_gate_delay;
 Reset11<= not Address(11) and  Load after and_gate_delay;
 Reset12<= not Address(12) and  Load after and_gate_delay;
 Reset13<= not Address(13) and  Load after and_gate_delay;
 Reset14<= not Address(14) and  Load after and_gate_delay;
 Reset15<= not Address(15) and  Load after and_gate_delay;
 Reset16<= not Address(16) and  Load after and_gate_delay;
 
 Toggle01<= Toggle and flipFlops_out(0) after and_gate_delay;
 Toggle02<=Toggle and Q_SUM_01 after and_gate_delay;
 Toggle03<=Toggle and Q_SUM_02 after and_gate_delay;
 Toggle04<=Toggle and Q_SUM_03 after and_gate_delay;
 Toggle05<=Toggle and Q_SUM_04 after and_gate_delay;
 Toggle06<=Toggle and Q_SUM_05 after and_gate_delay;
Toggle07<=Toggle and Q_SUM_06 after and_gate_delay;
Toggle08<=Toggle and Q_SUM_07 after and_gate_delay;
Toggle09<=Toggle and Q_SUM_08 after and_gate_delay;
Toggle10<=Toggle and Q_SUM_09 after and_gate_delay;
Toggle11<=Toggle and Q_SUM_10 after and_gate_delay;
Toggle12<=Toggle and Q_SUM_11 after and_gate_delay;
Toggle13<=Toggle and Q_SUM_12 after and_gate_delay;
Toggle14<=Toggle and Q_SUM_13 after and_gate_delay;
Toggle15<=Toggle and Q_SUM_14 after and_gate_delay;
Toggle16<=Toggle and Q_SUM_15 after and_gate_delay;

J00<=Set00 or Toggle  after or_gate_Delay;
J01<=Set01 or Toggle01 after or_gate_Delay;
J02<=Set02 or Toggle02 after or_gate_Delay;
J03<=Set03 or Toggle03 after or_gate_Delay;
J04<=Set04 or Toggle04 after or_gate_Delay;
J05<=Set05 or Toggle05 after or_gate_Delay;
J06<=Set06 or Toggle06 after or_gate_Delay;
J07<=Set07 or Toggle07 after or_gate_Delay;
J08<=Set08 or Toggle08 after or_gate_Delay;
J09<=Set09 or Toggle09 after or_gate_Delay;
J10<=Set10 or Toggle10 after or_gate_Delay;
J11<=Set11 or Toggle11 after or_gate_Delay;
J12<=Set12 or Toggle12 after or_gate_Delay;
J13<=Set13 or Toggle13 after or_gate_Delay;
J14<=Set14 or Toggle14 after or_gate_Delay;
J15<=Set15 or Toggle15 after or_gate_Delay;
J16<=Set16 or Toggle16 after or_gate_Delay;
K00<=Reset00 or  Toggle  after or_gate_Delay;
K01<=Reset01 or  Toggle01 after or_gate_Delay;
K02<=Reset02 or  Toggle02 after or_gate_Delay;
K03<=Reset03 or  Toggle03 after or_gate_Delay;
K04<=Reset04 or  Toggle04 after or_gate_Delay;
K05<=Reset05 or  Toggle05 after or_gate_Delay;
K06<=Reset06 or  Toggle06 after or_gate_Delay;
K07<=Reset07 or  Toggle07 after or_gate_Delay;
K08<=Reset08 or  Toggle08 after or_gate_Delay;
K09<=Reset09 or  Toggle09 after or_gate_Delay;
K10<=Reset10 or  Toggle10 after or_gate_Delay;
K11<=Reset11 or  Toggle11 after or_gate_Delay;
K12<=Reset12 or  Toggle12 after or_gate_Delay;
K13<=Reset13 or  Toggle13 after or_gate_Delay;
K14<=Reset14 or  Toggle14 after or_gate_Delay;
K15<=Reset15 or  Toggle15 after or_gate_Delay;
K16<=Reset16 or  Toggle16 after or_gate_Delay;

JKFlipFlop00:CPU_JKFlipFlop_22336688 port map(
J=>J00,
K=>K00,
Clock=>Clock,
Reset=>Reset,
Q=>flipFlops_out(0)

);
JKFlipFlop01:CPU_JKFlipFlop_22336688 port map(
J=>J01,
K=>K01,
Clock=>Clock,
Reset=>Reset,
Q=>flipFlops_out(1)

);
JKFlipFlop02:CPU_JKFlipFlop_22336688 port map(
J=>J02,
K=>K02,
Clock=>Clock,
Reset=>Reset,
Q=>flipFlops_out(2)

);
JKFlipFlop03:CPU_JKFlipFlop_22336688 port map(
J=>J03,
K=>K03,
Clock=>Clock,
Reset=>Reset,
Q=>flipFlops_out(3)

);
JKFlipFlop04:CPU_JKFlipFlop_22336688 port map(
J=>J04,
K=>K04,
Clock=>Clock,
Reset=>Reset,
Q=>flipFlops_out(4)

);
JKFlipFlop05:CPU_JKFlipFlop_22336688 port map(
J=>J05,
K=>K05,
Clock=>Clock,
Reset=>Reset,
Q=>flipFlops_out(5)

);
JKFlipFlop06:CPU_JKFlipFlop_22336688 port map(
J=>J06,
K=>K06,
Clock=>Clock,
Reset=>Reset,
Q=>flipFlops_out(6)

);
JKFlipFlop07:CPU_JKFlipFlop_22336688 port map(
J=>J07,
K=>K07,
Clock=>Clock,
Reset=>Reset,
Q=>flipFlops_out(7)

);
JKFlipFlop08:CPU_JKFlipFlop_22336688 port map(
J=>J08,
K=>K08,
Clock=>Clock,
Reset=>Reset,
Q=>flipFlops_out(8)

);
JKFlipFlop09:CPU_JKFlipFlop_22336688 port map(
J=>J09,
K=>K09,
Clock=>Clock,
Reset=>Reset,
Q=>flipFlops_out(9)

);
JKFlipFlop10:CPU_JKFlipFlop_22336688 port map(
J=>J10,
K=>K10,
Clock=>Clock,
Reset=>Reset,
Q=>flipFlops_out(10)

);
JKFlipFlop11:CPU_JKFlipFlop_22336688 port map(
J=>J11,
K=>K11,
Clock=>Clock,
Reset=>Reset,
Q=>flipFlops_out(11)

);
JKFlipFlop12:CPU_JKFlipFlop_22336688 port map(
J=>J12,
K=>K12,
Clock=>Clock,
Reset=>Reset,
Q=>flipFlops_out(12)

);
JKFlipFlop13:CPU_JKFlipFlop_22336688 port map(
J=>J13,
K=>K13,
Clock=>Clock,
Reset=>Reset,
Q=>flipFlops_out(13)

);
JKFlipFlop14:CPU_JKFlipFlop_22336688 port map(
J=>J14,
K=>K14,
Clock=>Clock,
Reset=>Reset,
Q=>flipFlops_out(14)

);
JKFlipFlop15:CPU_JKFlipFlop_22336688 port map(
J=>J15,
K=>K15,
Clock=>Clock,
Reset=>Reset,
Q=>flipFlops_out(15)

);
JKFlipFlop16:CPU_JKFlipFlop_22336688 port map(
J=>J16,
K=>K16,
Clock=>Clock,
Reset=>Reset,
Q=>flipFlops_out(16)
);
CMAdd(0)<=flipFlops_out(0);
CMAdd(1)<=flipFlops_out(1);
CMAdd(2)<=flipFlops_out(2);
CMAdd(3)<=flipFlops_out(3);
CMAdd(4)<=flipFlops_out(4);
CMAdd(5)<=flipFlops_out(5);
CMAdd(6)<=flipFlops_out(6);
CMAdd(7)<=flipFlops_out(7);
CMAdd(8)<=flipFlops_out(8);
CMAdd(9)<=flipFlops_out(9);
CMAdd(10)<=flipFlops_out(10);
CMAdd(11)<=flipFlops_out(11);
CMAdd(12)<=flipFlops_out(12);
CMAdd(13)<=flipFlops_out(13);
CMAdd(14)<=flipFlops_out(14);
CMAdd(15)<=flipFlops_out(15);
CMAdd(16)<=flipFlops_out(16);


end Behavioral;
