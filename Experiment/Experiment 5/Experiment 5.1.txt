select round((sum(case when cuisine='American' then price else 0 end)*100)/sum(price),2) as American_Revenue 
from orders