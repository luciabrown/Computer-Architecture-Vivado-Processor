----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Lucia Brown
-- 
-- Create Date: 10/09/2023 07:25:55 PM
-- Design Name: 
-- Module Name: RF_Test_RegisterFile_32_15_22336688 - Behavioral
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


entity RF_Test_RegisterFile_32_15_22336688 is
Port(
 A_B_DataIN_Test : in STD_LOGIC_VECTOR(1 downto 0);
 D_Test : in STD_LOGIC_VECTOR(31 downto 0);
 Clock_Test : in STD_LOGIC;
 DR_Test : in STD_LOGIC_VECTOR(4 downto 0);
 RW_Test : in STD_LOGIC;
 SA_Test : in STD_LOGIC_VECTOR(4 downto 0);
 SB_Test : in STD_LOGIC_VECTOR(4 downto 0);
 TA_Test : in STD_LOGIC_VECTOR(3 downto 0);
 TB_Test : in STD_LOGIC_VECTOR(3 downto 0);
 TD_Test : in STD_LOGIC_VECTOR(3 downto 0));
end RF_Test_RegisterFile_32_15_22336688;

architecture Behavioral of RF_Test_RegisterFile_32_15_22336688 is

 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
 
 signal AReg, BReg, MuxOut : STD_LOGIC_VECTOR(31 downto 0);

COMPONENT RF_Mux3_32Bit_22336688 is
Port ( I0 , I1 , I2  : in STD_LOGIC_VECTOR (31 downto 0) ;
 S : in STD_LOGIC_VECTOR (1 downto 0) ;
 Y: out STD_LOGIC_VECTOR (31 downto 0) );
END COMPONENT;

COMPONENT RF_RegisterFile_32_15_22336688 is
Port(
 CLOCK : in STD_LOGIC;
  D : in STD_LOGIC_VECTOR (31 downto 0);
  DR : in STD_LOGIC_VECTOR (4 downto 0);
  RW : in STD_LOGIC;
  SA : in STD_LOGIC_VECTOR (4 downto 0);
  SB : in STD_LOGIC_VECTOR (4 downto 0);
  TA : in STD_LOGIC_VECTOR (3 downto 0);
  TB : in STD_LOGIC_VECTOR (3 downto 0);
  TD : in STD_LOGIC_VECTOR (3 downto 0);
  A :  out STD_LOGIC_VECTOR (31 downto 0);
  B :  out STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

begin

Mux3 : RF_Mux3_32Bit_22336688 PORT MAP(
 S => A_B_DataIN_Test, I2 => D_Test, I0 => AReg, I1 =>BReg,
 Y => MuxOut
);

RegFile : RF_RegisterFile_32_15_22336688 PORT MAP(
  CLOCK => Clock_Test, D =>MuxOut,DR=>DR_Test,RW=>RW_Test,SA=>SA_Test,SB=>SB_Test,TA=>TA_Test,TB=>TB_Test,TD=>TD_Test,
  A=>AReg,B=>Breg
);


end Behavioral;

