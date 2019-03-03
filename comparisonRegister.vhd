----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:20:59 03/03/2019 
-- Design Name: 
-- Module Name:    comparisonRegister - Behavioral 
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

entity comparisonRegister is
    Port ( R_FLAG : out  STD_LOGIC_VECTOR (4 downto 0);
           COMP_FLAG : in  STD_LOGIC_VECTOR (4 downto 0);
           clk : in  STD_LOGIC;
           ESCR_F : in  STD_LOGIC);
end comparisonRegister;

architecture Behavioral of comparisonRegister is

begin
    process (COMP_FLAG, clk, ESCR_F)
    begin
        if (ESCR_F = '1' and rising_edge(clk)) then
            R_FLAG <= COMP_FLAG;
        end if;

    end process;
    
end Behavioral;

