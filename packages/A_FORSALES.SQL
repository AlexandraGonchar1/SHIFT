create or replace NONEDITIONABLE package A_ForSales as 
     procedure NewSale(
      p_sale_time          a_sales.sale_time%type,
      p_sale             number,
      p_type           number,
      p_shop           number);


end A_ForSales; --спец

\

create or replace NONEDITIONABLE package body A_ForSales as
procedure NewSale(
      p_sale_time          a_sales.sale_time%type,
      p_sale             number,
      p_type           number,
      p_shop           number) as
begin 
    insert into a_sales (ID_SALE,
                        SALE_TIME,
                        ID_TYPE,
                        ID_SHOP
)
                   values (SQL_TK_CHK_ID.nextval,
                            p_SALE_TIME,
                            p_TYPE,
                            p_SHOP);
  commit;
  dbms_output.put_line('cool!');
  exception
    when others then dbms_output.put_line('smth wrong((');
  end; 

end A_ForSales; --end of body
