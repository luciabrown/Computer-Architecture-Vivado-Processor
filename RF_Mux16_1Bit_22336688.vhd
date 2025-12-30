----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Lucia Brown
-- 
-- Create Date: 10/02/2023 09:02:42 PM
-- Design Name: 
-- Module Name: RF_Mux32_1Bit_22336688 - Behavioral
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

 entity RF_Mux16_1Bit_22336688 is
 Port ( I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15 : in STD_LOGIC;
S : in STD_LOGIC_VECTOR (3 downto 0) ;
 Y : out STD_LOGIC ) ;
 end RF_Mux16_1Bit_22336688 ;

 architecture Behavioral of RF_Mux16_1Bit_22336688 is
 
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1

 signal S0_not, S1_not, S2_not, S3_not  : std_logic ;  -- 2: 0010 NOT 1101

--s0
 signal and00 , and01, and02, and03 : std_logic ;

--s1
 signal and10 , and11 , and12 , and13 : std_logic ;
 signal and14 , and15 , and16 , and17 : std_logic ;

--s2
 signal and20 , and21 , and22 , and23 : std_logic ;
 signal and24 , and25 , and26 , and27 : std_logic ;
 signal and28 , and29 , and210 , and211 : std_logic ;
 signal and212 , and213 , and214 , and215 : std_logic ;

--s3
 signal and30 , and31 , and32 , and33 : std_logic ;
 signal and34 , and35 , and36 , and37 : std_logic ;
 signal and38 , and39 , and310 , and311 : std_logic ;
 signal and312 , and313 , and314 , and315 : std_logic ;

--OR gates
signal l1or0 , l1or1 , l1or2 , l1or3,  l1or4,  l1or5,  l1or6,  l1or7 : std_logic ;
signal l2or0 , l2or1, l2or2, l2or3 : std_logic ;
signal l3or0, l3or1 : std_logic;

--Concurrent Assignment Statements
 begin 
 S0_not <= not S (0) after not_gate_delay; 
 S1_not <= not S (1) after not_gate_delay;  
 S2_not <= not S (2) after not_gate_delay;  
 S3_not <= not S (3) after not_gate_delay;  

--and gates 0010
and00 <= S3_not and S2_not after and_gate_delay; --1
  
and10 <= and00 and S1_not after and_gate_delay;  --0

and20 <= and10 and S0_not after and_gate_delay;
and30 <= and20 and I0 after and_gate_delay; --0000

and21 <= and10 and S(0) after and_gate_delay;
and31 <= and21 and I1 after and_gate_delay; --0001

and11 <= and00 and S(1) after and_gate_delay; --1

and22 <= and11 and S0_not after and_gate_delay;
and32 <= and22 and I2 after and_gate_delay;   --0010

and23 <= and11 and S(0) after and_gate_delay;
and33 <= and23 and I3 after and_gate_delay;   --0011

--

and01 <= S3_not and S(2) after and_gate_delay;
and12 <= and01 and S1_not after and_gate_delay;

and24 <= and12 and S0_not after and_gate_delay;
and34 <= and24 and I4 after and_gate_delay;
and25 <= and12 and S(0) after and_gate_delay;
and35 <= and25 and I5 after and_gate_delay;


and13 <= and01 and S(1) after and_gate_delay;

and26 <= and13 and S0_not after and_gate_delay;
and36 <= and26 and I6 after and_gate_delay;
and27 <= and13 and S(0) after and_gate_delay;
and37 <= and27 and I7 after and_gate_delay;

--

and02 <= S(3) and S2_not after and_gate_delay; --0

and14 <= and02 and S1_not after and_gate_delay;
and28 <= and14 and S0_not after and_gate_delay;
and38 <= and28 and I8 after and_gate_delay;
and29 <= and14 and S(0) after and_gate_delay;
and39 <= and29 and I9 after and_gate_delay;

and15 <= and02 and S(1) after and_gate_delay;

and210 <= and15 and S0_not after and_gate_delay;
and310 <= and210 and I10 after and_gate_delay;
and211 <= and15 and S(0) after and_gate_delay;
and311 <= and211 and I11 after and_gate_delay;

--

and03 <= S(3) and S(2) after and_gate_delay;
and16 <= and03 and S1_not after and_gate_delay;

and212 <= and16 and S0_not after and_gate_delay;
and312 <= and212 and I12  after and_gate_delay;
and213 <=and16 and S(0) after and_gate_delay;
and313 <= and213 and I13 after and_gate_delay;

and17 <= and03 and S(1) after and_gate_delay;

and214 <= and17 and S0_not after and_gate_delay;
and314 <= and214 and I14  after and_gate_delay;
and215 <= and17 and S(0) after and_gate_delay;
and315 <= and215 and I15 after and_gate_delay;

--OR gates
 l1or0 <= and30 or and31 after or_gate_delay;
 l1or1 <= and32 or and33 after or_gate_delay;
 l1or2 <= and34 or and35 after or_gate_delay;
 l1or3 <= and36 or and37 after or_gate_delay;
 l1or4 <= and38 or and39 after or_gate_delay;
l1or5 <= and310 or and311 after or_gate_delay;
l1or6 <= and312 or and313 after or_gate_delay;
l1or7 <= and314 or and315 after or_gate_delay;


 l2or0 <= l1or0 or l1or1 after or_gate_delay;
 l2or1 <= l1or2 or l1or3 after or_gate_delay;
 l2or2 <= l1or4 or l1or5 after or_gate_delay;
 l2or3 <= l1or6 or l1or7 after or_gate_delay;


 l3or0 <= l2or0 or l2or1 after or_gate_delay;
 l3or1 <= l2or2 or l2or3 after or_gate_delay;

Y <= l3or1 or l3or0 after or_gate_delay;

end Behavioral ;