library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity instructions_memory is
	generic (
		length: integer := 256;
		address_width: integer := 32;
		data_width: integer := 32);

	port (
    clock, enable: in std_logic;
		address_to_read: in std_logic_vector (address_width - 1 downto 0);
		instruction_out: out std_logic_vector (data_width - 1 downto 0));
end instructions_memory;

architecture behavioral of instructions_memory is

	type instructions_sequence is array (0 to length) of std_logic_vector (data_width - 1 downto 0);
	signal instructions: instructions_sequence :=
		-- lw $t0, 0($0)
   (0 => X"8C080000",
		-- lw $t1, 0($0)
    1 => X"8C090000",
		-- lw $t2, 1($0)
		2 => X"8C0A0001",
		-- add $t0, $t0, $t1
		3 => X"01094020",
		-- add $t1, $t1, $t1
		4 => X"01294820",
		-- sw $t2, 0($t0)
		--4 => X"AD0A0000",
		-- sw $t0, 0($t0)
		5 => X"AD080000",
		-- beq $t1, $t0, -6
		6 => X"1128FFFA",
		--j 3
		--7 => X"08000003",
		--bne,$t0, $t0, -6
		7 => X"1508FFFA",
		--bne,$t2, $t0, 1
		8 => X"15480001",
		--addi $t2,$0, A
		9 => X"200A000A",
		--addi $t2,$0, A
		10 => X"200A000A",
		--add $t2,$t2, $t2
		11 => X"014A5020",
		
		others => (others => 'U'));

begin

	process(clock)
		variable index: integer;
	begin
    if rising_edge(clock) then
      if enable='1' then
      		index := to_integer(unsigned(address_to_read));
			  instruction_out <= instructions(index);
			end if;
    end if;
	end process;

end behavioral;
