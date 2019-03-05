--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:23:22 03/05/2019
-- Design Name:   
-- Module Name:   /home/r/git/acPEPE/tb_comparisonRegister.vhd
-- Project Name:  acPEPE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: comparisonRegister
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
 
ENTITY tb_comparisonRegister IS
END tb_comparisonRegister;
 
ARCHITECTURE behavior OF tb_comparisonRegister IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT comparisonRegister
    PORT(
         R_FLAG : OUT  std_logic_vector(4 downto 0);
         COMP_FLAG : IN  std_logic_vector(4 downto 0);
         clk : IN  std_logic;
         ESCR_F : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal COMP_FLAG : std_logic_vector(4 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal ESCR_F : std_logic := '0';

 	--Outputs
   signal R_FLAG : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comparisonRegister PORT MAP (
          R_FLAG => R_FLAG,
          COMP_FLAG => COMP_FLAG,
          clk => clk,
          ESCR_F => ESCR_F
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

		COMP_FLAG <= "00011"; ESCR_F <= '1'; wait for clk_period*2;
		COMP_FLAG <= "00010"; ESCR_F <= '0'; wait for clk_period*2;

      wait;
   end process;

END;
