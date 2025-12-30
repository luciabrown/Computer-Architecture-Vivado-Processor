----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 08:17:09 PM
-- Design Name: 
-- Module Name: CPU_IR_22336688 - Behavioral
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
entity CPU_IR_22336688 is
Port (
Clock: in std_logic;
IL: in std_logic;
Instruction: in std_logic_vector(31 downto 0);
DR: out std_logic_vector(4 downto 0);
Opcode: out std_logic_vector(16 downto 0);
SA: out std_logic_vector(4 downto 0);
SB: out  std_logic_vector(4 downto 0)
 );
end CPU_IR_22336688;

architecture Behavioral of CPU_IR_22336688 is
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1
 
 COMPONENT CPU_DFlipFlop_22336688
 Port ( D : in STD_LOGIC;
     Reset:  in STD_LOGIC;	
    Clock : in STD_LOGIC;
    Q : out STD_LOGIC);
 END COMPONENT;
 
    signal OR_D : std_logic_vector (31 downto 0);
    signal Not_Load : std_logic;
    signal Not_Load_And : std_logic_vector (31 downto 0);
    signal Load_And, flipflopOut : std_logic_vector (31 downto 0);
 
begin
Not_Load<= not IL after not_gate_delay;
Load_And(0)<= Instruction(0) and IL after and_gate_delay;
Load_And(1)<=Instruction(1) and IL after and_gate_delay;
Load_And(2)<=Instruction(2) and IL after and_gate_delay;
Load_And(3)<=Instruction(3) and IL after and_gate_delay;
Load_And(4)<=Instruction(4) and IL after and_gate_delay;
Load_And(5)<=Instruction(5) and IL after and_gate_delay;
Load_And(6)<=Instruction(6) and IL after and_gate_delay;
Load_And(7)<=Instruction(7) and IL after and_gate_delay;
Load_And(8)<=Instruction(8) and IL after and_gate_delay;
Load_And(9)<=Instruction(9) and IL after and_gate_delay;
Load_And(10)<=Instruction(10) and IL after and_gate_delay;
Load_And(11)<=Instruction(11) and IL after and_gate_delay;
Load_And(12)<=Instruction(12) and IL after and_gate_delay;
Load_And(13)<=Instruction(13) and IL after and_gate_delay;
Load_And(14)<=Instruction(14) and IL after and_gate_delay;
Load_And(15)<=Instruction(15) and IL after and_gate_delay;
Load_And(16)<=Instruction(16) and IL after and_gate_delay;
Load_And(17)<=Instruction(17) and IL after and_gate_delay;
Load_And(18)<=Instruction(18) and IL after and_gate_delay;
Load_And(19)<=Instruction(19) and IL after and_gate_delay;
Load_And(20)<=Instruction(20) and IL after and_gate_delay;
Load_And(21)<=Instruction(21) and IL after and_gate_delay;
Load_And(22)<=Instruction(22) and IL after and_gate_delay;
Load_And(23)<=Instruction(23) and IL after and_gate_delay;
Load_And(24)<=Instruction(24) and IL after and_gate_delay;
Load_And(25)<=Instruction(25) and IL after and_gate_delay;
Load_And(26)<=Instruction(26) and IL after and_gate_delay;
Load_And(27)<=Instruction(27) and IL after and_gate_delay;
Load_And(28)<=Instruction(28) and IL after and_gate_delay;
Load_And(29)<=Instruction(29) and IL after and_gate_delay;
Load_And(30)<=Instruction(30) and IL after and_gate_delay;
Load_And(31)<=Instruction(31) and IL after and_gate_delay;

