----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:47:00 03/03/2019 
-- Design Name: 
-- Module Name:    outputPeripheral - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity outputPeripheral is
    Port ( POUT : out  STD_LOGIC_VECTOR (7 downto 0);
           ESCR_P : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Operando1 : in  STD_LOGIC_VECTOR (7 downto 0));
end outputPeripheral;

architecture Behavioral of outputPeripheral is

begin

	process (ESCR_P, clk, Operando1)
		begin
			if (ESCR_P = '1' and rising_edge(clk)) then
				POUT <= Operando1;
			end if;
		end process;

end Behavioral;

