----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2023 02:59:11 PM
-- Design Name: 
-- Module Name: DP_32Bit_B_Logic_22336688 - Behavioral
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

entity DP_32Bit_B_Logic_22336688 is
 Port (S0,S1 : in STD_LOGIC;
 B : in STD_LOGIC_VECTOR (31 downto 0);
 --X : out STD_LOGIC_VECTOR (31 downto 0);
 Y : out STD_LOGIC_VECTOR (31 downto 0));
end DP_32Bit_B_Logic_22336688;

architecture Behavioral of DP_32Bit_B_Logic_22336688 is

COMPONENT DP_SingleBit_B_Logic_22336688
 Port (S0,S1 :in STD_LOGIC;
 B : in STD_LOGIC;
-- X : out STD_LOGIC;
 Y : out STD_LOGIC);
 END COMPONENT;

  -- Propagation Delay according to StdentID e.g. 22336688 
 constant AND_gate_delay : Time := 9 ns ; 
 constant NAND_gate_delay : Time := 9 ns ; 
 constant OR_gate_delay : Time := 7 ns ; 
 constant NOR_gate_delay : Time := 7 ns ;
 constant XOR_gate_delay : Time := 4 ns ; 
 constant XNOR_gate_delay : Time := 4 ns ; 
constant NOT_gate_delay : Time := 3 ns ;

begin

-- Instantiate the least significant bit
 bit0 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(0),
Y =>Y(0)
 );

 bit1 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(1),
Y =>Y(1)
 );
  bit2 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(2),
Y =>Y(2)
 );
  bit3 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(3),
Y =>Y(3)
 );
  bit4 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(4),
Y =>Y(4)
 );
  bit5 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(5),
Y =>Y(5)
 );
  bit6 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(6),
Y =>Y(6)
 );
  bit7 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(7),
Y =>Y(7)
 );
  bit8 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(8),
Y =>Y(8)
 );
  bit9 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(9),
Y =>Y(9)
 );
  bit10 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(10),
Y =>Y(10)
 );
  bit11 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(11),
Y =>Y(11)
 );
  bit12 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(12),
Y =>Y(12)
 );
  bit13 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(13),
Y =>Y(13)
 );
  bit14 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(14),
Y =>Y(14)
 );
  bit15: DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(15),
Y =>Y(15)
 );
 
 bit16 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(16),
Y =>Y(16)
 );
 
 -- Instantiate the least significant bit
 bit17 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(17),
Y =>Y(17)
 );
  bit18 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(18),
Y =>Y(18)
 );
  bit19 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(19),
Y =>Y(19)
 );
  bit20 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(20),
Y =>Y(20)
 );
  bit21 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(21),
Y =>Y(21)
 );
  bit22 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(22),
Y =>Y(22)
 );
  bit23 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(23),
Y =>Y(23)
 );
  bit24 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(24),
Y =>Y(24)
 );
  bit25 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(25),
Y =>Y(25)
 );
  bit26 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(26),
Y =>Y(26)
 );
  bit27 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(27),
Y =>Y(27)
 );
  bit28 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(28),
Y =>Y(28)
 );
  bit29 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(29),
Y =>Y(29)
 );
  bit30 : DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(30),
Y =>Y(30)
 );
  bit31: DP_SingleBit_B_Logic_22336688 PORT MAP (
S0 => S0,
S1 => S1,
B => B(31),
Y =>Y(31)
 );



end Behavioral;
