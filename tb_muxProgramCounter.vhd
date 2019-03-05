--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:36:52 03/05/2019
-- Design Name:   
-- Module Name:   /home/r/git/acPEPE/tb_muxProgramCounter.vhd
-- Project Name:  acPEPE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: muxProgramCounter
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
 
ENTITY tb_muxProgramCounter IS
END tb_muxProgramCounter;
 
ARCHITECTURE behavior OF tb_muxProgramCounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT muxProgramCounter
    PORT(
         ESCR_PC : OUT  std_logic;
         SEL_PC : IN  std_logic_vector(2 downto 0);
         S_FLAG : IN  std_logic;
         Operando1NOR : IN  std_logic;
         Operando1MaiorPeso : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal SEL_PC : std_logic_vector(2 downto 0) := (others => '0');
   signal S_FLAG : std_logic := '0';
   signal Operando1NOR : std_logic := '0';
   signal Operando1MaiorPeso : std_logic := '0';

 	--Outputs
   signal ESCR_PC : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: muxProgramCounter PORT MAP (
          ESCR_PC => ESCR_PC,
          SEL_PC => SEL_PC,
          S_FLAG => S_FLAG,
          Operando1NOR => Operando1NOR,
          Operando1MaiorPeso => Operando1MaiorPeso
        );

   -- Stimulus process
   stim_proc: process
   begin		

		SEL_PC <= "000"; S_FLAG <= '1'; Operando1NOR <= '1'; Operando1MaiorPeso <= '1'; wait for 100ns;
		SEL_PC <= "001"; S_FLAG <= '0'; Operando1NOR <= '1'; Operando1MaiorPeso <= '1'; wait for 100ns;
		SEL_PC <= "010"; S_FLAG <= '0'; Operando1NOR <= '1'; Operando1MaiorPeso <= '1'; wait for 100ns;

      wait;
   end process;

END;
