	library ieee;
		use ieee.std_logic_1164.all;
		use ieee.numeric_std.all;
 entity TraSigSim is 
	port( clk :std_logic;
		  red1		: out std_logic;
		  yellow1	: out std_logic;
		  green1	: out std_logic;
		  red2		: out std_logic;
		  yellow2	: out std_logic;
		  green2	: out std_logic;
		  red3		: out std_logic;
		  yellow3	: out std_logic;
		  green3	: out std_logic;
		  red4		: out std_logic;
		  yellow4	: out std_logic;
		  green4	: out std_logic );
	end TraSigSim;

architecture behave of TraSigSim is 
 type state_num is (s0,s1,s2,s3,s4,s5,s6,s7);
 signal state : state_num;
 signal count : integer  range 0 to 100 := 0;
 signal lights : std_logic_vector(11 downto 0);
	begin 
		StateDef: process(state)
			begin 
				case state is 
					when s0 => lights <= "001100100100";
					when s1 => lights <= "010100100100";
					when s2 => lights <= "100001100100";
					when s3 => lights <= "100010100100";
					when s4 => lights <= "100100001100";
					when s5 => lights <= "100100010100";
					when s6 => lights <= "100100100001";
					when s7 => lights <= "100100100010";
					when others => lights <= lights;
				end case;

			end process StateDef;
	
		lightsDef : process(clk)
			begin 
				
				case(count) is
					when 0 => state <= s0; count <= count + 1;
					when 20 => state <= s1; count <= count + 1; 
					when 25 => state <= s2; count <= count + 1; 
					when 45 => state <= s3; count <= count + 1; 
					when 50 => state <= s4; count <= count + 1; 
					when 70 => state <= s5; count <= count + 1; 
					when 75 => state <= s6; count <= count + 1;
					when 95 => state <= s7; count <= count + 1; 
					when 100 => count <= 0;
				when others => count <= count + 1; 	
			end case;

			green4 <=lights(0);
			yellow4 <= lights(1);
			red4 <= lights(2);
		green3 <= lights(3);
		yellow3 <= lights(4);
		red3 <= lights(5);
			green2 <= lights(6);
			yellow2 <= lights(7);
			red2 <= lights(8);
		green1 <= lights(9);
		yellow1 <= lights(10);
		red1 <= lights(11);
 	end process LightsDef;	
 end architecture behave;