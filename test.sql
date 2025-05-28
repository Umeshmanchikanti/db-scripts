select CustomerName, CustomerAddress from Customers with(nolock)
where CustomerAddress = 'NY, USA'
order by CustomerName;

SET NOCOUNT ON;
SELECT o.OrderID, o.OrderDate, c.customerId, c.CustomerName, p.ProductName, p.Price, 
od.Quantity, (p.Price * od.Quantity) AS TotalPerItem
FROM Orders o WITH (NOLOCK)
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
ORDER BY o.OrderID;
 