----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 08:15:44 PM
-- Design Name: 
-- Module Name: CPU_SignExtend_22336688 - Behavioral
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
entity CPU_SignExtend_22336688 is
Port (
Input : in std_logic_vector(9 downto 0);
Output : out std_logic_vector(31 downto 0)
 );
end CPU_SignExtend_22336688;

architecture Behavioral of CPU_SignExtend_22336688 is
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
begin

Output(0)<=Input(0);
Output(1)<=Input(1);
Output(2)<=Input(2);
Output(3)<=Input(3);
Output(4)<=Input(4);
Output(5)<=Input(5);
Output(6)<=Input(6);
Output(7)<=Input(7);
Output(8)<=Input(8);
Output(9)<=Input(9);

Output(10)<=Input(9);
Output(11)<=Input(9);
Output(12)<=Input(9);
Output(13)<=Input(9);
Output(14)<=Input(9);
Output(15)<=Input(9);
Output(16)<=Input(9);
Output(17)<=Input(9);
Output(18)<=Input(9);
Output(19)<=Input(9);
Output(20)<=Input(9);
Output(21)<=Input(9);
Output(22)<=Input(9);
Output(23)<=Input(9);
Output(24)<=Input(9);
Output(25)<=Input(9);
Output(26)<=Input(9);
Output(27)<=Input(9);
Output(28)<=Input(9);
Output(29)<=Input(9);
Output(30)<=Input(9);
Output(31)<=Input(9);

end Behavioral;
