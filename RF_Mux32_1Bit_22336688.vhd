----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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

 entity RF_Mux32_1Bit_22336688 is
 Port ( I0, I1, I2, I3 ,I4, I5, I6, I7 ,I8, I9, I10,I11,I12, I13, I14, I15 ,I16, I17, I18, I19 ,I20, I21, I22, I23,I24, I25, I26,I27,I28, I29, I30, I31 : in STD_LOGIC;

S : in STD_LOGIC_VECTOR (4 downto 0) ;
 Y : out STD_LOGIC ) ;
 end RF_Mux32_1Bit_22336688 ;

 architecture Behavioral of RF_Mux32_1Bit_22336688 is

 signal S0_not, S1_not, S2_not, S3_not, S4_not  : std_logic ;

--s0
 signal and00 , and01 , and02 , and03 : std_logic ;
 signal and04 , and05 , and06 , and07 : std_logic ;
 signal and08 , and09 , and010 , and011 : std_logic ;
 signal and012 , and013 , and014 , and015 : std_logic ;
 signal and016, and017 , and018 , and019 : std_logic ;
 signal and020 , and021 , and022 , and023 : std_logic ;
 signal and024 , and025 , and026 , and027 : std_logic ;
 signal and028 , and029 , and030 , and031 : std_logic ;

--s1
 signal and10 , and11 , and12 , and13 : std_logic ;
 signal and14 , and15 , and16 , and17 : std_logic ;
 signal and18 , and19 , and110 , and111 : std_logic ;
 signal and112 , and113 , and114 , and115 : std_logic ;
 signal and116, and117 , and118 , and119 : std_logic ;
 signal and120 , and121 , and122 , and123 : std_logic ;
 signal and124 , and125 , and126 , and127 : std_logic ;
 signal and128 , and129 , and130 , and131 : std_logic ;

--s2
 signal and20 , and21 , and22 , and23 : std_logic ;
 signal and24 , and25 , and26 , and27 : std_logic ;
 signal and28 , and29 , and210 , and211 : std_logic ;
 signal and212 , and213 , and214 , and215 : std_logic ;
 signal and216, and217 , and218 , and219 : std_logic ;
 signal and220 , and221 , and222 , and223 : std_logic ;
 signal and224 , and225 , and226 , and227 : std_logic ;
 signal and228 , and229 , and230 , and231 : std_logic ;


--s3
 signal and30 , and31 , and32 , and33 : std_logic ;
 signal and34 , and35 , and36 , and37 : std_logic ;
 signal and38 , and39 , and310 , and311 : std_logic ;
 signal and312 , and313 , and314 , and315 : std_logic ;
 signal and316, and317 , and318 , and319 : std_logic ;
 signal and320 , and321 , and322 , and323 : std_logic ;
 signal and324 , and325 , and326 , and327 : std_logic ;
 signal and328 , and329 , and330 , and331 : std_logic ;


--s4
 signal and40 , and41 , and42 , and43 : std_logic ;
 signal and44 , and45 , and46 , and47 : std_logic ;
 signal and48 , and49 , and410 , and411 : std_logic ;
 signal and412 , and413 , and414 , and415 : std_logic ;
 signal and416, and417 , and418 , and419 : std_logic ;
 signal and420 , and421 , and422 , and423 : std_logic ;
 signal and424 , and425 , and426 , and427 : std_logic ;
 signal and428 , and429 , and430 , and431 : std_logic ;

--OR gates
signal l1or0 , l1or1 , l1or2 , l1or3,  l1or4,  l1or5,  l1or6,  l1or7, l1or8, l1or9, l1or10, l1or11, l1or12, l1or13, l1or14, l1or15 : std_logic ;
signal l2or0 , l2or1, l2or2, l2or3, l2or4 , l2or5, l2or6, l2or7 : std_logic ;
signal l3or0, l3or1, l3or2, l3or3 : std_logic;
signal l4or0, l4or1 : std_logic;


 -- Propagation Delay according to StdentID e.g. 22336688( DEC )
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 = 8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7 =6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
--Concurrent Assignment Statements
 begin
 S0_not <= not S (0) after not_gate_delay;
 S1_not <= not S (1) after not_gate_delay;
 S2_not <= not S (2) after not_gate_delay;
 S3_not <= not S (3) after not_gate_delay;
 S4_not <= not S (4) after not_gate_delay;

