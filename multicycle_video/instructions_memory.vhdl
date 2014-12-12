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
   (0 => X"20080000",
		-- lw $t1, 0($0)
    1 => X"200C0014",
	 
	 2 => X"00084A00",
		-- lw $t2, 1($0)
	 3 => X"01285025",
		-- add $t0, $t0, $t1
	 4 => X"00084C00",
		-- add $t1, $t1, $t1
	 5 => X"01495025",
		-- sw $t2, 0($t0)
		--4 => X"AD0A0000",
		-- sw $t0, 0($t0)
	 6 => X"00084E00",
		-- beq $t1, $t0, -6
	 7 => X"01495025",
		--j 3
		--7 => X"08000003",
		--bne,$t0, $t0, -6
	 8 => X"200B000E",
		--bne,$t2, $t0, 1
	 9 => X"AD6A0000",
		--addi $t2,$0, A
	 10 => X"216B0001",
	 
	 11 => X"156CFFFE",
		
	 12 => X"21080001",
	
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
