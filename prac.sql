USE shopDb;  -- optional if already connected

GO

CREATE PROCEDURE Normalization
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


EXEC Normalization;

EXEC sp_helptext 'Normalization';

