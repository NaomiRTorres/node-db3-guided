-- Join an order id to a customer id
SELECT orders.OrderId, orders.OrderDate, customers.CustomerName
FROM Orders
join Customers on orders.customerId = customers.customerId;


-- show a list of orders and include the name of the shipping company used
SELECT o.orderID, c.CustomerName, e.FirstName as ShipperEmpolyee , s.ShipperName as DeliveryCompany, o.OrderDate
FROM Orders as o
JOIN Customers as c ON o.CustomerID = c.CustomerID
JOIN Employees as e ON o.EmployeeID = e.EmployeeID
JOIN Shippers as s ON o.ShipperID = s.ShipperID
ORDER BY c.CustomerName;

-- view order id, date, and the name of the product, quanitity, price, line total
select o.orderid, o.orderdate, p.productname, od.quantity, p.price, (p.price * od.quantity) as 'Total' 
from orders as o
join orderdetails as od on od.orderid = o.orderid
join products as p on p.productid = od.productid;


-- view a list of customers, even if they don't have orders
select * 
from customers as c 
left join orders as o 
	on c.customerId = o.customerId
where o.orderId is null;