----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 08:13:56 PM
-- Design Name: 
-- Module Name: CPU_Mux2_17Bit_22336688 - Behavioral
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

entity CPU_Mux2_17Bit_22336688 is
Port (
In0 : in std_logic_vector(16 downto 0);
In1 :  in std_logic_vector(16 downto 0);
Sel : in std_logic;
Z : out std_logic_vector(16 downto 0)
 );
end CPU_Mux2_17Bit_22336688;

architecture Behavioral of CPU_Mux2_17Bit_22336688 is
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
 
 signal and000, and100, and001, and101, and002, and102, and003,and103,and004,and104,and005,and105,and006,and106,and007,and107,and008,and108,and009,and109: std_logic;
 signal and010, and110, and011, and111, and012, and112, and013,and113,and014,and114,and015,and115,and016,and116,and017,and117, S_not: std_logic;
 
begin
S_not <= not Sel after not_gate_delay;
and000 <= In0(0) and S_not after and_gate_delay;
and100 <= In1(0) and Sel after and_gate_delay;
Z(0) <= and000 or and100 after or_gate_delay;	

and001 <= In0(1) and S_not after and_gate_delay;
and101 <= In1(1) and Sel after and_gate_delay;
Z(1) <= and001 or and101 after or_gate_delay;

and002 <= In0(2) and S_not after and_gate_delay;
and102 <= In1(2) and Sel after and_gate_delay;
Z(2) <= and002 or and102 after or_gate_delay;

and003 <= In0(3) and S_not after and_gate_delay;
and103 <= In1(3) and Sel after and_gate_delay;
Z(3) <= and003 or and103 after or_gate_delay;

and004 <= In0(4) and S_not after and_gate_delay;
and104 <= In1(4) and Sel after and_gate_delay;
Z(4) <= and004 or and104 after or_gate_delay;	

and005 <= In0(5) and S_not after and_gate_delay;
and105 <= In1(5) and Sel after and_gate_delay;
Z(5) <= and005 or and105 after or_gate_delay;

and006 <= In0(6) and S_not after and_gate_delay;
and106 <= In1(6) and Sel after and_gate_delay;
Z(6) <= and006 or and106 after or_gate_delay;

and007 <= In0(7) and S_not after and_gate_delay;
and107 <= In1(7) and Sel after and_gate_delay;
Z(7) <= and007 or and107 after or_gate_delay;

and008 <= In0(8) and S_not after and_gate_delay;
and108 <= In1(8) and Sel after and_gate_delay;
Z(8) <= and008 or and108 after or_gate_delay;	

and009 <= In0(9) and S_not after and_gate_delay;
and109 <= In1(9) and Sel after and_gate_delay;
Z(9) <= and009 or and109 after or_gate_delay;

and010 <= In0(10) and S_not after and_gate_delay;
and110 <= In1(10) and Sel after and_gate_delay;
Z(10) <= and010 or and110 after or_gate_delay;

and011<= In0(11) and S_not after and_gate_delay;
and111 <= In1(11) and Sel after and_gate_delay;
Z(11) <= and011 or and111 after or_gate_delay;

and012 <= In0(12) and S_not after and_gate_delay;
and112 <= In1(12) and Sel after and_gate_delay;
Z(12) <= and012 or and112 after or_gate_delay;	

and013 <= In0(13) and S_not after and_gate_delay;
and113 <= In1(13) and Sel after and_gate_delay;
Z(13) <= and013 or and113 after or_gate_delay;

and014 <= In0(14) and S_not after and_gate_delay;
and114 <= In1(14) and Sel after and_gate_delay;
Z(14) <= and014 or and114 after or_gate_delay;

and015 <= In0(15) and S_not after and_gate_delay;
and115 <= In1(15) and Sel after and_gate_delay;
Z(15) <= and015 or and115 after or_gate_delay;

and016 <= In0(16) and S_not after and_gate_delay;
and116 <= In1(16) and Sel after and_gate_delay;
Z(16) <= and016 or and116 after or_gate_delay;	



end Behavioral;
