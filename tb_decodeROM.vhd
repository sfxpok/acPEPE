--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:40:40 03/05/2019
-- Design Name:   
-- Module Name:   /home/r/git/acPEPE/tb_decodeROM.vhd
-- Project Name:  acPEPE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decodeROM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_decodeROM IS
END tb_decodeROM;
 
ARCHITECTURE behavior OF tb_decodeROM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decodeROM
    PORT(
         opcode : IN  std_logic_vector(4 downto 0);
         SEL_PC : OUT  std_logic_vector(2 downto 0);
         SEL_F : OUT  std_logic_vector(2 downto 0);
         ESCR_F : OUT  std_logic;
         SEL_ALU : OUT  std_logic_vector(3 downto 0);
         ESCR_R : OUT  std_logic;
         SEL_R : OUT  std_logic_vector(1 downto 0);
         ESCR_P : OUT  std_logic;
         WR : OUT  std_logic;
         Registo_1 : IN  std_logic_vector(2 downto 0);
         Registo_2 : IN  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal opcode : std_logic_vector(4 downto 0) := (others => '0');
   signal Registo_1 : std_logic_vector(2 downto 0) := (others => '0');
   signal Registo_2 : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal SEL_PC : std_logic_vector(2 downto 0);
   signal SEL_F : std_logic_vector(2 downto 0);
   signal ESCR_F : std_logic;
   signal SEL_ALU : std_logic_vector(3 downto 0);
   signal ESCR_R : std_logic;
   signal SEL_R : std_logic_vector(1 downto 0);
   signal ESCR_P : std_logic;
   signal WR : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decodeROM PORT MAP (
          opcode => opcode,
          SEL_PC => SEL_PC,
          SEL_F => SEL_F,
          ESCR_F => ESCR_F,
          SEL_ALU => SEL_ALU,
          ESCR_R => ESCR_R,
          SEL_R => SEL_R,
          ESCR_P => ESCR_P,
          WR => WR,
          Registo_1 => Registo_1,
          Registo_2 => Registo_2
        );

   -- Stimulus process
   stim_proc: process
   begin		

		opcode <= "00000"; Registo_1 <= "000"; Registo_2 <= "XXX"; wait for 100ns;
		opcode <= "00001"; Registo_1 <= "001"; Registo_2 <= "XXX"; wait for 100ns;
		opcode <= "00010"; Registo_1 <= "010"; Registo_2 <= "XXX"; wait for 100ns;
		opcode <= "00011"; Registo_1 <= "011"; Registo_2 <= "XXX"; wait for 100ns;
		opcode <= "00100"; Registo_1 <= "100"; Registo_2 <= "XXX"; wait for 100ns;
		opcode <= "00101"; Registo_1 <= "000"; Registo_2 <= "000"; wait for 100ns;
		opcode <= "00110"; Registo_1 <= "001"; Registo_2 <= "001"; wait for 100ns;
		opcode <= "00111"; Registo_1 <= "010"; Registo_2 <= "010"; wait for 100ns;
		opcode <= "01000"; Registo_1 <= "011"; Registo_2 <= "011"; wait for 100ns;
		opcode <= "01001"; Registo_1 <= "100"; Registo_2 <= "100"; wait for 100ns;
		opcode <= "01010"; Registo_1 <= "101"; Registo_2 <= "101"; wait for 100ns;
		
      wait;
   end process;

END;
