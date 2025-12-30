----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 02:51:08 PM
-- Design Name: 
-- Module Name: CPU_StatusRegister_22336688 - Behavioral
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
entity CPU_StatusRegister_22336688 is
Port (
Clock : in std_logic;
C_Flag : in std_logic;
Reset_C : in std_logic;
N_Flag : in std_logic;
LoadFlags : in std_logic;
Reset_N : in std_logic;
V_Flag : in std_logic;
Reset_V : in std_logic;
Z_Flag : in std_logic;
Reset_Z : in std_logic;
StatusVector : out std_logic_vector(3 downto 0)
 );
end CPU_StatusRegister_22336688;
architecture Behavioral of CPU_StatusRegister_22336688 is
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 =8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
 constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
 constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1

 COMPONENT CPU_DFlipFlop_22336688
 PORT(
 Clock : in std_logic;
 D : in std_logic;
 Reset : in std_logic;
 Q : out std_logic
 );
 END COMPONENT;
 
 signal CFlagOut : std_logic;
 signal NFlagOut : std_logic;
 signal VFlagOut : std_logic;
 signal ZFlagOut : std_logic;
 signal notLoad : std_logic;
 signal LoadAnd,NotLoadAnd, OrD: std_logic_vector(3 downto 0);


begin
notLoad<= not LoadFlags after not_gate_delay;
LoadAnd(0)<= C_Flag and LoadFlags after and_gate_delay;
LoadAnd(2)<= V_Flag and LoadFlags after and_gate_delay;
LoadAnd(1)<= N_Flag and LoadFlags after and_gate_delay;
LoadAnd(3)<= Z_Flag and LoadFlags after and_gate_delay;

NotLoadAnd(0)<= notLoad and CFlagOut after and_gate_delay;
NotLoadAnd(2)<= notLoad and VFlagOut after and_gate_delay;
NotLoadAnd(1)<= notLoad and NFlagOut after and_gate_delay;
NotLoadAnd(3)<= notLoad and ZFlagOut after and_gate_delay;

OrD(0)<= LoadAnd(0) or NotLoadAnd(0) after or_gate_delay;
OrD(1)<= LoadAnd(1) or NotLoadAnd(1) after or_gate_delay;
OrD(2)<= LoadAnd(2) or NotLoadAnd(2) after or_gate_delay;
OrD(3)<= LoadAnd(3) or NotLoadAnd(3) after or_gate_delay;


CFlag: CPU_DFlipFlop_22336688 Port map(
    Clock=>Clock,
    D=>OrD(0),
    Q=>CFlagOut,
    Reset=>Reset_C
);

NFlag: CPU_DFlipFlop_22336688 Port map(
    Clock=>Clock,
    D=>OrD(1),
    Q=>NFlagOut,
    Reset=>Reset_N
);

VFlag: CPU_DFlipFlop_22336688 Port map(
    Clock=>Clock,
    D=>OrD(2),
    Q=>VFlagOut,
    Reset=>Reset_V
);

ZFlag: CPU_DFlipFlop_22336688 Port map(
    Clock=>Clock,
    D=>OrD(3),
    Q=>ZFlagOut,
    Reset=>Reset_Z
);


StatusVector(3)<=ZFlagOut;
StatusVector(2)<=VFlagOut;
StatusVector(1)<=NFlagOut;
StatusVector(0)<=CFlagOut;
end Behavioral;
