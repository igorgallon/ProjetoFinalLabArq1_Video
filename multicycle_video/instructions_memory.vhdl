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
   --(0 => X"8C080000",
		-- lw $t1, 0($0)
    --1 => X"8C090000",
		-- lw $t2, 1($0)
		--2 => X"8C0A0001",
		-- add $t0, $t0, $t1
		--3 => X"01094020",
		-- sw $t2, 0($t0)
		--4 => X"AD0A0000",
		-- sw $t0, 0($t0)
		--4 => X"AD080000",
		--j 3
		--5 => X"08000003",
		
		
		
		
		
		--1:  lw $t0, 0($zero)
	  (0 => X"8C080000",
	  --lw $t1, 0($zero)
	   1 => X"8C090000",
	  --bne $t0, $t1, 1
	   2 => X"1509FFFD",
	  --lw $t2, 1($zero)
     3 => X"8C0A0001",
    --	bne $t2,$t0, 7
     4 => X"15480001",
    --add $t2, $zero, $zero
     5 => X"00005020",
    --7:	 beq $t2, $t0, 1
     6 => X"1148fff9",
    --	sw $t2, 0($zero)
     7 => X"AC0A0000",
    --	lw $t0, 0($zero)
     8 => X"8C080000",
    --	beq $t0,$t1,12
     9 => X"110A0001",
    --	beq $t0,$t0,1
     10 => X"1108FFF5",
    --12: j 3
     11 => X"08000003",
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