Not_Load_And(0)<= flipflopOut(0) and Not_Load after and_gate_delay;
Not_Load_And(1)<= flipflopOut(1) and Not_Load after and_gate_delay;
Not_Load_And(2)<= flipflopOut(2) and Not_Load after and_gate_delay;
Not_Load_And(3)<= flipflopOut(3) and Not_Load after and_gate_delay;
Not_Load_And(4)<= flipflopOut(4) and Not_Load after and_gate_delay;
Not_Load_And(5)<= flipflopOut(5) and Not_Load after and_gate_delay;
Not_Load_And(6)<= flipflopOut(6) and Not_Load after and_gate_delay;
Not_Load_And(7)<= flipflopOut(7) and Not_Load after and_gate_delay;
Not_Load_And(8)<= flipflopOut(8) and Not_Load after and_gate_delay;
Not_Load_And(9)<= flipflopOut(9) and Not_Load after and_gate_delay;
Not_Load_And(10)<= flipflopOut(10) and Not_Load after and_gate_delay;
Not_Load_And(11)<= flipflopOut(11) and Not_Load after and_gate_delay;
Not_Load_And(12)<= flipflopOut(12) and Not_Load after and_gate_delay;
Not_Load_And(13)<= flipflopOut(13) and Not_Load after and_gate_delay;
Not_Load_And(14)<= flipflopOut(14) and Not_Load after and_gate_delay;
Not_Load_And(15)<= flipflopOut(15) and Not_Load after and_gate_delay;
Not_Load_And(16)<= flipflopOut(16) and Not_Load after and_gate_delay;
Not_Load_And(17)<= flipflopOut(17) and Not_Load after and_gate_delay;
Not_Load_And(18)<= flipflopOut(18) and Not_Load after and_gate_delay;
Not_Load_And(19)<= flipflopOut(19) and Not_Load after and_gate_delay;
Not_Load_And(20)<= flipflopOut(20) and Not_Load after and_gate_delay;
Not_Load_And(21)<= flipflopOut(21) and Not_Load after and_gate_delay;
Not_Load_And(22)<= flipflopOut(22) and Not_Load after and_gate_delay;
Not_Load_And(23)<= flipflopOut(23) and Not_Load after and_gate_delay;
Not_Load_And(24)<= flipflopOut(24) and Not_Load after and_gate_delay;
Not_Load_And(25)<= flipflopOut(25) and Not_Load after and_gate_delay;
Not_Load_And(26)<= flipflopOut(26) and Not_Load after and_gate_delay;
Not_Load_And(27)<= flipflopOut(27) and Not_Load after and_gate_delay;
Not_Load_And(28)<= flipflopOut(28) and Not_Load after and_gate_delay;
Not_Load_And(29)<= flipflopOut(29) and Not_Load after and_gate_delay;
Not_Load_And(30)<= flipflopOut(30) and Not_Load after and_gate_delay;
Not_Load_And(31)<= flipflopOut(31) and Not_Load after and_gate_delay;

OR_D(0)<=Load_And(0) or Not_Load_And(0) after or_Gate_delay;
OR_D(1)<=Load_And(1) or Not_Load_And(1) after or_Gate_delay;
OR_D(2)<=Load_And(2) or Not_Load_And(2) after or_Gate_delay;
OR_D(3)<=Load_And(3) or Not_Load_And(3) after or_Gate_delay;
OR_D(4)<=Load_And(4) or Not_Load_And(4) after or_Gate_delay;
OR_D(5)<=Load_And(5) or Not_Load_And(5) after or_Gate_delay;
OR_D(6)<=Load_And(6) or Not_Load_And(6) after or_Gate_delay;
OR_D(7)<=Load_And(7) or Not_Load_And(7) after or_Gate_delay;
OR_D(8)<=Load_And(8) or Not_Load_And(8) after or_Gate_delay;
OR_D(9)<=Load_And(9) or Not_Load_And(9) after or_Gate_delay;
OR_D(10)<=Load_And(10) or Not_Load_And(10) after or_Gate_delay;
OR_D(11)<=Load_And(11) or Not_Load_And(11) after or_Gate_delay;
OR_D(12)<=Load_And(12) or Not_Load_And(12) after or_Gate_delay;
OR_D(13)<=Load_And(13) or Not_Load_And(13) after or_Gate_delay;
OR_D(14)<=Load_And(14) or Not_Load_And(14) after or_Gate_delay;
OR_D(15)<=Load_And(15) or Not_Load_And(15) after or_Gate_delay;
OR_D(16)<=Load_And(16) or Not_Load_And(16) after or_Gate_delay;
OR_D(17)<=Load_And(17) or Not_Load_And(17) after or_Gate_delay;
OR_D(18)<=Load_And(18) or Not_Load_And(18) after or_Gate_delay;
OR_D(19)<=Load_And(19) or Not_Load_And(19) after or_Gate_delay;
OR_D(20)<=Load_And(20) or Not_Load_And(20) after or_Gate_delay;
OR_D(21)<=Load_And(21) or Not_Load_And(21) after or_Gate_delay;
OR_D(22)<=Load_And(22) or Not_Load_And(22) after or_Gate_delay;
OR_D(23)<=Load_And(23) or Not_Load_And(23) after or_Gate_delay;
OR_D(24)<=Load_And(24) or Not_Load_And(24) after or_Gate_delay;
OR_D(25)<=Load_And(25) or Not_Load_And(25) after or_Gate_delay;
OR_D(26)<=Load_And(26) or Not_Load_And(26) after or_Gate_delay;
OR_D(27)<=Load_And(27) or Not_Load_And(27) after or_Gate_delay;
OR_D(28)<=Load_And(28) or Not_Load_And(28) after or_Gate_delay;
OR_D(29)<=Load_And(29) or Not_Load_And(29) after or_Gate_delay;
OR_D(30)<=Load_And(30) or Not_Load_And(30) after or_Gate_delay;
OR_D(31)<=Load_And(31) or Not_Load_And(31) after or_Gate_delay;


