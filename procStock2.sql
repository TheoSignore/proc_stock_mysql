delimiter |
drop procedure if exists Aiouztouroulzeweulrd |

create procedure Aiouztouroulzeweulrd()
	begin
	declare done int default 0;
	declare vnum integer;
	declare vmontant integer;
	declare crsr cursor for select num, sum(montant) from verse where year(datev) = 2018 group by num;
	declare continue handler for not found set done = 1;
	open crsr;
	fetch crsr into vnum, vmontant;
	while !done do
		update souscrit set total = vmontant where num = vnum; 
		fetch crsr into vnum, vmontant;
	end while;
	close crsr;
	end |
call Aiouztouroulzeweulrd()|
delimiter ;