--------------------------------------------------------------------------------
sudo apt-get update
sudo apt-get install mysql-server
--------------------------------------------------------------------------------
sudo service mysql stop
sudo service mysql status
sudo service mysql start
sudo systemctl enable mysql
--------------------------------------------------------------------------------
sudo mysql -u root -p
--------------------------------------------------------------------------------
show databases;
desc tabela;

--------------------------------------------------------------------------------
use banco_de_dados;

alter table comclien auto_increment=100;
alter table comivenda drop foreign key fk_comivenda_comprodu;
truncate table tb1; ========> se houver campo auto_incremente, o mesmo será reiniciado
alter table comclien modify column c_estaclien int;
create table comclien_bkp as(select * from comclien where c_estaclien = 'SP');
select concat_ws(';',c_codiclien, c_razaclien, c_nomeclien) from comclien; ========> gerar CSV
select ucase('banco de dados mysql') from dual;

select rt_nome_cliente(1) from dual;
set global event_scheduler = on;

alter event processa_comissao_event disable;
alter event processa_comissao_event enable;

show indexes from comclien2;

mysqldump -u root -p comercial > c:/bkp_tables_views.sql
mysqldump -u root -p --routines --triggers comercial > c:/bkp_full.sql
mysqldump -u root -p comercial comclien > c:/bkp_clien.sql
mysqldump -u root -p --all-databases > c:/bkp_all.sql

create database comercial2;
mysql -h localhost -u root -p -d comercial2 < c:/bkp_full.sql

show variables;
show variables like '%table%';
show processlist;
kill numero_id;

select * from comclien into outfile '/var/lib/mysql-files/lista_clientes.txt'
fields terminated by ',' 
enclosed by '"';