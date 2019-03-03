----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:40:38 03/03/2019 
-- Design Name: 
-- Module Name:    inputPeripheral - Behavioral 
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

entity inputPeripheral is
    Port ( PIN : in  STD_LOGIC_VECTOR (7 downto 0);
           ESCR_P : in  STD_LOGIC;
           Dados_IN : out  STD_LOGIC_VECTOR (7 downto 0));
end inputPeripheral;

architecture Behavioral of inputPeripheral is

begin

	process (ESCR_P, PIN)
		begin
			if (ESCR_P = '0') then
				Dados_IN <= PIN;
			end if;
		end process;
		
end Behavioral;

