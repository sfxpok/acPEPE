--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:51:17 03/05/2019
-- Design Name:   
-- Module Name:   /home/r/git/acPEPE/tb_CPU.vhd
-- Project Name:  acPEPE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CPU
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
 
ENTITY tb_CPU IS
END tb_CPU;
 
ARCHITECTURE behavior OF tb_CPU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CPU
    PORT(
         PIN : IN  std_logic_vector(7 downto 0);
         POUT : OUT  std_logic_vector(7 downto 0);
         Reset : IN  std_logic;
         Endereco : OUT  std_logic_vector(7 downto 0);
         opcode : IN  std_logic_vector(4 downto 0);
         Registo_1 : IN  std_logic_vector(2 downto 0);
         Registo_2 : IN  std_logic_vector(2 downto 0);
         Constante : IN  std_logic_vector(7 downto 0);
         Operando1Output : OUT  std_logic_vector(7 downto 0);
         WR : OUT  std_logic;
         Dados_M : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal PIN : std_logic_vector(7 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal opcode : std_logic_vector(4 downto 0) := (others => '0');
   signal Registo_1 : std_logic_vector(2 downto 0) := (others => '0');
   signal Registo_2 : std_logic_vector(2 downto 0) := (others => '0');
   signal Constante : std_logic_vector(7 downto 0) := (others => '0');
   signal Dados_M : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal POUT : std_logic_vector(7 downto 0);
   signal Endereco : std_logic_vector(7 downto 0);
   signal Operando1Output : std_logic_vector(7 downto 0);
   signal WR : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CPU PORT MAP (
          PIN => PIN,
          POUT => POUT,
          Reset => Reset,
          Endereco => Endereco,
          opcode => opcode,
          Registo_1 => Registo_1,
          Registo_2 => Registo_2,
          Constante => Constante,
          Operando1Output => Operando1Output,
          WR => WR,
          Dados_M => Dados_M,
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

      PIN <= "00000001"; Reset <= '0'; opcode <= "00100"; Registo_1 <= "001"; Registo_2 <= "XXX"; Constante <= "00000001"; Dados_M <= "00000111"; wait for clk_period*2;
      PIN <= "00000001"; Reset <= '0'; opcode <= "00100"; Registo_1 <= "001"; Registo_2 <= "XXX"; Constante <= "00000001"; Dados_M <= "00000111"; wait for clk_period*2;
      PIN <= "00000001"; Reset <= '0'; opcode <= "00011"; Registo_1 <= "001"; Registo_2 <= "XXX"; Constante <= "00000001"; Dados_M <= "00000111"; wait for clk_period*2;
      PIN <= "00000001"; Reset <= '0'; opcode <= "00100"; Registo_1 <= "011"; Registo_2 <= "XXX"; Constante <= "00000001"; Dados_M <= "00000111"; wait for clk_period*2;

      wait;
   end process;

END;
