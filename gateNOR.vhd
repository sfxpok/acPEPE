----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:15:28 03/04/2019 
-- Design Name: 
-- Module Name:    gateNOR - Behavioral 
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

entity gateNOR is
    Port ( Operando1 : in STD_LOGIC_VECTOR (7 downto 0);
           Z : out  STD_LOGIC);
end gateNOR;

architecture Behavioral of gateNOR is

begin
    process (Operando1)
    begin

        Z <= not(Operando1(7) or Operando1(6) or Operando1(5) or Operando1(4) or Operando1(3) or Operando1(2) or Operando1(1) or Operando1(0));

    end process;

end Behavioral;

