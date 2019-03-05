--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:23:57 03/05/2019
-- Design Name:   
-- Module Name:   /home/r/git/acPEPE/tb_outputPeripheral.vhd
-- Project Name:  acPEPE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: outputPeripheral
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
 
ENTITY tb_outputPeripheral IS
END tb_outputPeripheral;
 
ARCHITECTURE behavior OF tb_outputPeripheral IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT outputPeripheral
    PORT(
         POUT : OUT  std_logic_vector(7 downto 0);
         ESCR_P : IN  std_logic;
         clk : IN  std_logic;
         Operando1 : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ESCR_P : std_logic := '0';
   signal clk : std_logic := '0';
   signal Operando1 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal POUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: outputPeripheral PORT MAP (
          POUT => POUT,
          ESCR_P => ESCR_P,
          clk => clk,
          Operando1 => Operando1
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

      ESCR_P <= '1'; Operando1 <= "00000001"; wait for clk_period*2;
	  ESCR_P <= '0'; Operando1 <= "00000101"; wait for clk_period*2;

      wait;
   end process;

END;
