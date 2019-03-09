--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:16:14 03/05/2019
-- Design Name:   
-- Module Name:   /home/r/git/acPEPE/tb_motherBoard.vhd
-- Project Name:  acPEPE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: motherBoard
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
 
ENTITY tb_motherBoard IS
END tb_motherBoard;
 
ARCHITECTURE behavior OF tb_motherBoard IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT motherBoard
    PORT(
         PIN : IN  std_logic_vector(7 downto 0);
         POUT : OUT  std_logic_vector(7 downto 0);
         Reset : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal PIN : std_logic_vector(7 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal POUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: motherBoard PORT MAP (
          PIN => PIN,
          POUT => POUT,
          Reset => Reset,
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
		
		Reset <= '1'; wait for clk_period*5;
		PIN <= "00001010"; Reset <= '0'; wait for clk_period*5;
		
		--PIN <= "01000001"; Reset <= '1'; wait for clk_period*2;
		--PIN <= "00011101"; Reset <= '0'; wait for clk_period*2;
		--PIN <= "01101101"; Reset <= '0'; wait for clk_period*2;
		--PIN <= "01010101"; Reset <= '0'; wait for clk_period*2;
		--PIN <= "00011111"; Reset <= '1'; wait for clk_period*2;
		--PIN <= "01111111"; Reset <= '0'; wait for clk_period*2;
		--PIN <= "00010001"; Reset <= '1'; wait for clk_period*2;
    
    wait;
   end process;

END;
