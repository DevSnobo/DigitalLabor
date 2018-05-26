entity halbad_ent is
port(x, y : in bit;
     c, s  : out bit);
		 

end;

architecture halbad_arch of halbad_ent is

begin
with bit_vector'(x, y) select
c <= '1' when "11",
'0' when others;
				
with bit_vector'(x, y) select
s <= '1' when "01",
'1' when "10",
'0' when others;
end halbad_arch;


