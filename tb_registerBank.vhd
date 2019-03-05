--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:02:29 03/05/2019
-- Design Name:   
-- Module Name:   /home/r/git/acPEPE/tb_registerBank.vhd
-- Project Name:  acPEPE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: registerBank
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
 
ENTITY tb_registerBank IS
END tb_registerBank;
 
ARCHITECTURE behavior OF tb_registerBank IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registerBank
    PORT(
         ESCR_R : IN  std_logic;
         Dados_R : IN  std_logic_vector(7 downto 0);
         Registo_1 : IN  std_logic_vector(2 downto 0);
         Registo_2 : IN  std_logic_vector(2 downto 0);
         Operando1 : OUT  std_logic_vector(7 downto 0);
         Operando2 : OUT  std_logic_vector(7 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ESCR_R : std_logic := '0';
   signal Dados_R : std_logic_vector(7 downto 0) := (others => '0');
   signal Registo_1 : std_logic_vector(2 downto 0) := (others => '0');
   signal Registo_2 : std_logic_vector(2 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal Operando1 : std_logic_vector(7 downto 0);
   signal Operando2 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registerBank PORT MAP (
          ESCR_R => ESCR_R,
          Dados_R => Dados_R,
          Registo_1 => Registo_1,
          Registo_2 => Registo_2,
          Operando1 => Operando1,
          Operando2 => Operando2,
          clk => clk
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

		ESCR_R <= '1'; Dados_R <= "00001111"; Registo_1 <= "001"; Registo_2 <= "XXX"; wait for clk_period*2;

      wait;
   end process;

END;