--and gates
and00 <= S4_not and S3_not after AND_gate_delay;
and10 <= and00 and S2_not after  AND_gate_delay;

and20 <= and10 and S1_not after AND_gate_delay;
and30 <= and20 and S0_not after AND_gate_delay;

and40 <= and30 and I0 after AND_gate_delay;



and21 <= and10 and S(1) after AND_gate_delay;

and31 <= and20 and S(0) after AND_gate_delay;

and42 <= and32 and I2 after AND_gate_delay;


and32 <= and21 and S0_not after AND_gate_delay;
and33 <= and21 and S(0) after AND_gate_delay;


and41 <= and31 and I1 after AND_gate_delay;

and43 <= and33 and I3 after AND_gate_delay;



and11 <= and00 and S(2) after  AND_gate_delay;

and22 <= and11 and S1_not after AND_gate_delay;
and23 <= and11 and S(1) after AND_gate_delay;

and34 <= and22 and s0_not after AND_gate_delay;
and35 <= and22 and S(0)  after AND_gate_delay;
and36 <= and23 and s0_not after AND_gate_delay;
and37 <= and23 and S(0) after AND_gate_delay;

and44 <= and34 and I4 after AND_gate_delay;
and45 <= and35 and I5  after AND_gate_delay;
and46 <= and36 and I6 after AND_gate_delay;
and47 <= and37 and I7 after AND_gate_delay;

and01 <= S4_not and S(3) after AND_gate_delay;
and12 <= and01 and S2_not after AND_gate_delay;
and13 <= and01 and S(2) after AND_gate_delay; 
and24 <= and12 and S1_not after  AND_gate_delay; 
and25 <= and12 and S(1) after  AND_gate_delay;
and26 <= and13 and S1_not after  AND_gate_delay; 
and27 <= and13 and S(1) after  AND_gate_delay; 

and38 <= and24 and S0_not after AND_gate_delay; 
and39 <= and24 and S(0)  after AND_gate_delay; 
and310 <= and25 and S0_not after  AND_gate_delay; 
and311 <= and25 and S(0) after  AND_gate_delay; 
and312 <= and26 and S0_not after  AND_gate_delay; 
and313 <= and26 and S(0) after AND_gate_delay; 
and314 <= and27 and S0_not after AND_gate_delay; 
and315 <= and27 and S(0) after  AND_gate_delay; 

and48 <= and38 and I8 after  AND_gate_delay; 
and49 <= and39 and I9 after  AND_gate_delay; 
and410 <= and310 and I10 after  AND_gate_delay; 
and411 <= and311 and I11 after AND_gate_delay; 
and412 <= and312 and I12 after AND_gate_delay; 
and413 <= and313 and I13 after  AND_gate_delay; 
and414 <= and314 and I14 after  AND_gate_delay; 
and415 <= and315 and I15 after  AND_gate_delay; 


and02 <= S(4) and S3_not after  AND_gate_delay; 
and14 <= and02 and S2_not after  AND_gate_delay; 
and15 <= and02 and S(2) after  AND_gate_delay; 
and28 <= and14 and S1_not after  AND_gate_delay; 
and29 <= and14 and S(1) after AND_gate_delay; 
and210 <= and15 and S1_not after AND_gate_delay; 
and211 <= and15 and S(1) after  AND_gate_delay; 
and316 <= and28 and S0_not after  AND_gate_delay; 
and317 <= and28 and S(0) after  AND_gate_delay; 
and318 <= and29 and S0_not after  AND_gate_delay; 
and319 <= and29 and S(0) after AND_gate_delay; 
and320 <= and210 and S0_not after  AND_gate_delay; 
and321 <= and210 and S(0) after  AND_gate_delay; 
and322 <= and211 and S0_not after AND_gate_delay;   
and323 <= and211 and S(0) after AND_gate_delay; 
and416 <= and316 and I16 after AND_gate_delay; 
and417 <= and317 and I17 after AND_gate_delay; 
and418 <= and318 and I18 after  AND_gate_delay; 
and419 <= and319 and I19 after  AND_gate_delay; 
and420 <= and320 and I20 after  AND_gate_delay; 
and421 <= and321 and I21 after  AND_gate_delay; 
and422 <= and322 and I22 after AND_gate_delay; 
and423 <= and323 and I23 after AND_gate_delay; 

