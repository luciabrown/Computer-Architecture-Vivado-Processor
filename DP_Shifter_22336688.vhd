----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2023 07:07:08 PM
-- Design Name: 
-- Module Name: DP_Shifter_22336688 - Behavioral
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

entity DP_Shifter_22336688 is
 Port (S1,S2 :in STD_LOGIC;
 B : in STD_LOGIC_VECTOR(31 DOWNTO 0);
C : out STD_LOGIC;
 G : out STD_LOGIC_VECTOR(31 DOWNTO 0));
end DP_Shifter_22336688;

architecture Behavioral of DP_Shifter_22336688 is
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
 
 signal out0 : std_logic;  signal out1 : std_logic;  signal out2 : std_logic;  signal out3 : std_logic;  signal out4 : std_logic;  signal out5 : std_logic;  signal out6 : std_logic;  signal out7 : std_logic;
 signal out8 : std_logic;  signal out9 : std_logic;  signal out10 : std_logic;  signal out11 : std_logic;  signal out12 : std_logic;  signal out13 : std_logic;  signal out14 : std_logic;  signal out15 : std_logic;
 signal out16 : std_logic;  signal out17 : std_logic;  signal out18 : std_logic;  signal out19 : std_logic;  signal out20 : std_logic;  signal out21 : std_logic;  signal out22 : std_logic;  signal out23 : std_logic;
 signal out24 : std_logic;  signal out25 : std_logic;  signal out26 : std_logic;  signal out27 : std_logic;  signal out28 : std_logic;  signal out29 : std_logic;  signal out30 : std_logic;  signal out31 : std_logic;
 
 COMPONENT DP_Mux3_1Bit_22336688
 Port (I0,I1,I2 :in STD_LOGIC;
 S : in STD_LOGIC_VECTOR(1 DOWNTO 0);
 Y : out STD_LOGIC);
 END COMPONENT ;
 
component DP_ShifterCFlagMux2_1Bit_22336688
Port( S1 :in std_logic;
S2 : in std_logic;
C : out std_logic;
B : in std_logic_vector (31 downto 0 )
);
end component;
 
begin
bit00 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, I0 => B(0), I1 => '0', I2 => B(1), Y => out0
);
bit01 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(1), I1 => B(0), I2 => B(2), Y => out1
);
bit02 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(2), I1 => B(1), I2 => B(3), Y => out2
);

bit03 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(3), I1 => B(2), I2 => B(4), Y => out3
);

bit04 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(4), I1 => B(3), I2 => B(5), Y => out4
);

bit05 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(5), I1 => B(4), I2 => B(6), Y => out5
);

bit06 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(6), I1 => B(5), I2 => B(7), Y => out6
);

bit07 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(7), I1 => B(6), I2 => B(8), Y => out7
);

bit08 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(8), I1 => B(7), I2 => B(9), Y => out8
);

bit09 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(9), I1 => B(8), I2 => B(10), Y => out9
);

bit10: DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(10), I1 => B(9), I2 => B(11), Y => out10
);

bit11 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(11), I1 => B(10), I2 => B(12), Y => out11
);
bit12 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(12), I1 => B(11), I2 => B(13), Y => out12
);
bit13 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(13), I1 => B(12), I2 => B(14), Y => out13
);
bit14 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(14), I1 => B(13), I2 => B(15), Y => out14
);
bit15 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(15), I1 => B(14), I2 => B(16), Y => out15
);
bit16 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(16), I1 => B(15), I2 => B(17), Y => out16
);
bit17 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(17), I1 => B(16), I2 => B(18), Y => out17
);
bit18 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(18), I1 => B(17), I2 => B(19), Y => out18
);
bit19 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(19), I1 => B(18), I2 => B(20), Y => out19
);
bit20 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(20), I1 => B(19), I2 => B(21), Y => out20
);
bit21 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(21), I1 => B(20), I2 => B(22), Y => out21
);
bit22 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(22), I1 => B(21), I2 => B(23), Y => out22
);
bit23 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(23), I1 => B(22), I2 => B(24), Y => out23
);
bit24 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(24), I1 => B(23), I2 => B(25), Y => out24
);
bit25 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(25), I1 => B(24), I2 => B(26), Y => out25
);
bit26 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(26), I1 => B(25), I2 => B(27), Y => out26
);
bit27 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(27), I1 => B(26), I2 => B(28), Y => out27
);
bit28 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(28), I1 => B(27), I2 => B(29), Y => out28
);
bit29 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(29), I1 => B(30), I2 => B(28), Y => out29
);
bit30 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(30), I1 => B(31), I2 => B(29), Y => out30
);
bit31 : DP_Mux3_1Bit_22336688 port map 
(
S(0) => S1, S(1) =>S2, 
I0 => B(31), I1 => B(30), I2 => '0', Y => out31
);
CFlagMux : DP_ShifterCFlagMux2_1Bit_22336688 port map
(
S1 => S1, S2 => S2, C=>C,B=>B
);
G(0)<=out0;G(1) <= out1;G(2) <= out2;G(3) <= out3;G(4) <= out4;G(5) <= out5;G(6) <= out6;G(7) <= out7;G(8) <= out8;G(9) <= out9;G(10) <= out10;G(11) <= out11;G(12) <= out12;
G(13)<=out13; G(14)<=out14; G(15)<=out15; G(16)<=out16; G(17)<=out17; G(18)<=out18; G(19)<=out19;G(20)<=out20;G(21)<=out21;G(22)<=out22;G(23)<=out23; G(24)<=out24; G(25)<=out25; G(26)<=out26; G(27)<=out27; G(28)<=out28;
G(29)<=out29;G(30) <= out30;G(31) <= out31;
end Behavioral;
