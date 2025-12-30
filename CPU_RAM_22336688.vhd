----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 08:06:41 PM
-- Design Name: 
-- Module Name: CPU_RAM_22336688 - Behavioral
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
use IEEE.NUMERIC_STD.ALL ;
entity CPU_RAM_22336688 is
Port (
Address : in std_logic_vector(31 downto 0);
Clock : in std_logic;
DataIn : in std_logic_vector(31 downto 0);
WriteEnable : in std_logic;
DataOut : out std_logic_vector(31 downto 0)
 );
end CPU_RAM_22336688;

architecture Behavioral of CPU_RAM_22336688 is
type RAM_array is array (0 to 127) of STD_LOGIC_VECTOR (31 downto 0) ;
 signal RAM : RAM_array :=(
 X"00000000",-- 00
 X"00000001",-- 01
 X"00000002",-- 02
 X"00000003",-- 03
 -- Machine code
 -- example studentID 22336688
 -- your machine code starts at digit 3 of your ID = 7
 -- Opcode = digit 3 = 7
 -- DR = digit 2 = 7
 -- SA = digit 1 = 8
 -- SB = digit 0 = 8
"00000000000000100"&"00011"&"00010"&"00001",-- 04
"00000000000000101"&"00100"&"00011"&"00010",-- 05
"00000000000000110"&"00101"&"00100"&"00011",-- 06
"00000000000000111"&"00110"&"00101"&"00100",-- 07
"00000000000001000"&"00111"&"00110"&"00101",-- 08

 X"00000009", X"0000000A",X"0000000B", X"0000000C",X"0000000D",X"0000000E",X"0000000F",
 X"00000010",X"00000011",X"00000012",X"00000013",X"00000014",X"00000015",X"00000016",X"00000017",X"00000018",X"00000019",X"0000001A",X"0000001B",X"0000001C",X"0000001D",X"0000001E",X"0000001F",
 X"00000020",X"00000021",X"00000022",X"00000023",X"00000024",X"00000025",X"00000026",X"00000027",X"00000028",X"00000029",X"0000002A",X"0000002B",X"0000002C",X"0000002D",X"0000002E",X"0000002F",
 X"00000030",X"00000031",X"00000032",X"00000033",X"00000034",X"00000035",X"00000036",X"00000037",X"00000038",X"00000039",X"0000003A",X"0000003B",X"0000003C",X"0000003D",X"0000003E",X"0000003F",
 X"00000040",X"00000041",X"00000042",X"00000043",X"00000044",X"00000045",X"00000046",X"00000047",X"00000048",X"00000049",X"0000004A",X"0000004B",X"0000004C",X"0000004D",X"0000004E",X"0000004F",
 X"00000050",X"00000051",X"00000052",X"00000053",X"00000054",X"00000055",X"00000056",X"00000057",X"00000058",X"00000059",X"0000005A",X"0000005B",X"0000005C",X"0000005D",X"0000005E",X"0000005F",
 X"00000060",X"00000061",X"00000062",X"00000063",X"00000064",X"00000065",X"00000066",X"00000067",X"00000068",X"00000069",X"0000006A",X"0000006B",X"0000006C",X"0000006D",X"0000006E",X"0000006F",
 X"00000070",X"00000071",X"00000072",X"00000073",X"00000074",X"00000075",X"00000076",X"00000077",X"00000078",X"00000079",X"0000007A",X"0000007B",X"0000007C",X"0000007D",X"0000007E",
 X"0000007F" -- 7F
 );
 begin
 process ( Clock )
 begin
     if Clock ' event and Clock = '1' then
        if WriteEnable = '1' then
            RAM ( to_integer ( unsigned ( Address (6 downto 0) )) ) <=DataIn after 2 ns ;
        end if;
    end if;
 end process ;
 DataOut <= RAM (to_integer (unsigned(Address(6 downto 0))))after 2 ns ;
 end Behavioral ;
