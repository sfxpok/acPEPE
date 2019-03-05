--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:11:22 03/05/2019
-- Design Name:   
-- Module Name:   /home/r/git/acPEPE/tb_RAM.vhd
-- Project Name:  acPEPE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM
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
 
ENTITY tb_RAM IS
END tb_RAM;
 
ARCHITECTURE behavior OF tb_RAM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM
    PORT(
         Operando1 : IN  std_logic_vector(7 downto 0);
         Constante : IN  std_logic_vector(7 downto 0);
         WR : IN  std_logic;
         clk : IN  std_logic;
         Dados_M : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Operando1 : std_logic_vector(7 downto 0) := (others => '0');
   signal Constante : std_logic_vector(7 downto 0) := (others => '0');
   signal WR : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal Dados_M : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM PORT MAP (
          Operando1 => Operando1,
          Constante => Constante,
          WR => WR,
          clk => clk,
          Dados_M => Dados_M
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

		Operando1 <= "00010000"; Constante <= "00001111"; WR <= '1'; wait for clk_period*2;
		Operando1 <= "00010001"; Constante <= "00001110"; WR <= '1'; wait for clk_period*2;
		Operando1 <= "00010001"; Constante <= "00001110"; WR <= '0'; wait for clk_period*2;
		Operando1 <= "00010000"; Constante <= "00001111"; WR <= '0'; wait for clk_period*2;
		Operando1 <= "11110000"; Constante <= "01010101"; WR <= '1'; wait for clk_period*2;
		Operando1 <= "11110000"; Constante <= "01010101"; WR <= '0'; wait for clk_period*2;
		
		-- num caso em que o dataOut teja como laranja na simulação, isto implica que ele
		-- está a tentar ler um número que não existe no endereço indicado previamente

      wait;
   end process;

END;
