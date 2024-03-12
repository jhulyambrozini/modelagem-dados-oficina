use osmecanica;

-- Quais são os detalhes da ordem de número 2?
select * from orders where idOrder = 2;

-- Quais são os responsáveis pela execução da ordem de número 1?
select registration as registration_responsible, office, forwardSector, OSdescription
from responsible inner join orderService os on os.idOrderService = 1;

-- Quantas ordens estão atualmente em andamento?
select count(*) as number_of_orders_open from orders;

-- Quais são os serviços de ordem associados ao setor de Mecânica?

select registration, orderDescription, OrderName, priority, orderType
from responsible, orders
where sector = 'Mecânica'
order by registration
;


-- Quais são os clientes que têm ordens de alta prioridade?
select concat(fName, ' ', lname) as clientName, priority, orderName
from orders, clients
where orders.idClient = clients.idClient and priority = 'Alta';

-- Quais são os clientes que têm pelo menos uma ordem com prioridade "Alta" e que foram atendidas pelo setor de Mecânica?
select distinct concat(fName, ' ', lname) as clientName, orders.priority, orderName, sector
from orderService
join responsible
on idResponsibleOrder = idresponsible  and sector = 'Mecânica'
join orders
join clients using(idClient) on orders.priority = 'Alta';

-- Quais são os responsáveis que estão encarregados de ordens do tipo "Manutenção" e "Concerto"?
select registration as responsible_rg, orderType
from orders inner join responsible on idResponsible = idOrder and (orderType = 'Manutenção' or orderType = 'Concerto');
