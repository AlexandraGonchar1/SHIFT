create or replace NONEDITIONABLE procedure SpisokMagazinov(name_shop A_shops.name_shop%type) as

type ti is table of a_shops.name_shop%type;
i ti;
begin
select s.name_shop bulk collect into i
            from a_shops s
            where s.name_shop=name_shop;
            for k in 1..i.count loop
            dbms_output.put_line(k|| ' '||i(k) );
            end loop;
end;
