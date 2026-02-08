drop database if exists zepto;
drop database zepto; 
create database zepto;
use zepto;



select * from inventory;


#-----------------------------------DATA CLEANING------------------------------------------

update inventory
set mrp = mrp/100;

update inventory
set discountedSellingPrice = discountedSellingPrice/100;

select * from inventory
where mrp = 0 or discountedSellingPrice = 0;

delete from inventory
where mrp = 0;

#-----------------------------------DATA EXPLORATION---------------------------------------
select distinct category from inventory
order by category;

select * from inventory
where category is null or
name is null or
mrp is null or 
discountPercent is null or 
availableQuantity is null or 
discountedSellingPrice is null or
weightInGms is null or 
outOfStock is null or
quantity is null;

select * from inventory
where outOfStock = False;   # there is nothing that is outofstock 

select category , count(distinct name) as number_of_units
from inventory 
group by category
order by number_of_units desc;

select name,  mrp , discountedSellingPrice
from inventory
where mrp>1000 and discountedSellingPrice > 1000;

alter table inventory
add column discount decimal(10,2);

update inventory 
set discount = mrp - discountedSellingPrice;

select * from inventory 
limit 10;

select * from inventory 
where discount > 1000;

select distinct * from inventory 
where discount > 500;

select *, weightInGms/discountedSellingPrice as cost_per_Gms
from inventory;

alter table inventory 
add column cost_per_gm decimal(10,2);

update inventory
set cost_per_gm = weightInGms/discountedSellingPrice;

#top 5 categories having highest average  discount percentage
select category, round(avg(discountPercent), 2) as avg_discount
from inventory
group by category 
order by avg_discount desc
limit 5;

#top 10 products acc to discount on the product 
select * from inventory 
order by discount desc
limit 10;

#on the last query i saw one thing that in paan corner there is a product named pampers pants 
#so now i will check each category 

select distinct category from inventory
order by category ;

# there are a lot of things which can be sorted differently in here like there are som many products of the dairy in beverages columns 
# and i have jst checked only one category 

# top 10 products acc to discount %
select distinct name , discountPercent from inventory
order by discountPercent desc
limit 10;

select name , discount, discountPercent
from inventory 
where discount > 500 and discountPercent> 20
order by discount desc, discountPercent
limit 10;

# total revenue category wise
select category , sum(availableQuantity * discountedSellingPrice) as total_revenue
from inventory
group by category
order by total_revenue desc;

#total inventory weight
select category, sum(availableQUantity *weightInGms) as total_inventory_weight
from inventory
group by category
order by total_inventory_weight desc;

#grouping the products into categories like low, medium, bulk
select distinct name , weightInGms ,
case 
     when weightInGms < 1000 then 'low'
     when weightInGms < 5000 then 'medium'
     else 'bulk'
end as weight_category
from inventory;



