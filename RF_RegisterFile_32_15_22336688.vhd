----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Lucia Brown 22336688
-- 
-- Create Date: 10/03/2023 05:40:24 PM
-- Design Name: 
-- Module Name: RF_RegisterFile_32_15_22336688 - Behavioral
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
 entity RF_RegisterFile_32_15_22336688 is
 Port (
 CLOCK, Reset : in STD_LOGIC;
  D : in STD_LOGIC_VECTOR (31 downto 0);
  DR : in STD_LOGIC_VECTOR (4 downto 0);
  RW : in STD_LOGIC;
  SA : in STD_LOGIC_VECTOR (4 downto 0);
  SB : in STD_LOGIC_VECTOR (4 downto 0);
  TA : in STD_LOGIC_VECTOR (3 downto 0);
  TB : in STD_LOGIC_VECTOR (3 downto 0);
  TD : in STD_LOGIC_VECTOR (3 downto 0);
  A :  out STD_LOGIC_VECTOR (31 downto 0);
  B :  out STD_LOGIC_VECTOR (31 downto 0));
end RF_RegisterFile_32_15_22336688;

architecture Behavioral of RF_RegisterFile_32_15_22336688 is

COMPONENT RF_DestReg_Decoder_22336688  is
Port ( a , b ,c , d , e : in STD_LOGIC;
 D0 , D1 , D2 , D3 : out STD_LOGIC ;
 D4 , D5 , D6 , D7 : out STD_LOGIC ;
 D8 , D9 , D10 , D11 : out STD_LOGIC ;
 D12 , D13 , D14, D15 : out STD_LOGIC ;
 D16 , D17 , D18, D19 : out STD_LOGIC ;
 D20 , D21 , D22, D23 : out STD_LOGIC ;
 D24 , D25 , D26, D27 : out STD_LOGIC ;
 D28 , D29 , D30, D31 : out STD_LOGIC );
END COMPONENT;

COMPONENT RF_TempDestReg_Decoder_22336688 is
Port ( a , b ,c , d : in STD_LOGIC;
 D0 , D1 , D2 , D3 : out STD_LOGIC ;
 D4 , D5 , D6 , D7 : out STD_LOGIC ;
 D8 , D9 , D10 , D11 : out STD_LOGIC ;
 D12 , D13 , D14, D15 : out STD_LOGIC) ;
END COMPONENT;

COMPONENT RF_Register32bit_22336688	 is
--RF_Register32bit_22336688	THIRTY TWO TIMES FOR RegisterXX (0-31) THEN FIFTEN TIMES FOR TempRegXX (01-15)!
Port ( CLK : in STD_LOGIC;
 Load, Reset : in STD_LOGIC;
 D : in STD_LOGIC_VECTOR (31 downto 0) ;
 Q : out STD_LOGIC_VECTOR (31 downto 0) );
END COMPONENT;

COMPONENT RF_Mux32_32Bit_22336688 is
  Port (I0,I1,I2,I3 : in STD_LOGIC_VECTOR (31 downto 0) ;
 I4 , I5 , I6 , I7 : in STD_LOGIC_VECTOR (31 downto 0) ;
 I8 , I9 , I10 , I11 : in STD_LOGIC_VECTOR (31 downto 0) ;
 I12 , I13 , I14, I15 : in STD_LOGIC_VECTOR (31 downto 0) ;
 I16 , I17 , I18, I19 : in STD_LOGIC_VECTOR (31 downto 0) ;
 I20 , I21 , I22, I23 : in STD_LOGIC_VECTOR (31 downto 0) ;
 I24 , I25 , I26, I27 : in STD_LOGIC_VECTOR (31 downto 0) ;
 I28 , I29 , I30, I31 : in STD_LOGIC_VECTOR (31 downto 0) ;
 S : in STD_LOGIC_VECTOR (4 downto 0) ;
 y : out STD_LOGIC_VECTOR (31 downto 0) );
END COMPONENT;

