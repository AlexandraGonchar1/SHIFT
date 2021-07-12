create or replace NONEDITIONABLE procedure Kolichestvo (p_shop a_shops.id_shop%type) as
type rec is record( articul a_products.articul%type, volume_pr pls_integer);
type ti is table of rec;
i ti;
begin
    select pr.articul, sum(ps.volume_pr) bulk collect into i
    from a_shops s,a_products_shop p,  a_products_storage ps, a_storages st, a_products pr
    where p.id_shop=s.id_shop 
          and ps.id_product_storage=p.id_product_storage
          and ps.id_storage=st.id_storage
          and pr.id_product=ps.id_product
          and s.id_shop=p_shop
    group by pr.articul 
    order by 1,2;      
    for k in 1..i.count loop
    dbms_output.put_line(i(k).articul|| ' '||i(k).volume_pr );
    end loop;
end;
