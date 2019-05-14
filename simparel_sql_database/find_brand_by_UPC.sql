use ProdUser;
select i.upc, s.style,s.WEBATTRIBUTEB,w.WEBATTRIBNAME,i.color,i.size,c.COLORDESC,c.COLORSHORTDESC
from StyleItem i
join StyleWebAttributes s on i.DIVISION = s.DIVISION and i.style=s.style
join WebAttributes w on w.WebAttribType='b' and s.WEBATTRIBUTEB = w.WEBATTRIBCODE
join Color c on i.color = c.color
where  i.color !='999' and i.size !='U/A' and

/*i.style in
(
'G3975W'
)
or 
*/
i.upc in 
(
'793055230170'
)
;


