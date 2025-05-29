USE shopDb;

GO

CREATE PROCEDURE AllInOne
AS
BEGIN
    select o.OrderID, o.OrderDate, c.customerId, c.CustomerName, p.ProductName, p.Price, 
    od.Quantity, (p.Price * od.Quantity) as TotalPerItem from Orders o with(nolock)
    join Customers c on o.CustomerID = c.CustomerID
    join OrderDetails od on o.OrderID = od.OrderID
    join Products p on od.ProductID = p.ProductID
    order by o.OrderID;
END;
GO


EXEC AllInOne;

EXEC sp_helptext 'AllInOne';

