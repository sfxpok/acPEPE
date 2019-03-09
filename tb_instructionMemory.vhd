--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:03:26 03/05/2019
-- Design Name:   
-- Module Name:   /home/r/git/acPEPE/tb_instructionMemory.vhd
-- Project Name:  acPEPE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: instructionMemory
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
 
ENTITY tb_instructionMemory IS
END tb_instructionMemory;
 
ARCHITECTURE behavior OF tb_instructionMemory IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instructionMemory
    PORT(
         Endereco : IN  std_logic_vector(7 downto 0);
         opcode : OUT  std_logic_vector(4 downto 0);
         Registo_1 : OUT  std_logic_vector(2 downto 0);
         Registo_2 : OUT  std_logic_vector(2 downto 0);
         Constante : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Endereco : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal opcode : std_logic_vector(4 downto 0);
   signal Registo_1 : std_logic_vector(2 downto 0);
   signal Registo_2 : std_logic_vector(2 downto 0);
   signal Constante : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instructionMemory PORT MAP (
          Endereco => Endereco,
          opcode => opcode,
          Registo_1 => Registo_1,
          Registo_2 => Registo_2,
          Constante => Constante
        );

   -- Stimulus process
   stim_proc: process
   begin		

      Endereco <= "00000000"; wait for 10ns;
      Endereco <= "00000001"; wait for 10ns;
      Endereco <= "00000010"; wait for 10ns;
      Endereco <= "00000011"; wait for 10ns;
      Endereco <= "00000100"; wait for 10ns;
      Endereco <= "00000101"; wait for 10ns;
      Endereco <= "00000110"; wait for 10ns;
      Endereco <= "00000111"; wait for 10ns;
      Endereco <= "00001000"; wait for 10ns;
      Endereco <= "00001001"; wait for 10ns;
      Endereco <= "00001010"; wait for 10ns;
      Endereco <= "00001011"; wait for 10ns;
      Endereco <= "00001100"; wait for 10ns;
      Endereco <= "00001101"; wait for 10ns;
      Endereco <= "00001110"; wait for 10ns;
      Endereco <= "00001111"; wait for 10ns;
      Endereco <= "00010000"; wait for 10ns;
      Endereco <= "00010001"; wait for 10ns;
      Endereco <= "00010010"; wait for 10ns;
      Endereco <= "00010011"; wait for 10ns;
      Endereco <= "00010100"; wait for 10ns;
      Endereco <= "00010101"; wait for 10ns;
      Endereco <= "00010110"; wait for 10ns;
      Endereco <= "00010111"; wait for 10ns;

      wait;
   end process;

END;
