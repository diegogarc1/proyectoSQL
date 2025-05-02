create table clientes (
    id_cliente int primary key auto_increment,
    nombre varchar(100) not null,
    apellido varchar(100) not null,
    direccion varchar(255),
    telefono varchar(20) unique,
    email varchar(100) unique,
    fecha_registro timestamp default current_timestamp,
    
    index (id_cliente),
    index (email),
    index (telefono),
);
create table deudas (
    id_deuda int primary key auto_increment,
    id_cliente int not null,
    monto_original decimal(10, 2) not null,
    monto_pendiente decimal(10, 2) not null,
    fecha_vencimiento date not null,
    tipo_deuda varchar(50),
    tasa_interes decimal(5, 2),
    fecha_inicio date,
    
    foreign key (id_cliente) references clientes(id_cliente),
    
    index (id_cliente),
    index (fecha_vencimiento)
);

create table pagos (
    id_pago int primary key auto_increment,
    id_deuda int not null,
    fecha_pago date not null,
    monto_pagado decimal(10, 2) not null,
    metodo_pago varchar(50),
    referencia varchar(100),
    
    foreign key (id_deuda) references deudas(id_deuda),
    
    index (id_deuda),
    index (fecha_pago)
);

create table agentes (
    id_agente int primary key auto_increment,
    nombre varchar(100) not null,
    apellido varchar(100) not null,
    email_agente varchar(100) unique,
    telefono_agente varchar(20),
    fecha_contratacion date
    
    index (id_agente)
    index (email_agente)
);

create table interacciones (
    id_interaccion int primary key auto_increment,
    id_deuda int not null,
    id_agente int not null,
    fecha_hora datetime default current_timestamp,
    tipo_interaccion varchar(50),
    canal varchar(50),
    duracion int, 
    resultado varchar(255),
    notas text,
    
    foreign key (id_deuda) references deudas(id_deuda),
    foreign key (id_agente) references agentes(id_agente),
    
    index (id_deuda),
    index (id_agente),
    index (fecha_hora)
);

create table planes_pago (
    id_plan int primary key auto_increment,
    id_deuda int not null,
    fecha_inicio date,
    fecha_fin date,
    monto_cuota decimal(10, 2),
    frecuencia varchar(20), 
    dia_de_pago int,
    estado varchar(20),
    
    foreign key (id_deuda) references deudas(id_deuda),
    
    index (id_deuda),
    index (estado)
    index (dia_de_pago)
);

select * from clientes;
select * from deudas;
select * from pagos;
select * from agentes;
select * from interacciones;
select * from planes_pago;

insert into clientes (nombre, apellido, direccion, telefono, email) values
('Ana', 'González Pérez', 'Av. Las Flores #123, Col. Jardines', '55-1234-5678', 'ana.gonzalez@email.com'),
('Carlos', 'Rodríguez López', 'Calle Hidalgo #456, Centro Histórico', '55-9876-5432', 'carlos.rodriguez@mail.net'),
('Sofía', 'Martínez Vargas', 'Blvd. Revolución #789, Col. Moderna', '33-1122-3344', 'sofia.martinez@provider.mx'),
('Javier', 'Sánchez Ruiz', 'Privada Los Pinos #101, Residencial', '55-5566-7788', 'javier.sanchez@domain.info'),
('Mariana', 'Díaz Flores', 'Plaza del Sol #222, Local 3B', '33-9900-1122', 'mariana.diaz@correo.org'),
('Fernando', 'Castro Soto', 'Camino Real #333, Fraccionamiento', '55-2233-4455', 'fernando.castro@email.co'),
('Isabela', 'Jiménez Torres', 'Retorno Primavera #444, Lomas Altas', '33-4455-6677', 'isabela.jimenez@mail.com'),
('Ricardo', 'Vargas León', 'Sendero de la Luna #555, Bosques', '55-7788-9900', 'ricardo.vargas@provider.net'),
('Valeria', 'Pérez Gómez', 'Avenida Central #666, Zona Industrial', '33-6677-8899', 'valeria.perez@domain.mx'),
('Andrés', 'Ruiz Chávez', 'Circuito Agua Azul #777, La Paz', '55-3344-5566', 'andres.ruiz@correo.info');

