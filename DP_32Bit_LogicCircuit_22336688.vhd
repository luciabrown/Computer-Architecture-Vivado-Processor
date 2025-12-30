----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2023 03:42:17 PM
-- Design Name: 
-- Module Name: DP_32Bit_LogicCircuit_22336688 - Behavioral
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

entity DP_32Bit_LogicCircuit_22336688 is
 Port (S0,S1 : in STD_LOGIC;
 A : in STD_LOGIC_VECTOR (31 downto 0);
 B : in STD_LOGIC_VECTOR (31 downto 0);
 G : out STD_LOGIC_VECTOR (31 downto 0));
end DP_32Bit_LogicCircuit_22336688;

architecture Behavioral of DP_32Bit_LogicCircuit_22336688 is

COMPONENT DP_SingleBit_LogicCircuit_22336688
 Port (S0,S1 :in STD_LOGIC;
 A : in STD_LOGIC;
 B : in STD_LOGIC;
 G : out STD_LOGIC);
 END COMPONENT;
 
  constant AND_gate_delay : Time := 9 ns ; 
 constant NAND_gate_delay : Time := 9 ns ; 
 constant OR_gate_delay : Time := 7 ns ; 
 constant NOR_gate_delay : Time := 7 ns ;
 constant XOR_gate_delay : Time := 4 ns ; 
 constant XNOR_gate_delay : Time := 4 ns ; 
constant NOT_gate_delay : Time := 3 ns ;

begin

 bit0 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(0),
B => B(0),
G => G(0)
 );

 bit1 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(1),
B => B(1),
G => G(1)
 );

 bit2 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(2),
B => B(2),
G => G(2)
 );

 bit3 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(3),
B => B(3),
G => G(3)
 );

 bit4 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(4),
B => B(4),
G => G(4)
 );
 bit5 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(5),
B => B(5),
G => G(5)
 );
  bit6 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(6),
B => B(6),
G => G(6)
 );
  bit7 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(7),
B => B(7),
G => G(7)
 );
  bit8 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(8),
B => B(8),
G => G(8)
 );
  bit9 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(9),
B => B(9),
G => G(9)
 );
  bit10 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(10),
B => B(10),
G => G(10)
 );
  bit11 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(11),
B => B(11),
G => G(11)
 );
  bit12 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(12),
B => B(12),
G => G(12)
 );
  bit13 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(13),
B => B(13),
G => G(13)
 );
  bit14 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(14),
B => B(14),
G => G(14)
 );
  bit15 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(15),
B => B(15),
G => G(15)
 );
  bit16 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(16),
B => B(16),
G => G(16)
 );
  bit17 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(17),
B => B(17),
G => G(17)
 );
  bit18 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(18),
B => B(18),
G => G(18)
 );
  bit19 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(19),
B => B(19),
G => G(19)
 );
  bit20 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(20),
B => B(20),
G => G(20)
 );
  bit21 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(21),
B => B(21),
G => G(21)
 );
  bit22 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(22),
B => B(22),
G => G(22)
 );
  bit23 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(23),
B => B(23),
G => G(23)
 );
  bit24 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(24),
B => B(24),
G => G(24)
 );
  bit25 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(25),
B => B(25),
G => G(25)
 );
  bit26 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(26),
B => B(26),
G => G(26)
 );
  bit27 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(27),
B => B(27),
G => G(27)
 );
  bit28 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(28),
B => B(28),
G => G(28)
 );
  bit29 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,A => A(29),
B => B(29),
G => G(29)
 );
  bit30 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(30),
B => B(30),
G => G(30)
 );
  bit31 : DP_SingleBit_LogicCircuit_22336688 PORT MAP (
S0 => S0,
S1 => S1,
A => A(31),
B => B(31),
G => G(31)
 );

end Behavioral;
