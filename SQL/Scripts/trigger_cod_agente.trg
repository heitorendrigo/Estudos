CREATE OR REPLACE TRIGGER trigger_cod_agente --estudo de trigger heitor 20/07/2015 base de testes
 BEFORE INSERT OR UPDATE
 ON MGGLO.GLO_GRUPO_USUARIO
 FOR EACH ROW

declare 
     
BEGIN

              if :new.GRU_IN_CODIGO > 123 then
                raise_application_error(-20001,'codigo maior que 123');

              end if;

END trigger_cod_agente; 
/
