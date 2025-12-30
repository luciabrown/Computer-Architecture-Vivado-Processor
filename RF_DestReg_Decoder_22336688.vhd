----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Lucia Brown
-- 
-- Create Date: 10/03/2023 04:57:41 PM
-- Design Name: 
-- Module Name: RF_DestReg_Decoder_22336688 - Behavioral
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

 library IEEE ;
 use IEEE . STD_LOGIC_1164 .ALL;

 entity RF_DestReg_Decoder_22336688 is
Port ( a , b ,c , d , e : in STD_LOGIC;
 D0 , D1 , D2 , D3 : out STD_LOGIC ;
 D4 , D5 , D6 , D7 : out STD_LOGIC ;
 D8 , D9 , D10 , D11 : out STD_LOGIC ;
 D12 , D13 , D14, D15 : out STD_LOGIC ;
 D16 , D17 , D18, D19 : out STD_LOGIC ;
 D20 , D21 , D22, D23 : out STD_LOGIC ;
 D24 , D25 , D26, D27 : out STD_LOGIC ;
 D28 , D29 , D30, D31 : out STD_LOGIC) ;
 end RF_DestReg_Decoder_22336688    ;

 architecture Behavioral of RF_DestReg_Decoder_22336688 is
 signal a_not, b_not, c_not, d_not, e_not : std_logic ;

 signal S00, S01, S02, S03 : std_logic;
 signal S10, S11, S12, S13, S14, S15, S16, S17 : std_logic;
signal S20, S21, S22, S23, S24, S25, S26, S27, S28, S29, S210, S211, S212, S213, S214, S215 : std_logic;

 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 = 8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7 =6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1

begin
a_not <= not a after NOT_gate_delay;
b_not <= not b after NOT_gate_delay;
c_not <= not c after NOT_gate_delay;
d_not <= not d after NOT_gate_delay;
e_not <= not e after NOT_gate_delay;

S00 <= a_not and b_not after AND_gate_delay;

    S10 <= c_not and S00 after AND_gate_delay;
    
        S20 <= d_not and S10 after AND_gate_delay;
            D0 <= S20 and e_not after AND_gate_delay;
            D1 <= S20 and e after AND_gate_delay;
        
        S21 <= d and S10 after AND_gate_delay;
            D2 <= e_not and S21 after AND_gate_delay;
            D3 <= e and s21 after AND_gate_delay;

    S11 <= c and S00 after AND_gate_delay;
        S22 <= d_not and S11 after AND_gate_delay;
               D4 <= S22 and e_not after AND_gate_delay;
               D5 <= S22 and e after AND_gate_delay; --00101
        S23 <= d and S11 after AND_gate_delay;
            D6 <= e_not and S23 after AND_gate_delay;
            D7 <= e and s23 after AND_gate_delay;    
--
S01 <= a_not and b after AND_gate_delay;

    S12 <= c_not and S01 after AND_gate_delay;
    
        S24 <= d_not and S12 after AND_gate_delay;
            D8 <= S24 and e_not after AND_gate_delay;
            D9 <= S24 and e after AND_gate_delay;
        
        S25 <= d and S12 after AND_gate_delay;
            D10 <= e_not and S25 after AND_gate_delay;
            D11<= e and s25 after AND_gate_delay;

    S13 <= c and S01 after AND_gate_delay;
        S26 <= d_not and S13 after AND_gate_delay;
               D12 <= S26 and e_not after AND_gate_delay;
               D13 <= S26 and e after AND_gate_delay;
        S27 <= d and S13 after AND_gate_delay;
            D14 <= e_not and S27 after AND_gate_delay; --01110
            D15<= e and s27 after AND_gate_delay; 
--
S02 <= a and b_not after AND_gate_delay;

    S14 <= c_not and S02 after AND_gate_delay;
    
        S28 <= d_not and S14 after AND_gate_delay;
            D16<= S28 and e_not after AND_gate_delay;
            D17 <= S28 and e after AND_gate_delay;
        
        S29 <= d and S14 after AND_gate_delay;
            D18 <= e_not and S29 after AND_gate_delay;
            D19<= e and s29 after AND_gate_delay;

    S15 <= c and S02 after AND_gate_delay;
        S210 <= d_not and S15 after AND_gate_delay;
               D20 <= S210 and e_not after AND_gate_delay;--10100
               D21 <= S210 and e after AND_gate_delay;
        S211 <= d and S15 after AND_gate_delay;
            D22 <= e_not and S211 after AND_gate_delay;
            D23<= e and s211 after AND_gate_delay;
--
S03 <= a and b after AND_gate_delay;

    S16 <= c_not and S03 after AND_gate_delay;
    
        S212 <= d_not and S16 after AND_gate_delay;
            D24<= S212 and e_not after AND_gate_delay;
            D25 <= S212 and e after AND_gate_delay;
        
        S213 <= d and S16 after AND_gate_delay;
            D26 <= e_not and S213 after AND_gate_delay;
            D27<= e and s213 after AND_gate_delay;

    S17<= c and S03 after AND_gate_delay;
        S214 <= d_not and S17 after AND_gate_delay;
               D28 <= S214 and e_not after AND_gate_delay;
               D29 <= S214 and e after AND_gate_delay;
               
        S215 <= d and S17 after AND_gate_delay;
            D30 <= e_not and S215 after AND_gate_delay;
            D31<= e and s215 after AND_gate_delay;


end Behavioral ;
