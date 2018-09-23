tb_res: process -- Porzess estet und gegebenfalls andere Signale
begin
reset <= '1'; -- ab hier folgen Ihre Zuweisungen
wait for 10 ns; -- mit wait for mit . . . getrennt
reset <= not reset; -- usw.
wait; -- Schluss
end process;

tb_takt : process -- zur Takterzeugung (Periode 100 ns)
begin
takt <= '0'; --initialisiere
loop
wait for 50 ns; -- einen halben Takt warten
takt <= not takt; -- Takt kippen
end loop;
end proces;

