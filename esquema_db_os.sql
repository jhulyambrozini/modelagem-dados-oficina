create database osmecanica;
use osmecanica;

create table clients(
	idClient int auto_increment primary key,
    fName varchar(10) not null,
    mInit varchar(3),
    lName varchar(20) not null,
    phoneNumber varchar(10) not null,
    adress varchar(60)
);

-- relacionamento 1:N com clients
create table orders(
	idOrder int auto_increment primary key,
    idClient int,
    orderDescription varchar(255),
    orderName varchar(45) not null,
    priority ENUM('Baixa', 'Média', 'Alta') default 'Baixa',
    orderType ENUM('Manutenção', 'Revisão', 'Substituição', 'Concerto') not null,
    constraint fk_client_id foreign key (idClient) references clients(idClient)
);

create table responsible(
	idResponsible int auto_increment primary key,
    sector varchar(45) not null,
    registration varchar(20),
    constraint unique_registration unique(registration),
    office varchar(20),
    forwardSector varchar(45) not null
);

-- relacionamento N:M com orders e responsible
create table responsibleOrder(
	idResponsible int,
    idOrder int,
    comments varchar(255),
    primary key (idResponsible, idOrder),
    constraint fk_responsible_id foreign key (idResponsible) references responsible(idResponsible),
    constraint fk_order_id foreign key (idOrder) references orders(idOrder)
);

-- relacionamento 1:1 com a tabela responsibleOrder
create table orderService(
	idOrderService int auto_increment primary key,
    idResponsibleOrder int,
    OSdescription varchar(255),
    priority ENUM('Baixa', 'Média', 'Alta') not null,
    constraint fk_responsibleOrder_os_id foreign key (idResponsibleOrder) references responsibleOrder(idResponsible),
    constraint fk_order_os_id foreign key (idResponsibleOrder) references responsibleOrder(idOrder)
);
