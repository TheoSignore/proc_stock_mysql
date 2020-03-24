delimiter |
drop procedure if exists Abonnement |

create procedure Abonnement()
	begin
	declare done int default 0;
	declare num integer;
	declare nom char(20);
	declare abo cursor for
	select distinct souscrit.num, souscrit.nom 
	from souscrit 
	inner join abonne 
	on souscrit.num = abonne.num 
	order by souscrit.num;
	declare continue handler for not found set done = 1;
	
	open abo;
	fetch abo into num, nom;
	while !done do
		select num,nom; 
		fetch abo into num, nom;
	end while;
	close abo;
	end|
call Abonnement()|
delimiter ;
