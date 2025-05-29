select CustomerName from Customers with(nolock)
where CustomerAddress = 'NY, USA';

set nocount on;
select o.OrderID, o.OrderDate, c.customerId, c.CustomerName, p.ProductName, p.Price, 
od.Quantity, (p.Price * od.Quantity) as TotalPerItem from Orders o with(nolock)
join Customers c on o.CustomerID = c.CustomerID
join OrderDetails od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID
order by o.OrderID;
 
select CustomerName from Customers with(nolock);


