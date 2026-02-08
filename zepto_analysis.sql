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

select * from inventory
where discountedSellingPrice > mrp;  
#no such products 

delete from inventory
where mrp = 0;


#i saw one thing that in paan corner there is a product named pampers pants 
#so now i will check each category 

select distinct category from inventory
order by category ;

# there are a lot of things which can be sorted differently in here like there are som many products of the dairy in beverages columns 
# and i have jst checked only one category 

#---------------------------------ADDING COLUMNS TO HAVE BETTER INSIGHTS-----------------------------------------
alter table inventory
add column discount decimal(10,2);

update inventory 
set discount = mrp - discountedSellingPrice;

select *, weightInGms/discountedSellingPrice as cost_per_Gms
from inventory;

alter table inventory 
add column cost_per_gm decimal(10,2);

update inventory
set cost_per_gm = weightInGms/discountedSellingPrice;

#-----------------------------------DATA EXPLORATION---------------------------------------
select name,  mrp , discountedSellingPrice
from inventory
where mrp>1000 and discountedSellingPrice > 1000;

select * from inventory 
limit 10;

select * from inventory 
where discount > 1000;

select distinct * from inventory 
where discount > 500;

select distinct category from inventory
order by category;

select outOfStock,  count(name) as no_of_units
from inventory 
group by outOfStock;

#categories having highest number of products
select category , count(distinct name) as number_of_units
from inventory 
group by category
order by number_of_units desc;

# total revenue category wise
select category , sum(availableQuantity * discountedSellingPrice) as total_revenue
from inventory
group by category
order by total_revenue desc;

#total avaialble inventory per category
select category , sum(availableQuantity) as available_inventory
from inventory
group by category
order by available_inventory;

#top 10 most expensive products by mrp
select distinct name, mrp from inventory 
order by mrp desc
limit 10;

#seeing if any of the values are null or '0'
select * from inventory
where category is null or
name is null or
mrp is null or mrp = 0 or 
discountPercent is null or 
availableQuantity is null or availableQuantity = 0 or  
discountedSellingPrice is null or
weightInGms is null or weightInGms = 0 or 
outOfStock is null or
quantity is null;

#category wise average discount percentage
select category, round(avg(discountPercent), 2) as avg_discount_percent
from inventory
group by category
order by avg_discount_percent desc;

#top 3 categories having highest average  discount percentage
select category, round(avg(discountPercent), 2) as avg_discount
from inventory
group by category 
order by avg_discount desc
limit 5;

#are higher priced items sold on higher discounts
select name, mrp,  discountPercent, discountedSellingPrice
from inventory
order by mrp desc,discountPercent desc;

# categories having higher stockout risk
select category, sum(availableQuantity) as stock from inventory 
group by category
order by stock;

#products having high stock but low discounts
select name, category, availableQuantity, discountPercent
from inventory
order by availableQuantity desc, discountPercent;

#top 10 products acc to discount on the product 
select * from inventory 
order by discount desc
limit 10;



# top 10 products acc to discount %
select distinct name , discountPercent from inventory
order by discountPercent desc
limit 10;

select name , discount, discountPercent
from inventory 
where discount > 500 and discountPercent> 20
order by discount desc, discountPercent
limit 10;

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

select * from inventory
where outOfStock = False;   # there is nothing that is outofstock 

#luxury products
select name, category, discountPercent, discountedSellingPrice
from inventory
where discountedSellingPrice > 500 and
discountPercent <10
order by discountedSellingPrice desc;




