use ProdUser;
select DISTINCT style, label, color, upc, SIZE
from StyleItem
where upc in (
'641224110603'

);




select distinct s.upc
from OrderDetail d inner join
StyleItem s on d.ITEMNO = s.ITEMNO
where s.upc in
(
'606013698700',
'606013681603',
'606013681825',
'606013684215',
'606013684246',
'606013684253',
'606013684277',
'606013684291',
'606013684307',
'606013684314',
'606013698632',
'606013686134',
'606013698649',
'606013698656',
'606013698663',
'606013698687',
'606013698694'
)
order by s.UPC


select distinct s.upc
from ProdOrderDetail
d inner join
StyleItem s on d.ITEMNO = s.ITEMNO
where s.upc in
(
'606013698700',
'606013681603',
'606013681825',
'606013684215',
'606013684246',
'606013684253',
'606013684277',
'606013684291',
'606013684307',
'606013684314',
'606013698632',
'606013686134',
'606013698649',
'606013698656',
'606013698663',
'606013698687',
'606013698694'
)
order by s.UPC