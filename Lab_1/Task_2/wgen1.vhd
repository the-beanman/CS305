entity wgen1 is
	port (W: in bit_vector(2 downto 0);
		A,B,C,Z: out bit);
end entity wgen1;

architecture behaviour of wgen1 is
	signal A1,B1,C1: bit;
begin
	
	process
	begin
		A1 <= '1', '0' after 2 ns, '1' after 6 ns, '0' after 8 ns;
		wait for 10 ns;
	end process;
	
	process
	begin
		B1 <= '0', '1' after 2 ns, '0' after 4 ns, '1' after 6 ns;
		wait for 10 ns;
	end process;
		
	process
	begin
		C1 <= '1', '0' after 2 ns, '1' after 4 ns, '0' after 6 ns, '1' after 8 ns;
		wait for 10 ns;
	end process;
	
	process
	begin
		case W is
			when "000" => Z <= (A1 or B1);
			when "001" => Z <= (B1 or C1);
			when "010" => Z <= (A1 xor B1 xor C1);
			when "011" => Z <= (A1 and B1 and C1);
			when "100" => Z <= A1;
			when "101" => Z <= B1;
			when "110" => Z <= C1;
			when "111" => Z <= '1';
		end case;
		wait for 1 ns;
	end process;
		
		A <= A1;
		B <= B1;
		C <= C1;
 	
end architecture behaviour; 