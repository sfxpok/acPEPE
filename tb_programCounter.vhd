--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:31:26 03/05/2019
-- Design Name:   
-- Module Name:   /home/r/git/acPEPE/tb_programCounter.vhd
-- Project Name:  acPEPE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: programCounter
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
 
ENTITY tb_programCounter IS
END tb_programCounter;
 
ARCHITECTURE behavior OF tb_programCounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT programCounter
    PORT(
         clk : IN  std_logic;
         Endereco : OUT  std_logic_vector(7 downto 0);
         ESCR_PC : IN  std_logic;
         Constante : IN  std_logic_vector(7 downto 0);
         Reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal ESCR_PC : std_logic := '0';
   signal Constante : std_logic_vector(7 downto 0) := (others => '0');
   signal Reset : std_logic := '0';

 	--Outputs
   signal Endereco : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: programCounter PORT MAP (
          clk => clk,
          Endereco => Endereco,
          ESCR_PC => ESCR_PC,
          Constante => Constante,
          Reset => Reset
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

		ESCR_PC <= '1'; Constante <= "00001111"; Reset <= '0'; wait for clk_period*2;
		ESCR_PC <= '1'; Constante <= "00001100"; Reset <= '1'; wait for clk_period*2;
		ESCR_PC <= '0'; Constante <= "00001100"; Reset <= '0'; wait for clk_period*2;
		ESCR_PC <= '1'; Constante <= "00010110"; Reset <= '1'; wait for clk_period*2;
		ESCR_PC <= '0'; Constante <= "00010110"; Reset <= '1'; wait for clk_period*2;
		ESCR_PC <= '1'; Constante <= "00010110"; Reset <= '0'; wait for clk_period*2;

		
      wait;
   end process;

END;
