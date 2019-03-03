----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:37:00 03/03/2019 
-- Design Name: 
-- Module Name:    comparisonMUX - Behavioral 
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

entity comparisonMUX is
    Port ( R_FLAG : in  STD_LOGIC_VECTOR (4 downto 0);
           S_FLAG : out  STD_LOGIC;
           SEL_F : in  STD_LOGIC_VECTOR (2 downto 0));
end comparisonMUX;

architecture Behavioral of comparisonMUX is

begin
    process (R_FLAG, SEL_F)
    begin
         case (SEL_F) is
            when "000" => S_FLAG <= R_FLAG(0); -- função =
            when "001" => S_FLAG <= R_FLAG(1); -- função <
            when "010" => S_FLAG <= R_FLAG(2); -- função <=
            when "011" => S_FLAG <= R_FLAG(3); -- função >=
            when "100" => S_FLAG <= R_FLAG(4); -- função >
            when others => S_FLAG <= 'X';
        end case;

    end process;

end Behavioral;

