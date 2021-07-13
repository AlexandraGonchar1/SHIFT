create or replace NONEDITIONABLE procedure SpisokSkidok(p_start_sale A_sales.start_sale%type, p_end_sale A_sales.start_sale%type) as
type ti is table of A_sales.id_sale%type;
i ti;

begin
select s.id_sale bulk collect into i
            from a_sales s
            where s.start_sale<=p_end_sale
             and s.start_sale>=p_start_sale;

            for k in 1..i.count loop 
            dbms_output.put_line(k|| ' '||i(k) );
            end loop;


end;