COMPONENT RF_Mux16_32Bit_22336688 is
 Port ( I0 , I1 , I2 , I3 : in STD_LOGIC_VECTOR (31 downto 0) ;
 I4 , I5 , I6 , I7 : in STD_LOGIC_VECTOR (31 downto 0) ;
 I8 , I9 , I10 , I11 : in STD_LOGIC_VECTOR (31 downto 0) ;
 I12 , I13 , I14, I15 : in STD_LOGIC_VECTOR (31 downto 0) ;

 S : in STD_LOGIC_VECTOR (3 downto 0) ;
 y : out STD_LOGIC_VECTOR (31 downto 0) );
END COMPONENT;

--signals
 constant AND_gate_delay : Time := 9 ns ; -- least significant digit 9 = 8+1
 constant NAND_gate_delay : Time := 9 ns ; -- next more significant digit 9=8+1
constant OR_gate_delay : Time := 7 ns ; -- next more significant digit 7 =6+1
 constant NOR_gate_delay : Time := 7 ns ; -- next more significant digit 7=6+1
constant XOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
constant XNOR_gate_delay : Time := 4 ns ; -- next more significant digit 4=3+1
 constant NOT_gate_delay : Time := 3 ns ; -- next more significant digit 3=2+1

--output from the TempDestDecoder
signal DT00 ,DT01,DT02 ,DT03, DT04, DT05, DT06, DT07, DT08, DT09, DT10,DT11, DT12, DT13, DT14, DT15 : std_logic;

--output from the DestDecoder
signal Q00, Q01,Q02,Q03,Q04,Q05,Q06,Q07,Q08,Q09,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31 : std_logic;

--enable logic for temp registers
signal AND_Gate_to_TempReg01_i, AND_Gate_to_TempReg02_i, AND_Gate_to_TempReg03_i, AND_Gate_to_TempReg04_i, AND_Gate_to_TempReg05_i, AND_Gate_to_TempReg06_i, AND_Gate_to_TempReg07_i : STD_LOGIC;
signal AND_Gate_to_TempReg08_i, AND_Gate_to_TempReg09_i, AND_Gate_to_TempReg10_i, AND_Gate_to_TempReg11_i, AND_Gate_to_TempReg12_i, AND_Gate_to_TempReg13_i, AND_Gate_to_TempReg14_i, AND_Gate_to_TempReg15_i : STD_LOGIC;

--enable logic for destination registers
signal AND_Gate_to_Register000_i, AND_Gate_to_Register010_i, AND_Gate_to_Register020_i,  AND_Gate_to_Register030_i,  AND_Gate_to_Register040_i,  AND_Gate_to_Register050_i, AND_Gate_to_Register060_i, AND_Gate_to_Register070_i : STD_LOGIC;
signal AND_Gate_to_Register080_i, AND_Gate_to_Register090_i, AND_Gate_to_Register100_i,  AND_Gate_to_Register110_i,  AND_Gate_to_Register120_i,  AND_Gate_to_Register130_i, AND_Gate_to_Register140_i, AND_Gate_to_Register150_i : STD_LOGIC;
signal AND_Gate_to_Register160_i, AND_Gate_to_Register170_i, AND_Gate_to_Register180_i,  AND_Gate_to_Register190_i,  AND_Gate_to_Register200_i,  AND_Gate_to_Register210_i, AND_Gate_to_Register220_i, AND_Gate_to_Register230_i : STD_LOGIC;
signal AND_Gate_to_Register240_i, AND_Gate_to_Register250_i, AND_Gate_to_Register260_i,  AND_Gate_to_Register270_i,  AND_Gate_to_Register280_i,  AND_Gate_to_Register290_i, AND_Gate_to_Register300_i, AND_Gate_to_Register310_i : STD_LOGIC;