Insert Into Deudas (Id_cliente, Monto_original, Monto_pendiente, Fecha_vencimiento, Tipo_deuda) Values
(1, 1500.00, 750.00, '2025-05-15', 'Tarjeta de Crédito'),
(2, 2800.50, 2800.50, '2025-05-20', 'Préstamo Personal'),
(3, 550.75, 0.00, '2025-04-30', 'Servicio de Telefonía'),
(4, 12000.00, 11500.00, '2025-06-10', 'Crédito Automotriz'),
(5, 320.90, 320.90, '2025-05-05', 'Suscripción de Revista'),
(6, 875.20, 437.60, '2025-05-25', 'Compra en Tienda Departamental'),
(7, 6000.00, 6000.00, '2025-07-01', 'Préstamo Educativo'),
(8, 180.50, 0.00, '2025-04-25', 'Factura de Gas'),
(9, 2100.00, 1050.00, '2025-06-15', 'Tarjeta de Crédito'),
(10, 950.30, 950.30, '2025-05-10', 'Servicio de Internet');

Insert Into Pagos (Id_deuda, Fecha_pago, Monto_pagado, Metodo_pago, Referencia) Values
(1, '2025-05-01', 750.00, 'Transferencia Bancaria', 'TRN-12345'),
(3, '2025-04-29', 550.75, 'Pago en Línea', 'REF-98765'),
(8, '2025-04-24', 180.50, 'Pago con Tarjeta', 'AUTH-54321'),
(6, '2025-05-02', 437.60, 'Pago en Sucursal', 'REC-11223'),
(9, '2025-05-03', 1050.00, 'Transferencia SPEI', 'SPEI-44556');

Insert Into Agentes (Nombre, Apellido, Email_agente, Telefono_agente) Values
('Laura', 'Pérez Vargas', 'laura.perez@callcenter.com', '55-8899-0011'),
('Miguel', 'Gómez Ruiz', 'miguel.gomez@callcenter.com', '33-2233-4455'),
('Carmen', 'Sánchez Díaz', 'carmen.sanchez@callcenter.com', '55-6677-8899'),
('Roberto', 'Flores Castro', 'roberto.flores@callcenter.com', '33-9900-1122'),
('Elena', 'Ruiz Soto', 'elena.ruiz@callcenter.com', '55-1122-3344');

Insert Into Interacciones (Id_deuda, Id_agente, Fecha_hora, Tipo_interaccion, Resultado) Values
(1, 1, '2025-05-01 10:00:00', 'Llamada', 'Promesa de pago para el 15 de mayo'),
(2, 2, '2025-05-02 14:30:00', 'Llamada', 'Cliente no contesta, dejar mensaje de voz'),
(4, 1, '2025-05-02 09:15:00', 'Email', 'Recordatorio de pago pendiente enviado'),
(6, 3, '2025-05-03 11:45:00', 'Sms', 'Mensaje de texto con información de pago'),
(9, 2, '2025-05-03 16:00:00', 'Llamada', 'Se acuerda plan de pago parcial'),
(10, 4, '2025-05-04 12:00:00', 'Llamada', 'Cliente informa que realizará el pago mañana'),
(1, 3, '2025-05-04 17:15:00', 'Llamada', 'Confirmación de promesa de pago'),
(2, 5, '2025-05-05 08:30:00', 'Llamada', 'Cliente solicita más información sobre la deuda'),
(4, 2, '2025-05-05 15:45:00', 'Email', 'Respuesta a consulta del cliente enviada'),
(7, 1, '2025-05-06 10:30:00', 'Llamada', 'Se informa sobre opciones de reestructuración');

Insert Into Planes_pago (Id_deuda, Fecha_inicio, Fecha_fin, Monto_cuota, Frecuencia, Dia_pago, Estado) Values
(9, '2025-05-03', '2025-06-03', 525.00, 'Mensual', 3, 'Activo'),
(7, '2025-07-15', '2026-07-15', 500.00, 'Mensual', 15, 'Pendiente'),
(1, '2025-05-15', '2025-05-15', 750.00, 'Único', 15, 'Pendiente');
Manage cookies
Do not share my personal information
Proyecto.sql