and03 <= S(4) and S(3) after AND_gate_delay; 
and16 <= and03 and S2_not after AND_gate_delay; 
and17 <= and03 and S(2) after AND_gate_delay; 
and212 <= and16 and S1_not after AND_gate_delay; 
and213 <=and16 and S(1) after AND_gate_delay; 
and214 <= and17 and S1_not after AND_gate_delay; 
and215 <= and17 and S(1) after AND_gate_delay; 
and324 <= and212 and S0_not  after AND_gate_delay; 
and325 <= and212 and S(0) after AND_gate_delay; 
and326 <= and213 and S0_not  after AND_gate_delay; 
and327 <= and213 and S(0) after AND_gate_delay; 
and328 <= and214 and S0_not after AND_gate_delay; 
and329 <= and214 and S(0) after AND_gate_delay; 
and330 <= and215 and S0_not after AND_gate_delay; 
and331 <= and215 and S(0) after AND_gate_delay; 
and424 <= and324 and I24 after AND_gate_delay; 
and425 <= and325 and I25 after AND_gate_delay; 
and426 <= and326 and I26 after AND_gate_delay; 
and427 <= and327 and I27 after  AND_gate_delay; 
and428 <= and328 and I28 after  AND_gate_delay; 
and429 <= and329 and I29 after  AND_gate_delay; 
and430 <= and330 and I30 after  AND_gate_delay; 
and431 <= and331 and I31 after  AND_gate_delay; 

--OR gates
l1or0 <= and40 or and41 after or_gate_delay;
l1or1 <= and42 or and43 after or_gate_delay;
l1or2 <= and44 or and45 after or_gate_delay;
l1or3 <= and46 or and47 after or_gate_delay;
l1or4 <= and48 or and49 after or_gate_delay;
l1or5 <= and410 or and411 after or_gate_delay;
l1or6 <= and412 or and413 after or_gate_delay;
l1or7 <= and414 or and415 after or_gate_delay;
l1or8 <= and416 or and417 after or_gate_delay;
l1or9 <= and418 or and419 after or_gate_delay;
l1or10 <= and420 or and421 after or_gate_delay;
l1or11 <= and422 or and423 after or_gate_delay;
l1or12 <= and424 or and425 after or_gate_delay;
l1or13 <= and426 or and427 after or_gate_delay;
l1or14 <= and428 or and429 after or_gate_delay;
l1or15 <= and430 or and431 after or_gate_delay;

l2or0 <= l1or0 or l1or1 after or_gate_delay;
l2or1 <= l1or2 or l1or3 after or_gate_delay;
l2or2 <= l1or4 or l1or5 after or_gate_delay;
l2or3 <= l1or6 or l1or7 after or_gate_delay;
l2or4 <= l1or8 or l1or9 after or_gate_delay;
l2or5 <= l1or10 or l1or11 after or_gate_delay;
l2or6 <= l1or12 or l1or13 after or_gate_delay;
l2or7 <= l1or14 or l1or15 after or_gate_delay;

l3or0 <= l2or0 or l2or1 after or_gate_delay;
l3or1 <= l2or2 or l2or3 after or_gate_delay;
l3or2 <= l2or4 or l2or5 after or_gate_delay;
l3or3 <= l2or6 or l2or7 after or_gate_delay;

l4or0 <= l3or0 or l3or1 after or_gate_delay;
l4or1 <= l3or2 or l3or3 after or_gate_delay;

Y <= l4or1 or l4or0 after or_gate_delay;

end Behavioral ;
