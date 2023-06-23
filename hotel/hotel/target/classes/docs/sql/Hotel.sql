drop database if exists hotel;
create database hotel;
use hotel;

drop table if exists clientes;
drop table if exists habitaciones;
drop table if exists reservas;

create table clientes(
	id int auto_increment primary key,
	nombre varchar(25) not null,
	apellido varchar(25) not null,
	tipoDocumento enum('DNI','PASAPORTE'),
	numeroDocumento char(8)
);

create table habitaciones(
	id int auto_increment primary key,
	numero varchar(25) not null,
	capacidad enum('SIMPLE','DOBLE','TRIPLE')
);

create table reservas(
	id int auto_increment primary key,
    fecha_ingreso date,
    fecha_egreso date,
	medioDePago enum('EFECTIVO','DEBITO','CREDITO'),
 	idCliente int not null,
    idHabitacion int not null
);

alter table reservas
	add constraint FK_reservas_idHabitacion
    foreign key(idHabitacion)
    references habitaciones(id);
    
 alter table reservas
	add constraint FK_reservas_idCliente
    foreign key(idCliente)
    references clientes(id);   
    
insert into clientes (nombre,apellido,tipoDocumento,numeroDocumento) values ('Juan','Rodriguez','DNI','29876622');
insert into clientes (nombre,apellido,tipoDocumento,numeroDocumento) values ('Malena','Toledo','DNI','16876321');
insert into clientes (nombre,apellido,tipoDocumento,numeroDocumento) values ('Facundo','Perez','DNI','16896521');
insert into clientes (nombre,apellido,tipoDocumento,numeroDocumento) values ('Pablo','Ramirez','DNI','28896523');
insert into clientes (nombre,apellido,tipoDocumento,numeroDocumento) values ('Juliana','Toledo','DNI','32896652');
insert into habitaciones (numero,capacidad) values ('1','DOBLE');
insert into habitaciones (numero,capacidad) values ('2','DOBLE');
insert into habitaciones (numero,capacidad) values ('3','TRIPLE');
insert into habitaciones (numero,capacidad) values ('101','DOBLE');
insert into habitaciones (numero,capacidad) values ('102','SIMPLE');
insert into habitaciones (numero,capacidad) values ('103','TRIPLE');

insert into reservas (fecha_ingreso,fecha_egreso,medioDePago,idCliente,idHabitacion) 
	values ('2024-01-01','2024-01-10','EFECTIVO','1','2');
insert into reservas (fecha_ingreso,fecha_egreso,medioDePago,idCliente,idHabitacion) 
	values ('2024-01-05','2024-01-12','DEBITO','2','3');
insert into reservas (fecha_ingreso,fecha_egreso,medioDePago,idCliente,idHabitacion) 
	values ('2024-02-03','2024-02-15','CREDITO','3','1');
insert into reservas (fecha_ingreso,fecha_egreso,medioDePago,idCliente,idHabitacion) 
	values ('2024-03-01','2024-03-15','DEBITO','4','4');
insert into reservas (fecha_ingreso,fecha_egreso,medioDePago,idCliente,idHabitacion) 
	values ('2024-02-03','2024-02-15','DEBITO','4','2');
    
-- consultas --
-- mostrar los datos de los clientes que realizaron una reserva y los datos de esta --
select * from clientes c join reservas r on c.id=r.idCliente;
-- mostrar los datos de las reservas para la habitacion id=2 y los datos de la habitacion--
select * from reservas r join habitaciones h on r.idHabitacion=h.id where h.id='2';
-- mostrar los datos de clientes que reservaron habitaciones triples y los datos de la habitacion--
select * from clientes c join reservas r on c.id=r.idCliente join habitaciones h on r.idHabitacion=h.id 
where capacidad='TRIPLE';
    