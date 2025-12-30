----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2023 05:09:29 PM
-- Design Name: 
-- Module Name: RF_TempDestReg_Decoder_22336688 - Behavioral
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

entity RF_TempDestReg_Decoder_22336688 is
Port ( a , b ,c , d : in STD_LOGIC;
 D0 , D1 , D2 , D3 : out STD_LOGIC ;
 D4 , D5 , D6 , D7 : out STD_LOGIC ;
 D8 , D9 , D10 , D11 : out STD_LOGIC ;
 D12 , D13 , D14, D15 : out STD_LOGIC );

 end RF_TempDestReg_Decoder_22336688 ;

  architecture Behavioral of RF_TempDestReg_Decoder_22336688 is
 signal a_not, b_not, c_not, d_not : std_logic ;

 signal S00, S01, S02, S03 : std_logic;
 signal S10, S11, S12, S13, S14, S15, S16, S17 : std_logic;
 
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

 
S00 <= a_not and b_not after AND_gate_delay;
    S10 <= c_not and S00 after AND_gate_delay;
            D0 <= S10 and d_not after AND_gate_delay;
            D1 <= S10 and d after AND_gate_delay;

    S11 <= c and S00 after AND_gate_delay;
               D2 <= S11 and d_not after AND_gate_delay;
               D3 <= S11 and d after AND_gate_delay; --00101

--
S01 <= a_not and b after AND_gate_delay;
    S12 <= c_not and S01 after AND_gate_delay;
            D4<= S12 and d_not after AND_gate_delay;
            D5 <= S12 and d after AND_gate_delay;


    S13 <= c and S01 after AND_gate_delay;
               D6 <= S13 and d_not after AND_gate_delay;
               D7 <= S13 and d after AND_gate_delay;

--
S02 <= a and b_not after AND_gate_delay;
    S14 <= c_not and S02 after AND_gate_delay;
            D8<= S14 and d_not after AND_gate_delay;
            D9 <= S14 and d after AND_gate_delay;

    S15 <= c and S02 after AND_gate_delay;
               D10 <= S15 and d_not after AND_gate_delay;
               D11<= S15 and d after AND_gate_delay;

--
S03 <= a and b after AND_gate_delay;
    S16 <= c_not and S03 after AND_gate_delay;
            D12<= S16 and d_not after AND_gate_delay;
            D13 <= S16 and d after AND_gate_delay;
 
    S17<= c and S03 after AND_gate_delay;
               D14 <= S17 and d_not after AND_gate_delay;
               D15 <= S17 and d after AND_gate_delay;

end Behavioral ;