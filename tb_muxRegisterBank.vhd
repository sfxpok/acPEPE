--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:12:25 03/05/2019
-- Design Name:   
-- Module Name:   /home/r/git/acPEPE/tb_muxRegisterBank.vhd
-- Project Name:  acPEPE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: muxRegisterBank
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
 
ENTITY tb_muxRegisterBank IS
END tb_muxRegisterBank;
 
ARCHITECTURE behavior OF tb_muxRegisterBank IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT muxRegisterBank
    PORT(
         Constante : IN  std_logic_vector(7 downto 0);
         Dados_M : IN  std_logic_vector(7 downto 0);
         Dados_IN : IN  std_logic_vector(7 downto 0);
         Resultado : IN  std_logic_vector(7 downto 0);
         Dados_R : OUT  std_logic_vector(7 downto 0);
         SEL_R : IN  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Constante : std_logic_vector(7 downto 0) := (others => '0');
   signal Dados_M : std_logic_vector(7 downto 0) := (others => '0');
   signal Dados_IN : std_logic_vector(7 downto 0) := (others => '0');
   signal Resultado : std_logic_vector(7 downto 0) := (others => '0');
   signal SEL_R : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Dados_R : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: muxRegisterBank PORT MAP (
          Constante => Constante,
          Dados_M => Dados_M,
          Dados_IN => Dados_IN,
          Resultado => Resultado,
          Dados_R => Dados_R,
          SEL_R => SEL_R
        );

   -- Stimulus process
   stim_proc: process
   begin		

		Constante <= "00000001"; Dados_M <= "00000111"; Dados_IN <= "00000110"; Resultado <= "01010101"; SEL_R <= "01"; wait for 100ns;
		Constante <= "00000001"; Dados_M <= "00000111"; Dados_IN <= "00000110"; Resultado <= "01010101"; SEL_R <= "10"; wait for 100ns;

      wait;
   end process;

END;
