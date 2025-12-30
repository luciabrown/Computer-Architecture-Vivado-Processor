----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Lucia Brown
-- 
-- Create Date: 10/31/2023 05:01:50 PM
-- Design Name: 
-- Module Name: DP_ArithmeticLogicUnit_22336688 - Behavioral
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

entity DP_ArithmeticLogicUnit_22336688 is
 Port (C_IN, S0, S1, S2 : in STD_LOGIC;
 A : in STD_LOGIC_VECTOR (31 downto 0);
 B : in STD_LOGIC_VECTOR (31 downto 0);
G : out STD_LOGIC_VECTOR (31 downto 0);
C, V : out STD_LOGIC);
end DP_ArithmeticLogicUnit_22336688;

architecture Behavioral of DP_ArithmeticLogicUnit_22336688 is
 
 signal BLogic_out : STD_LOGIC_VECTOR (31 downto 0);
 signal LogicCircuit_out : STD_LOGIC_VECTOR (31 downto 0);
 signal Adder_out : STD_LOGIC_VECTOR (31 downto 0);
 
  COMPONENT DP_RippleCarryAdder32Bit_22336688
 Port ( x , y : in STD_LOGIC_VECTOR (31 downto 0) ;
 c_in : in STD_LOGIC ;
 s : out STD_LOGIC_VECTOR (31 downto 0) ;
 c_out : out STD_LOGIC;
 v : out STD_LOGIC );
 END COMPONENT ;

  COMPONENT DP_32Bit_B_Logic_22336688
 Port (S0,S1 : in STD_LOGIC;
 --A : in STD_LOGIC_VECTOR (31 downto 0);
 B : in STD_LOGIC_VECTOR (31 downto 0);
 --X : out STD_LOGIC_VECTOR (31 downto 0);
 Y : out STD_LOGIC_VECTOR (31 downto 0));
 END COMPONENT ;

  COMPONENT DP_32Bit_LogicCircuit_22336688
 Port (S0,S1 : in STD_LOGIC;
 A : in STD_LOGIC_VECTOR (31 downto 0);
 B : in STD_LOGIC_VECTOR (31 downto 0);
 G : out STD_LOGIC_VECTOR (31 downto 0));
 END COMPONENT ;


  COMPONENT CPU_Mux2_32Bit_22336688
 Port (S : in STD_LOGIC;
 In0 : in STD_LOGIC_VECTOR (31 downto 0);
 In1 : in STD_LOGIC_VECTOR (31 downto 0);
Z : out STD_LOGIC_VECTOR (31 downto 0));
 END COMPONENT ;

begin
BLogic : DP_32Bit_B_Logic_22336688 PORT MAP(
B(31 downto 0) =>B(31 downto 0),
S0 => S0,
S1 => S1,
Y => BLogic_out
);

LogicCircuit : DP_32Bit_LogicCircuit_22336688 PORT MAP(
A(31 downto 0) =>A(31 downto 0),
B(31 downto 0) =>B(31 downto 0),
S0 => S0,
S1 => S1,
G => LogicCircuit_out
);
Adder : DP_RippleCarryAdder32Bit_22336688 PORT MAP(
x(31 downto 0) =>A(31 downto 0),
y =>BLogic_out,
c_in => c_in,
s => Adder_out,
v => v,
c_out =>c
);
ALUMux : CPU_Mux2_32Bit_22336688 PORT MAP(
s => s2,
In0 => Adder_out,
In1 => LogicCircuit_out,
Z => G
);

end behavioral;