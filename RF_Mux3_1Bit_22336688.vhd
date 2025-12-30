-----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Lucia Brown
-- 
-- Create Date: 10/02/2023 09:02:42 PM
-- Design Name: 
-- Module Name: RF_Mux3_1Bit_22336688 - Behavioral
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

 entity RF_Mux3_1Bit_22336688 is
 Port (I0,I1,I2 :in STD_LOGIC;
 S : in STD_LOGIC_VECTOR(1 DOWNTO 0);
 Y : out STD_LOGIC);
 
 end RF_Mux3_1Bit_22336688 ;

 architecture Behavioral of RF_Mux3_1Bit_22336688 is
 
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
 
 signal S0_not, S1_not : STD_LOGIC;
 
 --s0
 signal and00 , and01, and02, and03 : std_logic ;

--s1
 signal and10 , and11 , and12, and13: std_logic ;-- , and13 : std_logic ;
 

signal l1or0, l1or1 : std_logic;
 
 begin
 S0_not <= not S (0) after not_gate_delay;
 S1_not <= not S (1) after not_gate_delay;
 
 and00 <= S1_not and S0_not after and_gate_delay;
 and01 <= S1_not and S(0) after and_gate_delay;
 and02 <= S(1) and S0_not after and_gate_delay;
 and03 <= S(1) and S(0) after and_gate_delay;
 
 and10<= and00 and I0 after and_gate_delay;
 and11<= and01 and I1 after and_gate_delay;
 and12<= and02 and I2 after and_gate_delay;
 --and13<= and03 and I3 after and_gate_delay;
 
 l1or0 <= and10 or and11 after or_gate_delay;
 l1or1 <= and12 or and03 after or_gate_delay;
 Y <= l1or0 or l1or1 after or_gate_delay;


 end Behavioral ;
