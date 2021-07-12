create or replace NONEDITIONABLE procedure SpisokTovarov(name_cat A_categories.name_cat%type) as
type rec is record(name_cat a_categories.name_cat%type, articul a_products.articul%type);
type ti is table of rec;
i ti;
begin
select s.name_cat, d.articul bulk collect into i
            from a_categories s,a_products d
            where d.id_category=s.id_category
            and s.name_cat=name_cat;
            for k in 1..i.count loop
            dbms_output.put_line(i(k).name_cat|| ' '||i(k).articul );
            end loop;
end;
