BEGIN TRANSACTION;
do 
$$
begin
    alter table customers
    add column category_id int8,
    add column category_code varchar(255),
    add column brand varchar(255);
    update customers set category_id = t1.category_id, category_code = t1.category_code, brand = t1.brand from items t1 WHERE customers.product_id = t1.product_id; 
end;
$$;
COMMIT TRANSACTION;