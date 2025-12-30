----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Lucia Brown
-- 
-- Create Date: 10/02/2023 09:17:12 PM
-- Design Name: 
-- Module Name: RF_Mux3_32Bit_22336688 - Behavioral
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

 entity RF_Mux3_32Bit_22336688 is
 Port ( I0,I1,I2: in STD_LOGIC_VECTOR (31 downto 0) ;--,I3 : in STD_LOGIC_VECTOR (31 downto 0) ;
 s : in STD_LOGIC_VECTOR (1 downto 0) ;
 y : out STD_LOGIC_VECTOR (31 downto 0) );

 end RF_Mux3_32Bit_22336688 ;


 architecture Behavioral of RF_Mux3_32Bit_22336688 is

 COMPONENT RF_Mux3_1Bit_22336688
 Port (I0,I1,I2 :in STD_LOGIC;
 S :in STD_LOGIC_VECTOR(1 downto 0);
 Y : out STD_LOGIC );
 END COMPONENT ;

 -- Propagation Delay according to StdentID e.g. 22336688( DEC )
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1

 begin

 -- Instantiate the least significant bit
 bit0 :  RF_Mux3_1Bit_22336688 PORT MAP (
 I0=>I0(0),I1=>I1(0),I2=>I2(0),
 S =>S ,
 Y => y (0) );

 bit1 :  RF_Mux3_1Bit_22336688 PORT MAP (
 I0 => I0 (1) , I1 => I1 (1) , I2 => I2 (1) , 
 S =>S,
 Y => y (1) );

 bit2 : RF_Mux3_1Bit_22336688 PORT MAP (
 I0 => I0 (2) , I1 => I1 (2) , I2 => I2 (2) ,
 S =>S ,
 Y => y (2) ); 


 bit3 :  RF_Mux3_1Bit_22336688 PORT MAP (
 I0=> I0 (3) , I1 => I1 (3) , I2 => I2 (3),
 S =>S ,
 Y => y (3) );

 bit4 :  RF_Mux3_1Bit_22336688 PORT MAP (
 I0=> I0 (4) , I1 => I1 (4) , I2 => I2 (4) ,
  S =>S ,
 Y => y(4) );

 bit5 : RF_Mux3_1Bit_22336688 PORT MAP (
 I0=> I0 (5) , I1 => I1 (5) , I2 => I2 (5) ,
 S =>S ,
 Y => y (5) );

 bit6 :  RF_Mux3_1Bit_22336688 PORT MAP (
 I0 => I0 (6) , I1 => I1 (6) , I2 => I2 (6) ,
  S =>S ,
Y=> y (6) );

 bit7 :  RF_Mux3_1Bit_22336688 PORT MAP (
 I0 => I0 (7) , I1 => I1 (7) , I2 => I2 (7) ,
  S =>S ,
 Y => y (7) );

 bit8 :  RF_Mux3_1Bit_22336688 PORT MAP (
 I0 => I0(8) , I1 => I1(8) , I2 => I2 (8) ,
 S =>S ,
Y => y (8) );

 bit9 :  RF_Mux3_1Bit_22336688 PORT MAP (
 I0 => I0 (9) , I1 => I1 (9) , I2 => I2 (9) ,
 S =>S ,
 Y=> y (9) );

 bit10 : RF_Mux3_1Bit_22336688 PORT MAP (
 I0 => I0 (10) , I1 => I1 (10) , I2 => I2 (10) ,
 S =>S ,
 Y=> y (10) );

 bit11 :  RF_Mux3_1Bit_22336688 PORT MAP (
 I0 =>I0 (11) , I1 => I1 (11) , I2 => I2 (11) ,
 S =>S ,
 Y => y (11) );

 bit12 :  RF_Mux3_1Bit_22336688 PORT MAP (
 I0 =>I0 (12) , I1 => I1 (12) , I2 => I2 (12) ,-- I3=>I3(12),
 S =>S,
 Y=>y(12) );

 bit13 : RF_Mux3_1Bit_22336688 PORT MAP (
 I0=> I0 (13) , I1 => I1 (13) , I2 => I2 (13) ,--I3=>I3(13),
  S =>S,
 Y =>y (13) );

 bit14 :  RF_Mux3_1Bit_22336688 PORT MAP (
 I0 =>I0 (14) , I1 => I1 (14) , I2 => I2 (14) ,--I3=>I3(14),
 S =>S ,
 Y => y (14) );

 bit15 :  RF_Mux3_1Bit_22336688 PORT MAP (
 I0 =>I0 (15) , I1 => I1 (15) , I2 => I2 (15) ,--I3=>I3(15),
 S=>S,
 Y => y(15) );

 bit16 :  RF_Mux3_1Bit_22336688 PORT MAP (
 I0 => I0 (16) , I1 => I1 (16) , I2 => I2 (16) ,--I3=>I3(16),
  S=>S,
 Y=> y (16) );

 bit17 :  RF_Mux3_1Bit_22336688 PORT MAP (
 I0 => I0 (17) , I1 => I1 (17) , I2 => I2 (17) ,--I3=>I3(17),
  S =>S ,
 Y=> y (17) );

 bit18 :  RF_Mux3_1Bit_22336688 PORT MAP (
 I0=> I0 (18) , I1 => I1 (18) , I2 => I2 (18) ,--I3=>I3(18),
  S =>S ,
 Y=> y (18) );

 bit19 : RF_Mux3_1Bit_22336688 PORT MAP (
 I0 => I0 (19) , I1 => I1 (19) , I2 => I2 (19) ,--I3=>I3(19),
 S =>S ,
Y=> y (19) );

 bit20 : RF_Mux3_1Bit_22336688 PORT MAP (
 I0 => I0 (20) , I1 => I1 (20) , I2 => I2 (20) ,--I3=>I3(20),
 S =>S ,
 Y=> y (20) );

 bit21 :  RF_Mux3_1Bit_22336688 PORT MAP (
 I0 =>I0 (21) , I1 => I1 (21) , I2 => I2 (21) , --I3=>I3(21),
 S =>S ,
 Y=> y (21) );

 bit22 :  RF_Mux3_1Bit_22336688 PORT MAP (
 I0 => I0 (22) , I1 => I1 (22) , I2 => I2 (22) , --I3=>I3(22),
 S =>S,
Y => y (22) );

 bit23 :  RF_Mux3_1Bit_22336688 PORT MAP (
 I0=> I0 (23) , I1 => I1 (23) , I2 => I2 (23) ,--I3=>I3(23),
 S =>S ,
 Y=> y (23) );

 bit24 :  RF_Mux3_1Bit_22336688 PORT MAP (
 I0 => I0 (24) , I1 => I1 (24) , I2 => I2 (24) ,-- I3=>I3(24),
 S =>S,
 Y => y (24) );

 bit25 : RF_Mux3_1Bit_22336688 PORT MAP (
 I0 => I0 (25) , I1 => I1 (25) , I2 => I2 (25) ,--I3=>I3(25),
  S =>S ,
Y => y (25) );

 bit26 : RF_Mux3_1Bit_22336688 PORT MAP (
 I0 => I0 (26) , I1 => I1 (26) , I2 => I2 (26) ,--I3=>I3(26),
  S =>S ,
 Y => y (26) );

 bit27 : RF_Mux3_1Bit_22336688 PORT MAP (
 I0=> I0 (27) , I1 => I1 (27) , I2 => I2 (27) ,--I3=>I3(27),
  S =>S ,
 Y => y (27) );

 bit28 : RF_Mux3_1Bit_22336688 PORT MAP (
 I0=>I0 (28) , I1 => I1 (28) , I2 => I2 (28) ,--I3=>I3(28),
 S =>S ,
 Y =>y (28) );

 bit29 : RF_Mux3_1Bit_22336688 PORT MAP (
 I0 => I0 (29) , I1 => I1 (29) , I2 => I2 (29) ,--I3=>I3(29),
 S =>S ,
 Y=> y (29) );

 bit30 : RF_Mux3_1Bit_22336688 PORT MAP (
 I0 => I0 (30) , I1 => I1 (30) , I2 => I2 (30) ,--I3=>I3(30),
  S =>s ,
 Y => y (30) );

 bit31 : RF_Mux3_1Bit_22336688 PORT MAP (
 I0=>I0 (31) , I1 => I1 (31) , I2 => I2 (31) ,--I3=>I3(31),
 S =>S ,
 Y=> y (31) );

end Behavioral;
