entity wgen2 is
	port (Enable: in bit;
		W: in bit_vector(2 downto 0);
		A,B,C,Z: out bit);
end entity wgen2;

architecture behaviour of wgen2 is
	signal A1,B1,C1: bit;
begin
	
	process
	begin
		if Enable = '1' then
			A1 <= '1', '0' after 2 ns, '1' after 6 ns, '0' after 8 ns;
			wait for 10 ns;
		else 
			A1 <= '0';
		end if;
		wait for 1 ns;
	end process;
	
	process
	begin
		if Enable = '1' then
			B1 <= '0', '1' after 2 ns, '0' after 4 ns, '1' after 6 ns;
			wait for 10 ns;
		else 
			B1 <= '0';
		end if;
		wait for 1 ns;
	end process;
		
	process
	begin
		if Enable = '1' then
			C1 <= '1', '0' after 2 ns, '1' after 4 ns, '0' after 6 ns, '1' after 8 ns;
			wait for 10 ns;
		else 
			C1 <= '0';
		end if;
		wait for 1 ns;
	end process;
	
	process
	begin
		if Enable = '1' then
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
		else 
			Z <= '0';
		end if;
		wait for 1 ns;
	end process;
		
		A <= A1;
		B <= B1;
		C <= C1;
 	
end architecture behaviour; 