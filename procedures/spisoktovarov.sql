create or replace NONEDITIONABLE procedure SpisokTovarov(name_cat A_categories.name_cat%type) as

type ti is table of a_categories.name_cat%type;
i ti;
begin
select s.name_cat bulk collect into i
            from a_categories s
            where s.name_cat=name_cat;
            for k in 1..i.count loop
            dbms_output.put_line(k|| ' '||i(k) );
            end loop;
end;