signal AND_Gate_to_Register00_i, AND_Gate_to_Register01_i, AND_Gate_to_Register02_i,  AND_Gate_to_Register03_i,  AND_Gate_to_Register04_i,  AND_Gate_to_Register05_i, AND_Gate_to_Register06_i, AND_Gate_to_Register07_i : STD_LOGIC;
signal AND_Gate_to_Register08_i, AND_Gate_to_Register09_i, AND_Gate_to_Register10_i,  AND_Gate_to_Register11_i,  AND_Gate_to_Register12_i,  AND_Gate_to_Register13_i, AND_Gate_to_Register14_i, AND_Gate_to_Register15_i : STD_LOGIC;
signal AND_Gate_to_Register16_i, AND_Gate_to_Register17_i, AND_Gate_to_Register18_i,  AND_Gate_to_Register19_i,  AND_Gate_to_Register20_i,  AND_Gate_to_Register21_i, AND_Gate_to_Register22_i, AND_Gate_to_Register23_i : STD_LOGIC;
signal AND_Gate_to_Register24_i, AND_Gate_to_Register25_i, AND_Gate_to_Register26_i,  AND_Gate_to_Register27_i,  AND_Gate_to_Register28_i,  AND_Gate_to_Register29_i, AND_Gate_to_Register30_i, AND_Gate_to_Register31_i : STD_LOGIC;


signal reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,reg11,reg12,reg13,reg14,reg15,reg16,reg17,reg18,reg19,reg20,reg21,reg22,reg23,reg24,reg25,reg26,reg27,reg28,reg29,reg30,reg31 : STD_LOGIC_VECTOR(31 downto 0);
signal Treg0,Treg1,Treg2,Treg3,Treg4,Treg5,Treg6,Treg7,Treg8,Treg9,Treg10,Treg11,Treg12,Treg13,Treg14,Treg15 : std_logic_vector(31 downto 0 );

signal mux32Aout, mux32Bout :STD_LOGIC_VECTOR(31 downto 0);

begin

DestReg_Decoder : RF_DestReg_Decoder_22336688  PORT MAP(
 a =>DR(4), b=>DR(3) ,c =>DR(2), d =>DR(1), e=>DR(0),
 D0 => Q00, D1=>Q01, D2=>Q02, D3=>Q03,D4=>Q04 , D5 => Q05, D6 => Q06, D7 => Q07, D8 => Q08, D9 => Q09, D10 => Q10, D11 => Q11, D12=>Q12, D13=>Q13,D14=>Q14,D15=>Q15, D16 => Q16, D17=>Q17, D18=>Q18, D19=>Q19,
 D20=>Q20 , D21=> Q21, D22=>Q22,D23=>Q23, D24=>Q24, D25=>Q25, D26=>Q26, D27=>Q27, D28=>Q28, D29=>Q29,D30=>Q30,D31=>Q31
);
AND_Gate_to_Register000_i <= q00 and rw after and_gate_delay;AND_Gate_to_Register010_i <= q01 and rw after and_gate_delay;AND_Gate_to_Register020_i <= q02 and rw after and_gate_delay;AND_Gate_to_Register030_i <= q03 and rw after and_gate_delay;
AND_Gate_to_Register040_i <= q04 and rw after and_gate_delay;AND_Gate_to_Register050_i <= q05 and rw after and_gate_delay;AND_Gate_to_Register060_i <= q06 and rw after and_gate_delay;AND_Gate_to_Register070_i <= q07 and rw after and_gate_delay;
AND_Gate_to_Register080_i <= q08 and rw after and_gate_delay;AND_Gate_to_Register090_i <= q09 and rw after and_gate_delay;AND_Gate_to_Register100_i <= q10 and rw after and_gate_delay;AND_Gate_to_Register110_i <= q11 and rw after and_gate_delay;
AND_Gate_to_Register120_i <= q12 and rw after and_gate_delay;AND_Gate_to_Register130_i <= q13 and rw after and_gate_delay;AND_Gate_to_Register140_i <= q14 and rw after and_gate_delay;AND_Gate_to_Register150_i <= q15 and rw after and_gate_delay;
AND_Gate_to_Register160_i <= q16 and rw after and_gate_delay;AND_Gate_to_Register170_i <= q17 and rw after and_gate_delay;AND_Gate_to_Register180_i <= q18 and rw after and_gate_delay;AND_Gate_to_Register190_i <= q19 and rw after and_gate_delay;
AND_Gate_to_Register200_i <= q20 and rw after and_gate_delay;AND_Gate_to_Register210_i <= q21 and rw after and_gate_delay;AND_Gate_to_Register220_i <= q22 and rw after and_gate_delay;AND_Gate_to_Register230_i <= q23 and rw after and_gate_delay;
AND_Gate_to_Register240_i <= q24 and rw after and_gate_delay;AND_Gate_to_Register250_i <= q25 and rw after and_gate_delay;AND_Gate_to_Register260_i <= q26 and rw after and_gate_delay;AND_Gate_to_Register270_i <= q27 and rw after and_gate_delay;
AND_Gate_to_Register280_i <= q28 and rw after and_gate_delay;AND_Gate_to_Register290_i <= q29 and rw after and_gate_delay;AND_Gate_to_Register300_i <= q30 and rw after and_gate_delay;AND_Gate_to_Register310_i <= q31 and rw after and_gate_delay;

