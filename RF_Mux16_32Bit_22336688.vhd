----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Lucia Brown
-- 
-- Create Date: 10/02/2023 09:17:12 PM
-- Design Name: 
-- Module Name: RF_Mux32_32Bit_22336688 - Behavioral
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
 library IEEE ;
 use IEEE . STD_LOGIC_1164 .ALL;

 entity RF_Mux16_32Bit_22336688 is
 Port ( I0 , I1 , I2 , I3 : in STD_LOGIC_VECTOR (31 downto 0) ;
 I4 , I5 , I6 , I7 : in STD_LOGIC_VECTOR (31 downto 0) ;
 I8 , I9 , I10 , I11 : in STD_LOGIC_VECTOR (31 downto 0) ;
 I12 , I13 , I14, I15 : in STD_LOGIC_VECTOR (31 downto 0) ;

 S : in STD_LOGIC_VECTOR (3 downto 0) ;
 y : out STD_LOGIC_VECTOR (31 downto 0) );

 end RF_Mux16_32Bit_22336688 ;

 architecture Behavioral of RF_Mux16_32Bit_22336688 is

 COMPONENT RF_Mux16_1Bit_22336688
 Port ( I0 , I1 , I2 , I3 : in STD_LOGIC ;
 I4 , I5 , I6 , I7 : in STD_LOGIC ;
 I8 , I9 , I10 , I11 : in STD_LOGIC ;
 I12 , I13 , I14, I15 : in STD_LOGIC ;

S : in STD_LOGIC_VECTOR (3 downto 0) ;
 Y : out STD_LOGIC ) ;
 END COMPONENT ;

 -- Propagation Delay according to StdentID e.g. 26 3357 25( DEC )
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1

 begin

 -- Instantiate the least significant bit
 bit0 :  RF_Mux16_1Bit_22336688 PORT MAP (
 I0=>I0(0), I1 => I1(0), I2 => I2(0), I3 => I3(0),
 I4 => I4(0), I5 => I5(0), I6 => I6(0), I7 => I7(0),
 I8 => I8(0), I9 => I9(0), I10 => I10(0), I11 => I11(0),
 I12 => I12(0), I13 => I13(0), I14 => I14(0), I15 => I15(0),

 S => S , Y => y (0) );

 bit1 :  RF_Mux16_1Bit_22336688 PORT MAP (
 I0 => I0 (1) , I1 => I1 (1) , I2 => I2 (1) , I3 => I3 (1) ,
 I4 => I4 (1) , I5 => I5 (1) , I6 => I6 (1) , I7 => I7 (1) ,
 I8 => I8(1), I9 => I9(1), I10 => I10(1), I11 => I11(1),
 I12 => I12(1), I13 => I13(1), I14 => I14(1), I15 => I15(1),

 S => S , Y => y (1) );

 bit2 : RF_Mux16_1Bit_22336688 PORT MAP (
 I0 => I0 (2) , I1 => I1 (2) , I2 => I2 (2) , I3 => I3 (2) ,
 I4 => I4 (2) , I5 => I5 (2) , I6 => I6 (2) , I7 => I7 (2) ,
 I8 => I8(2), I9 => I9(2), I10 => I10(2), I11 => I11(2),
 I12 => I12(2), I13 => I13(2), I14 => I14(2), I15 => I15(2),

 S => S , Y => y (2) );

 bit3 :  RF_Mux16_1Bit_22336688 PORT MAP (
 I0 => I0 (3) , I1 => I1 (3) , I2 => I2 (3) , I3 => I3 (3) ,
 I4 => I4 (3) , I5 => I5 (3) , I6 => I6 (3) , I7 => I7 (3) ,
 I8 => I8(3), I9 => I9(3), I10 => I10(3), I11 => I11(3),
 I12 => I12(3), I13 => I13(3), I14 => I14(3), I15 => I15(3),

 S => S , Y => y (3) );

 bit4 :  RF_Mux16_1Bit_22336688 PORT MAP (
 I0=> I0 (4) , I1 => I1 (4) , I2 => I2 (4) , I3=> I3 (4) ,
 I4=> I4 (4) , I5 => I5 (4) , I6 => I6 (4) , I7 => I7 (4) ,
 I8 => I8(4), I9 => I9(4), I10 => I10(4), I11 => I11(4),
 I12 => I12(4), I13 => I13(4), I14 => I14(4), I15 => I15(4),

 S => S , Y => y (4) );

 bit5 : RF_Mux16_1Bit_22336688 PORT MAP (
 I0=> I0 (5) , I1 => I1 (5) , I2 => I2 (5) , I3 => I3 (5) ,
 I4 => I4 (5) , I5 => I5 (5) , I6 => I6 (5) , I7 => I7 (5) ,
 I8 => I8(5), I9 => I9(5), I10 => I10(5), I11 => I11(5),
 I12 => I12(5), I13 => I13(5), I14 => I14(5), I15 => I15(5),

 S => S , Y => y (5) );

 bit6 :  RF_Mux16_1Bit_22336688 PORT MAP (
 I0 => I0 (6) , I1 => I1 (6) , I2 => I2 (6) , I3 => I3 (6) ,
 I4=> I4 (6) , I5 => I5 (6) , I6 => I6 (6) , I7=> I7 (6) ,
 I8 => I8(6), I9 => I9(6), I10 => I10(6), I11 => I11(6),
 I12 => I12(6), I13 => I13(6), I14 => I14(6), I15 => I15(6),

 S => S , Y=> y (6) );

 bit7 :  RF_Mux16_1Bit_22336688 PORT MAP (
 I0 => I0 (7) , I1 => I1 (7) , I2 => I2 (7) , I3=> I3 (7) ,
 I4 => I4 (7) , I5 => I5 (7) , I6 => I6 (7) , I7 => I7 (7) ,
 I8 => I8(7), I9 => I9(7), I10 => I10(7), I11 => I11(7),
 I12 => I12(7), I13 => I13(7), I14 => I14(7), I15 => I15(7),

 S => S , Y => y (7) );

 bit8 :  RF_Mux16_1Bit_22336688 PORT MAP (
 I0 => I0(8) , I1 => I1(8) , I2 => I2 (8) , I3=> I3 (8) ,
 I4 =>I4(8) , I5 => I5 (8) , I6 => I6 (8) , I7 => I7 (8) ,
 I8 => I8(8), I9 => I9(8), I10 => I10(8), I11 => I11(8),
 I12 => I12(8), I13 => I13(8), I14 => I14(8), I15 => I15(8),

 S => S , Y => y (8) );

 bit9 :  RF_Mux16_1Bit_22336688 PORT MAP (
 I0 => I0 (9) , I1 => I1 (9) , I2 => I2 (9) , I3=> I3 (9) ,
 I4 => I4 (9) , I5 => I5 (9) , I6 => I6 (9) , I7 => I7 (9) ,
 I8 => I8(9), I9 => I9(9), I10 => I10(9), I11 => I11(9),
 I12 => I12(9), I13 => I13(9), I14 => I14(9), I15 => I15(9),

 S => S , Y=> y (9) );

 bit10 : RF_Mux16_1Bit_22336688 PORT MAP (
 I0 => I0 (10) , I1 => I1 (10) , I2 => I2 (10) , I3 => I3 (10) ,
 I4 => I4 (10) , I5 => I5 (10) , I6 => I6 (10) , I7=> I7 (10) ,
 I8 => I8(10), I9 => I9(10), I10 => I10(10), I11 => I11(10),
 I12 => I12(10), I13 => I13(10), I14 => I14(10), I15 => I15(10),

 S => S , Y=> y (10) );

 bit11 :  RF_Mux16_1Bit_22336688 PORT MAP (
 I0 =>I0 (11) , I1 => I1 (11) , I2 => I2 (11) , I3 => I3 (11) ,
 I4 => I4 (11) , I5 => I5 (11) , I6 => I6 (11) , I7 =>I7 (11) ,
 I8 => I8(11), I9 => I9(11), I10 => I10(11), I11 => I11(11),
 I12 => I12(11), I13 => I13(11), I14 => I14(11), I15 => I15(11),

 S => S , Y => y (11) );

 bit12 :  RF_Mux16_1Bit_22336688 PORT MAP (
 I0 =>I0 (12) , I1 => I1 (12) , I2 => I2 (12) , I3 => I3 (12) ,
 I4=> I4 (12) , I5 => I5 (12) , I6 => I6 (12) , I7 => I7 (12) ,
 I8 => I8(12), I9 => I9(12), I10 => I10(12), I11 => I11(12),
 I12 => I12(12), I13 => I13(12), I14 => I14(12), I15 => I15(12),

 S => S , Y=>y (12) );

 bit13 : RF_Mux16_1Bit_22336688 PORT MAP (
 I0=> I0 (13) , I1 => I1 (13) , I2 => I2 (13) , I3 => I3 (13) ,
 I4 => I4 (13) , I5 => I5 (13) , I6 => I6 (13) , I7=> I7 (13) ,
 I8 => I8(13), I9 => I9(13), I10 => I10(13), I11 => I11(13),
 I12 => I12(13), I13 => I13(13), I14 => I14(13), I15 => I15(13),

 S => S , Y => y (13) );

 bit14 :  RF_Mux16_1Bit_22336688 PORT MAP (
 I0 =>I0 (14) , I1 => I1 (14) , I2 => I2 (14) , I3 => I3 (14) ,
 I4=>I4 (14) , I5 => I5 (14) , I6 => I6 (14) , I7 => I7 (14) ,
 I8 => I8(14), I9 => I9(14), I10 => I10(14), I11 => I11(14),
 I12 => I12(14), I13 => I13(14), I14 => I14(14), I15 => I15(14),

 S => S , Y => y (14) );

 bit15 :  RF_Mux16_1Bit_22336688 PORT MAP (
 I0 =>I0 (15) , I1 => I1 (15) , I2 => I2 (15) , I3 => I3 (15) ,
 I4 =>I4 (15) , I5 => I5 (15) , I6 => I6 (15) , I7=> I7 (15) ,
 I8 => I8(15), I9 => I9(15), I10 => I10(15), I11 => I11(15),
 I12 => I12(15), I13 => I13(15), I14 => I14(15), I15 => I15(15),

 S => S , Y => y (15) );

 bit16 :  RF_Mux16_1Bit_22336688 PORT MAP (
 I0 => I0 (16) , I1 => I1 (16) , I2 => I2 (16) , I3 => I3 (16) ,
 I4 => I4 (16) , I5 => I5 (16) , I6 => I6 (16) , I7 => I7 (16) ,
 I8 => I8(16), I9 => I9(16), I10 => I10(16), I11 => I11(16),
 I12 => I12(16), I13 => I13(16), I14 => I14(16), I15 => I15(16),

 S => S , Y => y (16) );

 bit17 :  RF_Mux16_1Bit_22336688 PORT MAP (
 I0 => I0 (17) , I1 => I1 (17) , I2 => I2 (17) , I3 => I3 (17) ,
 I4 => I4 (17) , I5 => I5 (17) , I6 => I6 (17) , I7=> I7 (17) ,
 I8 => I8(17), I9 => I9(17), I10 => I10(17), I11 => I11(17),
 I12 => I12(17), I13 => I13(17), I14 => I14(17), I15 => I15(17),

 S => S , Y=> y (17) );

 bit18 :  RF_Mux16_1Bit_22336688 PORT MAP (
 I0=> I0 (18) , I1 => I1 (18) , I2 => I2 (18) , I3 => I3 (18) ,
 I4 => I4 (18) , I5 => I5 (18) , I6 => I6 (18) , I7 => I7 (18) ,
 I8 => I8(18), I9 => I9(18), I10 => I10(18), I11 => I11(18),
 I12 => I12(18), I13 => I13(18), I14 => I14(18), I15 => I15(18),

 S => S , Y => y (18) );

 bit19 : RF_Mux16_1Bit_22336688 PORT MAP (
 I0 => I0 (19) , I1 => I1 (19) , I2 => I2 (19) , I3 => I3(19) ,
 I4 => I4 (19) , I5 => I5 (19) , I6 => I6 (19) , I7 => I7 (19) ,
 I8 => I8(19), I9 => I9(19), I10 => I10(19), I11 => I11(19),
 I12 => I12(19), I13 => I13(19), I14 => I14(19), I15 => I15(19),

 S => S , Y => y (19) );

 bit20 : RF_Mux16_1Bit_22336688 PORT MAP (
 I0 => I0 (20) , I1 => I1 (20) , I2 => I2 (20) , I3 => I3 (20) ,
 I4 => I4 (20) , I5 => I5 (20) , I6 => I6 (20) , I7 => I7 (20) ,
 I8 => I8(20), I9 => I9(20), I10 => I10(20), I11 => I11(20),
 I12 => I12(20), I13 => I13(20), I14 => I14(20), I15 => I15(20),

 S => S , Y => y (20) );

 bit21 :  RF_Mux16_1Bit_22336688 PORT MAP (
 I0 =>I0 (21) , I1 => I1 (21) , I2 => I2 (21) , I3 => I3 (21) ,
 I4 =>I4 (21) , I5 => I5 (21) , I6 => I6 (21) , I7=> I7 (21) ,
 I8 =>I8(21), I9 => I9(21), I10 => I10(21), I11 => I11(21),
 I12 => I12(21), I13 => I13(21), I14 => I14(21), I15 => I15(21),

 S => S , Y=> y (21) );

 bit22 :  RF_Mux16_1Bit_22336688 PORT MAP (
 I0 => I0 (22) , I1 => I1 (22) , I2 => I2 (22) , I3 => I3 (22) ,
 I4 => I4 (22) , I5 => I5 (22) , I6 => I6 (22) , I7 => I7 (22) ,
 I8 => I8(22), I9 => I9(22), I10 => I10(22), I11 => I11(22),
 I12 => I12(22), I13 => I13(22), I14 => I14(22), I15 => I15(22),

 S => S , Y => y (22) );

 bit23 :  RF_Mux16_1Bit_22336688 PORT MAP (
 I0=> I0 (23) , I1 => I1 (23) , I2 => I2 (23) , I3 => I3 (23) ,
 I4 => I4 (23) , I5 => I5 (23) , I6 => I6 (23) , I7=> I7 (23) ,
 I8 => I8(23), I9 => I9(23), I10 => I10(23), I11 => I11(23),
 I12 => I12(23), I13 => I13(23), I14 => I14(23), I15 => I15(23),

 S => S , Y => y (23) );

 bit24 :  RF_Mux16_1Bit_22336688 PORT MAP (
 I0 => I0 (24) , I1 => I1 (24) , I2 => I2 (24) , I3 => I3 (24) ,
 I4 => I4 (24) , I5 => I5 (24) , I6 => I6 (24) , I7 => I7 (24) ,
 I8 => I8(24), I9 => I9(24), I10 => I10(24), I11 => I11(24),
 I12 => I12(24), I13 => I13(24), I14 => I14(24), I15 => I15(24),

 S => S , Y => y (24) );

 bit25 : RF_Mux16_1Bit_22336688 PORT MAP (
 I0 => I0 (25) , I1 => I1 (25) , I2 => I2 (25) , I3=> I3 (25) ,
 I4 => I4 (25) , I5 => I5 (25) , I6 => I6 (25) , I7 => I7 (25) ,
 I8 => I8(25), I9 => I9(25), I10 => I10(25), I11 => I11(25),
 I12 => I12(25), I13 => I13(25), I14 => I14(25), I15 => I15(25),

 S => S , Y => y (25) );

 bit26 : RF_Mux16_1Bit_22336688 PORT MAP (
 I0 => I0 (26) , I1 => I1 (26) , I2 => I2 (26) , I3 => I3 (26) ,
 I4=> I4 (26) , I5 => I5 (26) , I6 => I6 (26) , I7 => I7 (26) ,
 I8 => I8(26), I9 => I9(26), I10 => I10(26), I11 => I11(26),
 I12 => I12(26), I13 => I13(26), I14 => I14(26), I15 => I15(26),

 S => S , Y => y (26) );

 bit27 : RF_Mux16_1Bit_22336688 PORT MAP (
 I0=> I0 (27) , I1 => I1 (27) , I2 => I2 (27) , I3=> I3 (27) ,
 I4 =>I4 (27) , I5 => I5 (27) , I6 => I6 (27) , I7=> I7 (27) ,
 I8 => I8(27), I9 => I9(27), I10 => I10(27), I11 => I11(27),
 I12 => I12(27), I13 => I13(27), I14 => I14(27), I15 => I15(27),

 S => S , Y => y (27) );

 bit28 : RF_Mux16_1Bit_22336688 PORT MAP (
 I0=>I0 (28) , I1 => I1 (28) , I2 => I2 (28) , I3 => I3 (28) ,
 I4 => I4 (28) , I5 => I5 (28) , I6 => I6 (28) , I7 => I7 (28) ,
 I8 => I8(28), I9 => I9(28), I10 => I10(28), I11 => I11(28),
 I12 => I12(28), I13 => I13(28), I14 => I14(28), I15 => I15(28),

 S => S , Y => y (28) );

 bit29 : RF_Mux16_1Bit_22336688 PORT MAP (
 I0 => I0 (29) , I1 => I1 (29) , I2 => I2 (29) , I3 =>I3(29) ,
 I4 => I4 (29) , I5 => I5 (29) , I6 => I6 (29) , I7 => I7 (29) ,
 I8 => I8(29), I9 => I9(29), I10 => I10(29), I11 => I11(29),
 I12 => I12(29), I13 => I13(29), I14 => I14(29), I15 => I15(29),

 S => S , Y=> y (29) );

 bit30 : RF_Mux16_1Bit_22336688 PORT MAP (
 I0 => I0 (30) , I1 => I1 (30) , I2 => I2 (30) , I3=>I3 (30) ,
 I4=>I4 (30) , I5 => I5 (30) , I6 => I6 (30) , I7=>I7 (30) ,
 I8 => I8(30), I9 => I9(30), I10 => I10(30), I11 => I11(30),
 I12 => I12(30), I13 => I13(30), I14 => I14(30), I15 => I15(30),

 S => S , Y => y (30) );

 bit31 : RF_Mux16_1Bit_22336688 PORT MAP (
 I0=>I0 (31) , I1 => I1 (31) , I2 => I2 (31) , I3=>I3 (31) ,
 I4=>I4 (31) , I5 => I5 (31) , I6 => I6 (31) , I7=>I7 (31) ,
 I8 => I8(31), I9 => I9(31), I10 => I10(31), I11 => I11(31),
 I12 => I12(31), I13 => I13(31), I14 => I14(31), I15 => I15(31),

 S => S , Y=> y (31) );

end Behavioral;
