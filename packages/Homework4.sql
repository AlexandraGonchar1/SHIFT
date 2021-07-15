create or replace NONEDITIONABLE package name1 as 

function CreateCheque(empl a_employee.id_emp%type,
                        data_cheque date) return number;

procedure CreateChequeRow(cheque a_cheques.id_cheque%type,
                            product a_products_shop.id_product_shop%type,
                            volume_pr pls_integer);


procedure GetChequeSum(cheque a_cheques.id_cheque%type, 
                        needSale PLS_INTEGER);

end name1;

\

create or replace NONEDITIONABLE package body name1 as

procedure productMinus(shop a_products_shop.id_shop%type,
                       product a_products_shop.id_product_shop%type,
                       volume_pr1 pls_integer) as
begin                       
update a_products_shop set volume_pr=volume_pr-volume_pr1 where id_product_shop=product;
commit;
end;


function GetSale(g_date_ch a_cheques.date_ch%type,
product a_products_shop.id_product_shop%type,
shop a_products_shop.id_shop%type) return number as
    i number;
    type_s integer;
begin
    select count(1) into type_s
    from a_types t where t.id_shop=shop 
                            and t.id_category is null 
                            and t.id_product_shop is null;

    if type_s=0 then
        select count(1) into type_s
        from a_types t,  a_products_shop prs, a_products_storage prst, a_products p where t.id_shop is null
                                                                                                                and prs.id_product_shop=product
                                                                                                                and prs.id_product_storage=prst.id_product_storage
                                                                                                                and prst.id_product=p.id_product
                                                                                                                and p.id_category=t.id_category
                                                                                                                and t.id_product_shop is null;

    end if;

    if type_s=0 then

        select count(1) into type_s
        from a_types t, a_products_cheque pch, a_products_shop prs, a_products_storage prst, a_products p where t.id_shop is null
                                and t.id_category is null
                                and t.id_product_shop=product; 
    end if;

    if type_s=0 then 
        i:=0;

    else 
        select s.sale_size into i
        from a_sales s
        where s.start_sale<=g_date_ch
        and (s.end_sale>=g_date_ch or s.end_sale is null);
    end if;
    return i;
end;


procedure GetChequeSum(cheque a_cheques.id_cheque%type, 
                        needSale PLS_INTEGER) as
i number;
date_ch date;
v_sale number;
begin

select a_cheques.date_ch  into date_ch from a_cheques where a_cheques.id_cheque=cheque;

   for k in ( select p.id_product_shop as product, pc.volume_pr as volume_pr, pr.price as price, p.id_shop as shop
    from a_products_shop p,  a_products_cheque pc, a_cheques che, a_products pr, a_products_storage ps
    where pc.id_cheque=che.id_cheque
          and pc.id_product_shop=p.id_product_shop
          and pr.id_product=ps.id_product
          and ps.id_product_storage=p.id_product_storage
          and che.id_cheque=cheque)   
    loop
    v_sale:=GetSale(g_date_ch=>date_ch, product=> k.product, shop=>k.shop);
    i:=nvl(i,0)+k.volume_pr*(k.price-needsale*k.price*v_sale/100);
    end loop;
    dbms_output.put_line(cheque||' '||i||' '||date_ch);
end;


procedure CreateChequeRow(cheque a_cheques.id_cheque%type,
                            product a_products_shop.id_product_shop%type,
                            volume_pr pls_integer) as
v_sale number;
shop a_employee.id_shop%type;
date_ch a_cheques.date_ch%type;
type rec is record( cheque a_cheques.id_cheque%type, articul a_products.articul%type, volume_pr pls_integer, price pls_integer, v_sale number, price_with_sale pls_integer);
type ti is table of rec;
i ti;
begin

    insert into a_products_cheque (ID_PRODUCT_CHEQUE,
                                   VOLUME_PR,
                                   ID_CHEQUE,
                                   ID_PRODUCT_SHOP
)
                   values (SQL_TK_CHK_ID.nextval,
                            VOLUME_PR,
                            CHEQUE,
                            PRODUCt);
  commit;
  dbms_output.put_line('cool!');

select a_employee.id_shop  into shop from a_cheques, a_employee where a_cheques.id_cheque=cheque
                                                          and a_employee.id_emp=a_cheques.id_emp;
productMinus(shop, product, volume_pr);
commit;

select a_cheques.date_ch  into date_ch from a_cheques where a_cheques.id_cheque=cheque;

v_sale:=getsale(date_ch, shop, product );


    select che.id_cheque, pr.articul, pc.volume_pr, pc.volume_pr*pr.price, v_sale, pc.volume_pr*(pr.price-pr.price*v_sale/100) bulk collect into i
    from a_products_shop p,  a_products_cheque pc, a_cheques che, a_products pr, a_products_storage ps
    where pc.id_product_shop=product
          and pc.id_product_shop=p.id_product_shop
          and pc.id_cheque=che.id_cheque
          and pr.id_product=ps.id_product
          and ps.id_product_storage=p.id_product_storage
          and che.id_cheque=cheque;      
    for k in 1..i.count loop
    dbms_output.put_line(i(k).cheque|| ' '|| i(k).articul|| ' '||i(k).volume_pr ||' '||i(k).price|| ' '||i(k).v_sale|| ' '||i(k).price_with_sale);
    end loop;
exception
    when others then dbms_output.put_line('smth wrong((');

end;

function CreateCheque(empl a_employee.id_emp%type,
                        data_cheque date) return number as 
cheque number;
begin
insert into a_cheques (ID_CHEQUE,
                        ID_EMP,
                        ID_CARD,
                        DATE_CH
)
                   values (SQL_TK_CHK_ID.nextval,
                            empl,
                            null,
                            data_cheque) RETURNING id_cheque into cheque;
  commit;
return cheque;
end;

end name1;
