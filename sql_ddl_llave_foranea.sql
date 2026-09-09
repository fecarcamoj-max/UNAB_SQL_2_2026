# Trabajar con más de una tabla.....
# Creación de dos tablas relacionadas por llave foránea. - Relación 1 a muchos

# Creación de base de datos.
CREATE DATABASE ejemplo_foranea;
use ejemplo_foranea;
# creación de tabla persona.

CREATE table persona(
	id bigint not null primary key auto_increment,
    nombre varchar(100) not null,
    apellido varchar(100) not null
);

# Creación de tabla venta

CREATE TABLE venta(
	id bigint not null primary key auto_increment,
    id_persona bigint not null,
    id_producto bigint not null,
    precio double not null,
    cantidad int not null,
    fecha datetime not null,
    foreign key (id_persona) references persona(id)
);

### Relación uno a uno.

CREATE TABLE venta_2(
	id bigint not null primary key auto_increment,
    id_persona bigint not null UNIQUE, # RELACIÓN 1 A 1 DEPENDE DE LA RESTRICCIÓN UNIQUE
    id_producto bigint not null,
    precio double not null,
    cantidad int not null,
    fecha datetime not null,
    foreign key (id_persona) references persona(id)
);

SHOW COLUMNS FROM venta_2;