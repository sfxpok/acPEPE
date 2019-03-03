
-- VHDL Instantiation Created from source file outputPeripheral.vhd -- 18:50:18 03/03/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT outputPeripheral
	PORT(
		ESCR_P : IN std_logic;
		clk : IN std_logic;
		Operando1 : IN std_logic_vector(7 downto 0);          
		POUT : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_outputPeripheral: outputPeripheral PORT MAP(
		POUT => ,
		ESCR_P => ,
		clk => ,
		Operando1 => 
	);


