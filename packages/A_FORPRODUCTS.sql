create or replace NONEDITIONABLE package A_ForProducts as 
     procedure NewProduct(
      p_articul          a_products.articul%type,
      p_price         a_products.price%type,
      p_size_pr        a_products.size_pr%type  default null,
      p_measurement_type              a_products.measurement_type%type,
      p_product              number,
      p_manufacturer           number,
      p_category           number);


    procedure TransferProductStorage (
      p_id_product_storage number,
      p_id_storage number,
      volume_pr1 integer
      );
     procedure NewProductStorage(
      p_volume_pr          a_products_storage.volume_pr%type,
      p_storage           number,
      p_product           number);
end A_ForProducts; --спец

\

create or replace NONEDITIONABLE package body A_ForProducts as
procedure NewProduct(
      p_articul          a_products.articul%type,
      p_price         a_products.price%type,
      p_size_pr        a_products.size_pr%type  default null,
      p_measurement_type              a_products.measurement_type%type,
      p_product              number,
      p_manufacturer           number,
      p_category           number) as
begin 
    insert into a_products (ID_PRODUCT,
                            ARTICUL,
                            PRICE,
                            SIZE_PR,
                            MEASUREMENT_TYPE,
                            ID_MANUFACTURER,
                            ID_CATEGORY)
                   values (SQL_TK_CHK_ID.nextval,
                            p_ARTICUL,
                            p_PRICE,
                            p_SIZE_PR,
                            p_MEASUREMENT_TYPE,
                            p_MANUFACTURER,
                            p_CATEGORY);
  commit;
  dbms_output.put_line('cool!');
  exception
    when others then dbms_output.put_line('smth wrong((');
  end; 
procedure productMinus(p_storage a_products_storage.id_storage%type,
                       product a_products_storage.id_product_storage%type,
                       volume_pr1 integer) as
begin                       
update a_products_storage set volume_pr=volume_pr-volume_pr1 where id_product_storage=product;
commit;
end;

procedure TransferProductStorage (
      p_id_product_storage number,
      p_id_storage number,
      volume_pr1 integer
      ) as
  v_product a_products_storage%rowtype;
  v_errors varchar2(1000);
  v_exc exception;
  v_exist pls_integer;
  v_volume a_products_storage.volume_pr%type;
  begin 
    begin
      select * into v_product from a_products_storage e where e.id_product_storage = p_id_product_storage;
    exception
      when no_data_found then v_errors := substr(v_errors || 'product not found ', 1, 1000);
    end; --select id_emp
      select count(1) into v_exist from a_storages p where p.id_storage = p_id_storage;
      if v_exist = 0 then v_errors := substr(v_errors || ' storage not found', 1, 1000);
      end if;
    if v_errors is null then 
      if v_product.id_storage = p_id_storage then raise v_exc;
      else 
          if v_product.volume_pr>=volume_pr1 then
          v_volume:=v_product.volume_pr-volume_pr1;
          NewProductStorage(v_volume,v_product.id_storage,v_product.id_product);
            update a_products_storage set id_storage = p_id_storage, volume_pr=volume_pr1 where id_product_storage = p_id_product_storage;
            
            dbms_output.put_line('ok!'); 
          else dbms_output.put_line('Tovara nedostatochno'); 
          end if;
        commit;
       end if; 
    else dbms_output.put_line(v_errors); 
    end if;
  exception
    when v_exc then  dbms_output.put_line('position is equal');
  end;
procedure NewProductStorage(
      p_volume_pr          a_products_storage.volume_pr%type,
      p_storage           number,
      p_product           number) as
  begin 
    insert into a_products_storage (ID_PRODUCT_STORAGE,                                    
                                    VOLUME_PR,
                                    ID_STORAGE,
                                    ID_PRODUCT)
                   values (SQL_TK_CHK_ID.nextval,
                           p_VOLUME_PR,
                           p_STORAGE,
                           p_PRODUCT);
  commit;
  dbms_output.put_line('cool!');
  exception
    when others then dbms_output.put_line('smth wrong((');
  end; 



end A_ForProducts; --end of body
