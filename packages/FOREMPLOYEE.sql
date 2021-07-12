create or replace NONEDITIONABLE package ForEmployyes as 
     procedure NewEmp(
      p_last_name          a_employee.last_name%type,
      p_first_name         a_employee.first_name%type,
      p_middle_name        a_employee.middle_name%type,
      p_phone              a_employee.phone%type,
      p_shop              number,
      p_position           number);


    procedure TransferEmpPosition (
      p_id_emp number,
      p_id_pos number
      );
    procedure TransferEmpShop (
      p_id_emp number,
      p_id_shop number
      );
end ForEmployyes; --спец


\


create or replace NONEDITIONABLE package body ForEmployyes as
procedure NewEmp (
  p_last_name          a_employee.last_name%type,
  p_first_name         a_employee.first_name%type,
  p_middle_name        a_employee.middle_name%type,
  p_phone              a_employee.phone%type,
  p_shop               number,
  p_position           number) as
  begin 
    insert into a_employee (id_emp,
                           last_name,
                           first_name,
                           middle_name,
                           phone,
                           id_shop,
                           id_pos)
                   values (SQL_TK_CHK_ID.nextval,
                           p_last_name,
                           p_first_name,
                           p_middle_name,
                           p_phone,
                           p_shop,
                           p_position);
  commit;
  dbms_output.put_line('cool!');
  exception
    when others then dbms_output.put_line('smth wrong((');
  end; --CreateNewEmp

procedure TransferEmpPosition (
  p_id_emp number,
  p_id_pos number
  ) as
  v_emp a_employee%rowtype;
  v_errors varchar2(1000);
  v_exc exception;
  v_exist pls_integer;
  begin 
    begin
      select * into v_emp from a_employee e where e.id_emp = p_id_emp;
    exception
      when no_data_found then v_errors := substr(v_errors || 'emp not found ', 1, 1000);
    end; --select id_emp
      select count(1) into v_exist from a_positions p where p.id_pos = p_id_pos;
      if v_exist = 0 then v_errors := substr(v_errors || ' position not found', 1, 1000);
      end if;
    if v_errors is null then 
      if v_emp.id_pos = p_id_pos then raise v_exc;
      else 
        update a_employee set id_pos = p_id_pos where id_emp = p_id_emp;
        dbms_output.put_line('ok!'); 
        commit;
       end if; 
    else dbms_output.put_line(v_errors); 
    end if;
  exception
    when v_exc then  dbms_output.put_line('position is equal');
  end; --TransferEmpPosition
procedure TransferEmpShop (
  p_id_emp number,
  p_id_shop number
  ) as
  v_emp a_employee%rowtype;
  v_errors varchar2(1000);
  v_exc exception;
  v_exist pls_integer;
  begin 
    begin
      select * into v_emp from a_employee e where e.id_emp = p_id_emp;
    exception
      when no_data_found then v_errors := substr(v_errors || 'emp not found ', 1, 1000);
    end; --select id_emp
      select count(1) into v_exist from a_shops p where p.id_shop = p_id_shop;
      if v_exist = 0 then v_errors := substr(v_errors || ' shop not found', 1, 1000);
      end if;
    if v_errors is null then 
      if v_emp.id_shop = p_id_shop then raise v_exc;
      else 
        update a_employee set id_shop = p_id_shop where id_emp = p_id_emp;
        dbms_output.put_line('ok!'); 
        commit;
       end if; 
    else dbms_output.put_line(v_errors); 
    end if;
  exception
    when v_exc then  dbms_output.put_line('shop is equal');
  end; --TransferEmpPosition


end ForEmployyes; --end of body
