--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:28:25 03/05/2019
-- Design Name:   
-- Module Name:   /home/r/git/acPEPE/tb_comparisonMUX.vhd
-- Project Name:  acPEPE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: comparisonMUX
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
 
ENTITY tb_comparisonMUX IS
END tb_comparisonMUX;
 
ARCHITECTURE behavior OF tb_comparisonMUX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT comparisonMUX
    PORT(
         R_FLAG : IN  std_logic_vector(4 downto 0);
         S_FLAG : OUT  std_logic;
         SEL_F : IN  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal R_FLAG : std_logic_vector(4 downto 0) := (others => '0');
   signal SEL_F : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal S_FLAG : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comparisonMUX PORT MAP (
          R_FLAG => R_FLAG,
          S_FLAG => S_FLAG,
          SEL_F => SEL_F
        );

   -- Stimulus process
   stim_proc: process
   begin		
		
		R_FLAG <= "00001"; SEL_F <= "000"; wait for 100ns;
		R_FLAG <= "00010"; SEL_F <= "001"; wait for 100ns;		
		
      wait;
   end process;

END;
