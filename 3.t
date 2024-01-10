3. termin 
use AdventureWorksDW2017 

select distinct dp.productkey, dp.englishproductname, dps.englishproductsubcategoryname, dpc.englishproductcategoryname,dst.salesterritoryregion, fis.salesamount, dd.englishmonthname, count(fis.orderquantity)as pocet, (fis.salesamount*count(fis.orderquantity))as obrat 

from factinternetsales fis 

join dimproduct dp on fis.productkey=dp.productkey 

join dimproductsubcategory dps on dp.productsubcategorykey=dps.productsubcategorykey 

join dimproductcategory dpc on dps.ProductCategoryKey=dpc.ProductCategoryKey 

join dimsalesterritory dst on fis.SalesTerritoryKey=dst.SalesTerritoryKey 

join dimdate dd on dd.DateKey=fis.OrderDateKey 

group by dp.productkey, dp.englishproductname, dps.englishproductsubcategoryname,dpc.englishproductcategoryname, dst.salesterritoryregion, fis.salesamount, fis.orderdate, dd.englishmonthname

having fis.salesamount*count(fis.orderquantity)>2500 and year(orderdate)='2012' and (dst.SalesTerritoryRegion like 'Germany' or dst.SalesTerritoryRegion like 'France') 

order by dst.SalesTerritoryRegion
