----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Lucia Brown
-- 
-- Create Date: 11/22/2023 04:05:10 PM
-- Design Name: 
-- Module Name: CPU_DFlipFlop_22336688 - Behavioral
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

entity CPU_DFlipFlop_22336688 is
    Port ( D : in STD_LOGIC;
           Reset:  in STD_LOGIC;
           Clock : in STD_LOGIC;
           Q : out STD_LOGIC);
end CPU_DFlipFlop_22336688;

architecture Behavioral of CPU_DFlipFlop_22336688 is
   
   signal Q_t, Q_not_t, Reset_not, X, K, S, R, L, Y, Z, M : std_logic;
   
   constant AND_gate_delay : Time := 9ns;    
   constant NAND_gate_delay : Time :=9ns;     
   constant OR_gate_delay : Time := 7ns;      
   constant NOR_gate_delay : Time := 7ns;     
   constant XOR_gate_delay : Time := 4ns;     
   constant XNOR_gate_delay : Time := 4ns;     
   constant NOT_gate_delay : Time := 3ns;      
   
begin

    Reset_not <= not Reset after NOT_gate_delay;
    X <= Y nand S after NAND_gate_delay;

    K <= X and Clock after AND_gate_delay;
    S <= K nand Reset_not after NAND_gate_delay;
    
    Z <= S and Clock after AND_gate_delay;
        R <= Z nand Y after NAND_gate_delay;

    L <= R and D after AND_gate_delay;
    Y <= L nand Reset_not after NAND_gate_delay;
    
    Q_t <= S nand Q_not_t after NAND_gate_delay;

    M <= R and Q_t after AND_gate_delay;
    Q_not_t <= M nand Reset_not after NAND_gate_delay;

    Q <= Q_t;

end Behavioral;