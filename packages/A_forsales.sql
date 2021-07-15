create or replace NONEDITIONABLE package A_ForSales as 
     procedure NewSale(
                          p_sale_start          a_sales.start_sale%type,
                          p_end_sale         a_sales.end_sale%type default null,
                          p_sale_size          a_sales.sale_size%type,
                          p_type           number);
                          
    procedure NewTypeofSale(p_shop number default null,
                            p_category number default null,
                            p_product_shop number default null
    );
    
    procedure SpisokSkidok(p_start_sale A_sales.start_sale%type, 
                           p_end_sale A_sales.start_sale%type);

end A_ForSales; --спец

\

create or replace NONEDITIONABLE package body A_ForSales as
procedure NewSale(
                  p_sale_start          a_sales.start_sale%type,
                  p_end_sale         a_sales.end_sale%type default null,
                  p_sale_size          a_sales.sale_size%type,
                  p_type           number) as
begin 
    insert into a_sales (ID_SALE,
                        ID_TYPE,
                        SALE_SIZE,
                        START_SALE,
                        END_SALE
)
                   values (SQL_TK_CHK_ID.nextval,
                            p_TYPE,
                            p_sale_size,
                            p_SALE_start,
                            p_end_sale);
  commit;
  dbms_output.put_line('cool!');
  exception
    when others then dbms_output.put_line('smth wrong((');
  end; 

procedure NewTypeofSale(p_shop number default null,
                        p_category number default null,
                        p_product_shop number default null
    ) as
begin 
    insert into a_types (ID_TYPE,
                            ID_SHOP,
                            ID_CATEGORY,
                            ID_PRODUCT_SHOP)

                   values (SQL_TK_CHK_ID.nextval,
                            p_shop,
                            p_category,
                            p_product_shop);
  commit;
  dbms_output.put_line('cool!');
  exception
    when others then dbms_output.put_line('smth wrong((');
  end; 

procedure SpisokSkidok(p_start_sale A_sales.start_sale%type, p_end_sale A_sales.start_sale%type) as
type rec is record( id_sale a_sales.id_sale%type, sale_size a_sales.sale_size%type ,start_sale a_sales.start_sale%type,end_sale a_sales.end_sale%type, id_category number, id_shop number, id_product_shop number);
type ti is table of rec;
i ti;

begin
select s.id_sale, s.sale_size, s.start_sale, s.end_sale, t.id_category, t.id_shop, t.id_product_shop bulk collect into i
            from a_sales s, a_types t
            where s.start_sale<=p_end_sale
             and s.start_sale>=p_start_sale
             and s.id_type=t.id_type;

            for k in 1..i.count loop 
            dbms_output.put_line(i(k).id_sale|| ' '||i(k).sale_size|| ' '||i(k).start_sale|| ' '||i(k).end_sale|| ' '||i(k).id_category|| ' '||i(k).id_shop|| ' '||i(k).id_product_shop );
            end loop;


end;

end A_ForSales; --end of body
