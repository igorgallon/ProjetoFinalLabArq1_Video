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
		-- addi $t0, $zero, 0
   (0 => X"20080000",
		-- addi $t4, $zero, 20
    1 => X"200C0014",
	   -- Jump: sll $t1, $t0, 8
	 2 => X"00084A00",
		-- or $t2, $t1, $t0
	 3 => X"01285025",
		-- sll $t1, $t0, 16
	 4 => X"00084C00",
		-- or $t2, $t2, $t1
	 5 => X"01495025",
		-- sll $t1, $t0, 24
	 6 => X"00084E00",
		-- or $t2, $t2, $t1
	 7 => X"01495025",
		-- addi $t3, $zero, 14
	 8 => X"200B000E",
		-- Print: sw $t2, 0($t3)
	 9 => X"AD6A0000",
	 	-- addi $t3, $t3, 1
	 10 => X"216B0001",
		-- bne $t3, $t4, Print
	 11 => X"156CFFFE",
		-- addi $t0, $t0, 1
	 12 => X"21080001",
		--j Jump
    13 => X"08000C02",	
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