--TempDestRegDecoderInstantiations
DestTempReg_Decoder : RF_TempDestReg_Decoder_22336688 PORT MAP(
 a =>TD(3), b=>TD(2) ,c =>TD(1), d =>TD(0),
 D0 => DT00, D1=>DT01, D2=>DT02, D3=>DT03, D4=>DT04 , D5=> DT05, D6=> DT06,D7=>DT07, D8=>DT08, D9=>DT09, D10=>DT10, D11=>DT11, D12=>DT12, D13=>DT13,D14=>DT14,D15=>DT15
);

AND_Gate_to_TempReg01_i <= DT01 and RW after AND_gate_delay;AND_Gate_to_TempReg02_i <= DT02 and RW after AND_gate_delay;AND_Gate_to_TempReg03_i <= DT03 and RW after AND_gate_delay;AND_Gate_to_TempReg04_i <= DT04 and RW after AND_gate_delay;
AND_Gate_to_TempReg05_i <= DT05 and RW after AND_gate_delay;AND_Gate_to_TempReg06_i <= DT06 and RW after AND_gate_delay;AND_Gate_to_TempReg07_i <= DT07 and RW after AND_gate_delay;AND_Gate_to_TempReg08_i <= DT08 and RW after AND_gate_delay;
AND_Gate_to_TempReg09_i <= DT09 and RW after AND_gate_delay;AND_Gate_to_TempReg10_i <= DT10 and RW after AND_gate_delay;AND_Gate_to_TempReg11_i <= DT11 and RW after AND_gate_delay;AND_Gate_to_TempReg12_i <= DT12 and RW after AND_gate_delay;
AND_Gate_to_TempReg13_i <= DT13 and RW after AND_gate_delay;AND_Gate_to_TempReg14_i <= DT14 and RW after AND_gate_delay;AND_Gate_to_TempReg15_i <= DT15 and RW after AND_gate_delay;


