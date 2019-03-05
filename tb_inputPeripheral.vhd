--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:59:39 03/05/2019
-- Design Name:   
-- Module Name:   /home/r/git/acPEPE/tb_inputPeripheral.vhd
-- Project Name:  acPEPE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: inputPeripheral
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
 
ENTITY tb_inputPeripheral IS
END tb_inputPeripheral;
 
ARCHITECTURE behavior OF tb_inputPeripheral IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT inputPeripheral
    PORT(
         PIN : IN  std_logic_vector(7 downto 0);
         ESCR_P : IN  std_logic;
         Dados_IN : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PIN : std_logic_vector(7 downto 0) := (others => '0');
   signal ESCR_P : std_logic := '0';

 	--Outputs
   signal Dados_IN : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: inputPeripheral PORT MAP (
          PIN => PIN,
          ESCR_P => ESCR_P,
          Dados_IN => Dados_IN
        );

   -- Stimulus process
   stim_proc: process
   begin		

      PIN <= "00001111"; ESCR_P <= '0'; wait for 100ns;
      PIN <= "00001111"; ESCR_P <= '1'; wait for 100ns;
      PIN <= "11110000"; ESCR_P <= '0'; wait for 100ns;
      PIN <= "11110000"; ESCR_P <= '1'; wait for 100ns;

      wait;
   end process;

END;
