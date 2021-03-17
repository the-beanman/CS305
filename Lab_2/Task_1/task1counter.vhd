library IEEE;
use IEEE.std_logic_1164.all;

entity task1counter is
	port(Clk, Reset, Enable: in std_logic;
		Mode: in std_logic_vector(1 downto 0);
		Q: out std_logic_vector(5 downto 0));
end entity task1counter;