--DestRegDecoderInstantiations
AND_Gate_to_Register00_i <= DT00 and AND_Gate_to_Register000_i after and_gate_delay;AND_Gate_to_Register01_i <= DT00 and AND_Gate_to_Register010_i after and_gate_delay;AND_Gate_to_Register02_i <= DT00 and AND_Gate_to_Register020_i after and_gate_delay;AND_Gate_to_Register03_i <= DT00 and AND_Gate_to_Register030_i after and_gate_delay;
AND_Gate_to_Register04_i <= DT00 and AND_Gate_to_Register040_i after and_gate_delay;AND_Gate_to_Register05_i <= DT00 and AND_Gate_to_Register050_i after and_gate_delay;AND_Gate_to_Register06_i <= DT00 and AND_Gate_to_Register060_i after and_gate_delay;AND_Gate_to_Register07_i <= DT00 and AND_Gate_to_Register070_i after and_gate_delay;
AND_Gate_to_Register08_i <= DT00 and AND_Gate_to_Register080_i after and_gate_delay;AND_Gate_to_Register09_i <= DT00 and AND_Gate_to_Register090_i after and_gate_delay;AND_Gate_to_Register10_i <= DT00 and AND_Gate_to_Register100_i after and_gate_delay;AND_Gate_to_Register11_i <= DT00 and AND_Gate_to_Register110_i after and_gate_delay;
AND_Gate_to_Register12_i <= DT00 and AND_Gate_to_Register120_i after and_gate_delay;AND_Gate_to_Register13_i <= DT00 and AND_Gate_to_Register130_i after and_gate_delay;AND_Gate_to_Register14_i <= DT00 and AND_Gate_to_Register140_i after and_gate_delay;AND_Gate_to_Register15_i <= DT00 and AND_Gate_to_Register150_i after and_gate_delay;
AND_Gate_to_Register16_i <= DT00 and AND_Gate_to_Register160_i after and_gate_delay;AND_Gate_to_Register17_i <= DT00 and AND_Gate_to_Register170_i after and_gate_delay;AND_Gate_to_Register18_i <= DT00 and AND_Gate_to_Register180_i after and_gate_delay;
AND_Gate_to_Register19_i <= DT00 and AND_Gate_to_Register190_i after and_gate_delay;AND_Gate_to_Register20_i <= DT00 and AND_Gate_to_Register200_i after and_gate_delay;AND_Gate_to_Register21_i <= DT00 and AND_Gate_to_Register210_i after and_gate_delay;
AND_Gate_to_Register22_i <= DT00 and AND_Gate_to_Register220_i after and_gate_delay;AND_Gate_to_Register23_i <= DT00 and AND_Gate_to_Register230_i after and_gate_delay;AND_Gate_to_Register24_i <= DT00 and AND_Gate_to_Register240_i after and_gate_delay;
AND_Gate_to_Register25_i <= DT00 and AND_Gate_to_Register250_i after and_gate_delay;AND_Gate_to_Register26_i <= DT00 and AND_Gate_to_Register260_i after and_gate_delay;AND_Gate_to_Register27_i <= DT00 and AND_Gate_to_Register270_i after and_gate_delay;AND_Gate_to_Register28_i <= DT00 and AND_Gate_to_Register280_i after and_gate_delay;
AND_Gate_to_Register29_i <= DT00 and AND_Gate_to_Register290_i after and_gate_delay;AND_Gate_to_Register30_i <= DT00 and AND_Gate_to_Register300_i after and_gate_delay;AND_Gate_to_Register31_i <= DT00 and AND_Gate_to_Register310_i after and_gate_delay;

   
Register00 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register00_i,
 D => D,
 Q => reg0
);
Register01 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register01_i,
 D => D,
 Q => reg1
);
Register02 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK, Reset=>Reset,
 Load => AND_Gate_to_Register02_i,
 D => D,
 Q=> reg2
);
Register03 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register03_i,
 D => D,
 Q => reg3
);
Register04 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register04_i,
 D => D,
 Q => reg4
);
Register05 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register05_i,
 D => D,
 Q => reg5
);
Register06 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register06_i,
 D => D,
 Q => reg6
);
Register07 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register07_i,
 D => D,
 Q => reg7
);
Register08 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register08_i,
 D => D,
 Q=> reg8
);
Register09 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register09_i,
 D => D,
 Q => reg9
);
Register10 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register10_i,
 D => D,
 Q=> reg10
);
Register11 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register11_i,
 D => D,
 Q => reg11
);
Register12 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register12_i,
 D => D,
 Q => reg12
);
Register13 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register13_i,
 D => D,
 Q => reg13
);
Register14 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register14_i,
 D => D,
 Q => reg14
);
Register15 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register15_i,
 D => D,
 Q => reg15
);
Register16 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register16_i,
 D => D,
 Q => reg16
);
Register17 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register17_i,
 D => D,
 Q=> reg17
);
Register18 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register18_i,
 D => D,
 Q => reg18
);
Register19 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register19_i,
 D => D,
 Q => reg19
);
Register20 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register20_i,
 D => D,
 Q => reg20
);
Register21 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register21_i,
 D => D,
 Q=> reg21
);
Register22 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register22_i,
 D => D,
 Q=> reg22
);
Register23 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register23_i,
 D => D,
 Q=> reg23
);
Register24 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register24_i,
 D => D,
 Q=> reg24
);
Register25 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register25_i,
 D => D,
 Q=> reg25
);
Register26 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register26_i,
 D => D,
 Q=> reg26
);
Register27 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register27_i,
 D => D,
 Q => reg27
);
Register28 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register28_i,
 D => D,
 Q => reg28
);
Register29 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register29_i,
 D => D,
 Q => reg29
);
Register30 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register30_i,
 D => D,
 Q=> reg30
);
Register31 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_Register31_i,
 D => D,
 Q => reg31
);
 TempReg01 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_TempReg01_i,
 D => D,
 Q => Treg1);
 TempReg02 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_TempReg02_i,
 D => D,
 Q => Treg2);
 TempReg03 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_TempReg03_i,
 D => D,
 Q => Treg3);
 TempReg04 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_TempReg04_i,
 D => D,
 Q => Treg4);
 TempReg05 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_TempReg05_i,
 D => D,
 Q => Treg5);
 TempReg06 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_TempReg06_i,
 D => D,
 Q => Treg6);
 TempReg07 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_TempReg07_i,
 D => D,
 Q => Treg7);
 TempReg08 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_TempReg08_i,
 D => D,
 Q => Treg8);
 TempReg09 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_TempReg09_i,
 D => D,
 Q => Treg9);
 TempReg10 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_TempReg10_i,
 D => D,
 Q => Treg10);
 TempReg11 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_TempReg11_i,
 D => D,
 Q => Treg11);
 TempReg12 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_TempReg12_i,
 D => D,
 Q => Treg12);
 TempReg13 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_TempReg13_i,
 D => D,
 Q => Treg13);
 TempReg14 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_TempReg14_i,
 D => D,
 Q => Treg14);
 TempReg15 : RF_Register32bit_22336688 PORT MAP(
 CLK => CLOCK,Reset=>Reset,
 Load => AND_Gate_to_TempReg15_i,
 D => D,
 Q => Treg15);
 
 Mux32_A : RF_Mux32_32Bit_22336688 PORT MAP (
 S => SA,
 I0=>reg0,I1=>reg1,I2=>reg2,I3=>reg3,I4=>reg4,I5=>reg5,I6=>reg6,I7=>reg7,I8=>reg8,I9=>reg9,I10=>reg10,I11=>reg11,I12=>reg12,I13=>reg13,I14=>reg14,I15=>reg15,
 I16=>reg16,I17=>reg17,I18=>reg18,I19=>reg19,I20=>reg20,I21=>reg21,I22=>reg22,I23=>reg23,I24=>reg24,I25=>reg25,I26=>reg26,I27=>reg27,I28=>reg28,I29=>reg29,I30=>reg30,I31=>reg31,
 y => mux32Aout
 );
  Mux32_B : RF_Mux32_32Bit_22336688 PORT MAP (
 S => SB,
 I0=>reg0,I1=>reg1,I2=>reg2,I3=>reg3,I4=>reg4,I5=>reg5,I6=>reg6,I7=>reg7,I8=>reg8,I9=>reg9,I10=>reg10,I11=>reg11,I12=>reg12,I13=>reg13,I14=>reg14,I15=>reg15,
 I16=>reg16,I17=>reg17,I18=>reg18,I19=>reg19,I20=>reg20,I21=>reg21,I22=>reg22,I23=>reg23,I24=>reg24,I25=>reg25,I26=>reg26,I27=>reg27,I28=>reg28,I29=>reg29,I30=>reg30,I31=>reg31,
 y => mux32Bout
 );

Mux16_A : RF_Mux16_32Bit_22336688 PORT MAP(
S=>TA,
I0 =>mux32Aout,I1=>Treg1,I2=>Treg2,I3=>Treg3,I4=>Treg4,I5=>Treg5,I6=>Treg6,I7=>Treg7,I8=>Treg8,I9=>Treg9,I10=>Treg10,I11=>Treg11,I12=>Treg12,I13=>Treg13,I14=>Treg14,I15=>Treg15,
y =>A
);
Mux16_B : RF_Mux16_32Bit_22336688 PORT MAP(
S=>TB,
I0 =>mux32Bout,I1=>Treg1,I2=>Treg2,I3=>Treg3,I4=>Treg4,I5=>Treg5,I6=>Treg6,I7=>Treg7,I8=>Treg8,I9=>Treg9,I10=>Treg10,I11=>Treg11,I12=>Treg12,I13=>Treg13,I14=>Treg14,I15=>Treg15,
y =>B
);

end Behavioral;