-- Opcode<=OR_D(31 downto 15);
 Opcode16:CPU_DFlipFlop_22336688 port map(
 D=>OR_D(31),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(31)
 );
 Opcode15:CPU_DFlipFlop_22336688 port map(
  D=>OR_D(30),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(30)
 );
 Opcode14:CPU_DFlipFlop_22336688 port map(
   D=>OR_D(29),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(29)
 );
 Opcode13:CPU_DFlipFlop_22336688 port map(
   D=>OR_D(28),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(28)
 );
 Opcode12:CPU_DFlipFlop_22336688 port map(
   D=>OR_D(27),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(27)
 );
 Opcode11:CPU_DFlipFlop_22336688 port map(
   D=>OR_D(26),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(26)
 );
 Opcode10:CPU_DFlipFlop_22336688 port map(
   D=>OR_D(25),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(25)
 );
 Opcode09:CPU_DFlipFlop_22336688 port map(
   D=>OR_D(24),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(24)
 );
 Opcode08:CPU_DFlipFlop_22336688 port map(
   D=>OR_D(23),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(23)
 );
 Opcode07:CPU_DFlipFlop_22336688 port map(
   D=>OR_D(22),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(22)
 );
 Opcode06:CPU_DFlipFlop_22336688 port map(
   D=>OR_D(21),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(21)
 );
 Opcode05:CPU_DFlipFlop_22336688 port map(
   D=>OR_D(20),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(20)
 );
 Opcode04:CPU_DFlipFlop_22336688 port map(
   D=>OR_D(19),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(19)
 );
 Opcode03:CPU_DFlipFlop_22336688 port map(
   D=>OR_D(18),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(18)
 );
 Opcode02:CPU_DFlipFlop_22336688 port map(
   D=>OR_D(17),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(17)
 );
 Opcode01:CPU_DFlipFlop_22336688 port map(
   D=>OR_D(16),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(16)
 );
 Opcode00:CPU_DFlipFlop_22336688 port map(
   D=>OR_D(15),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(15)
 );
 
 -- DR<=OR_D(14 downto 10);
 DR04:CPU_DFlipFlop_22336688 port map(
    D=>OR_D(14),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(14)
 );
 DR03:CPU_DFlipFlop_22336688 port map(
     D=>OR_D(13),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(13)
 );
 DR02:CPU_DFlipFlop_22336688 port map(
     D=>OR_D(12),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(12)
 );
 DR01:CPU_DFlipFlop_22336688 port map(
     D=>OR_D(11),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(11)
 );
 DR00:CPU_DFlipFlop_22336688 port map(
     D=>OR_D(10),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(10)
 );
 -- SA<=OR_D(9 downto 5);
 SA04:CPU_DFlipFlop_22336688 port map(
      D=>OR_D(9),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(9)
 );
 SA03:CPU_DFlipFlop_22336688 port map(
       D=>OR_D(8),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(8)
 );
 SA02:CPU_DFlipFlop_22336688 port map(
       D=>OR_D(7),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(7)
 );
 SA01:CPU_DFlipFlop_22336688 port map(
       D=>OR_D(6),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(6)
 );
 SA00:CPU_DFlipFlop_22336688 port map(
       D=>OR_D(5),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(5)
 );
 -- SB<=OR_D(4 downto 0);
 SB04:CPU_DFlipFlop_22336688 port map(
        D=>OR_D(4),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(4)
 );
 SB03:CPU_DFlipFlop_22336688 port map(
         D=>OR_D(3),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(3)
 );
 SB02:CPU_DFlipFlop_22336688 port map(
         D=>OR_D(2),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(2)
 );
 SB01:CPU_DFlipFlop_22336688 port map(
         D=>OR_D(1),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(1)
 );
 SB00:CPU_DFlipFlop_22336688 port map(
         D=>OR_D(0),
 Reset=>'0',
 Clock=>Clock,
 Q=>flipflopOut(0)
 );

Opcode(16)<=flipflopOut(31);
Opcode(15)<=flipflopOut(30);
Opcode(14)<=flipflopOut(29);
Opcode(13)<=flipflopOut(28);
Opcode(12)<=flipflopOut(27);
Opcode(11)<=flipflopOut(26);
Opcode(10)<=flipflopOut(25);
Opcode(9)<=flipflopOut(24);
Opcode(8)<=flipflopOut(23);
Opcode(7)<=flipflopOut(22);
Opcode(6)<=flipflopOut(21);
Opcode(5)<=flipflopOut(20);
Opcode(4)<=flipflopOut(19);
Opcode(3)<=flipflopOut(18);
Opcode(2)<=flipflopOut(17);
Opcode(1)<=flipflopOut(16);
Opcode(0)<=flipflopOut(15);

DR(4)<=flipflopOut(14);
DR(3)<=flipflopOut(13);
DR(2)<=flipflopOut(12);
DR(1)<=flipflopOut(11);
DR(0)<=flipflopOut(10);

SA(4)<=flipflopOut(9);
SA(3)<=flipflopOut(8);
SA(2)<=flipflopOut(7);
SA(1)<=flipflopOut(6);
SA(0)<=flipflopOut(5);

SB(4)<=flipflopOut(4);
SB(3)<=flipflopOut(3);
SB(2)<=flipflopOut(2);
SB(1)<=flipflopOut(1);
SB(0)<=flipflopOut(0);




end Behavioral;  
