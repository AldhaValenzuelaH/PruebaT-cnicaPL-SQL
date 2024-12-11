REM   Script: prueba tecnica
REM   prueba técnica de claro

select * from productos;

CREATE TABLE clientes ( 
    cod_cliente number PRIMARY KEY, 
    tipo_documento varchar2(10), 
    nro_documento varchar2(7), 
    cp varchar2(50), 
    score number, 
    fec_nacimiento date, 
    sexo varchar(10), 
    segmento_cliente varchar(50) 
) 
 
CREATE TABLE lineas ( 
    cod_linea NUMBER PRIMARY KEY,         
    linea VARCHAR2(15),                   
    tipo_contrato VARCHAR2(10),         
    fec_act_linea DATE,                  
    tipo_producto VARCHAR2(10),           
    flag_portabilidad NUMBER(1),          
    estado_linea VARCHAR2(15),            
    cod_cliente NUMBER,                   
    cod_plan NUMBER                       
);

CREATE TABLE RECARGA ( 
    cod_linea NUMBER,                
    cod_cliente NUMBER,              
    monto_recarga NUMBER(10, 2),     
    fecha_recarga DATE,              
    fecha_venc DATE,                 
    cod_pdv NUMBER,                
    CONSTRAINT pk_recarga PRIMARY KEY (cod_linea, fecha_recarga),  
    CONSTRAINT fk_recarga_cliente FOREIGN KEY (cod_cliente) REFERENCES CLIENTES (cod_cliente), 
    CONSTRAINT fk_recarga_linea FOREIGN KEY (cod_linea) REFERENCES LINEAS (cod_linea)  
);

CREATE TABLE FACTURACION ( 
    cod_factura NUMBER PRIMARY KEY,  
    periodo_fact DATE,             
    concepto VARCHAR2(50),           
    monto_fact NUMBER(10, 2),       
    cod_cliente NUMBER,              
    cod_linea NUMBER,                
    cod_plan NUMBER,                
    CONSTRAINT fk_fact_cliente FOREIGN KEY (cod_cliente) REFERENCES CLIENTES (cod_cliente), 
    CONSTRAINT fk_fact_linea FOREIGN KEY (cod_linea) REFERENCES LINEAS (cod_linea),         
    CONSTRAINT fk_fact_plan FOREIGN KEY (cod_plan) REFERENCES PLANES (cod_plan)           
);

CREATE TABLE PUNTO_DE_VENTA ( 
    cod_pdv NUMBER PRIMARY KEY,         
    desc_pdv VARCHAR2(100),             
    region_pdv VARCHAR2(50),            
    dpto_pdv VARCHAR2(50),              
    prov_pdv VARCHAR2(50),              
    dist_pdv VARCHAR2(50),              
    canal_pdv VARCHAR2(50)              
);

CREATE TABLE PLAN_TARIFARIO ( 
    cod_plan NUMBER PRIMARY KEY,       
    desc_plan VARCHAR2(100),            
    fec_creac_plan DATE,                
    CF NUMBER(10, 2),                   
    estado_plan VARCHAR2(20)            
);

CREATE TABLE TRAFICO ( 
    cod_cliente NUMBER,                
    cod_linea NUMBER,                   
    linea_B VARCHAR2(20),             
    zona_tarif VARCHAR2(20),           
    operador_B VARCHAR2(50),           
    flag_NF NUMBER(1),                
    trafico NUMBER(10, 2),            
    consumo NUMBER(10, 2),             
    costo_trafico NUMBER(10, 2),      
    fecha_trafico DATE,                
    cod_plan NUMBER,                  
    CONSTRAINT pk_trafico PRIMARY KEY (cod_cliente, cod_linea, fecha_trafico),  
    CONSTRAINT fk_trafico_plan FOREIGN KEY (cod_plan) REFERENCES PLAN_TARIFARIO (cod_plan),  
    CONSTRAINT fk_trafico_cliente FOREIGN KEY (cod_cliente) REFERENCES CLIENTES (cod_cliente),  
    CONSTRAINT fk_trafico_linea FOREIGN KEY (cod_linea) REFERENCES LINEAS (cod_linea)  
);

CREATE TABLE VENTA ( 
    nro_venta NUMBER PRIMARY KEY,        
    cod_cliente NUMBER NOT NULL,         
    cod_linea NUMBER NOT NULL,           
    cod_pdv NUMBER NOT NULL,            
    fec_venta DATE NOT NULL,            
    estado_linea VARCHAR2(20) NOT NULL,  
    cod_plan NUMBER NOT NULL,           
    CONSTRAINT fk_venta_cliente FOREIGN KEY (cod_cliente) REFERENCES CLIENTES (cod_cliente),  
    CONSTRAINT fk_venta_linea FOREIGN KEY (cod_linea) REFERENCES LINEAS (cod_linea),        
    CONSTRAINT fk_venta_pdv FOREIGN KEY (cod_pdv) REFERENCES PUNTO_DE_VENTA (cod_pdv),       
    CONSTRAINT fk_venta_plan FOREIGN KEY (cod_plan) REFERENCES PLAN_TARIFARIO (cod_plan)    
);

CREATE TABLE clientes ( 
    cod_cliente number PRIMARY KEY, 
    tipo_documento varchar2(10), 
    nro_documento varchar2(7), 
    cp varchar2(50), 
    score number, 
    fec_nacimiento date, 
    sexo varchar(10), 
    segmento_cliente varchar(50) 
);

CREATE TABLE lineas ( 
    cod_linea NUMBER PRIMARY KEY,         
    linea VARCHAR2(15),                   
    tipo_contrato VARCHAR2(10),         
    fec_act_linea DATE,                  
    tipo_producto VARCHAR2(10),           
    flag_portabilidad NUMBER(1),          
    estado_linea VARCHAR2(15),            
    cod_cliente NUMBER,                   
    cod_plan NUMBER                       
);

CREATE TABLE RECARGA ( 
    cod_linea NUMBER,                
    cod_cliente NUMBER,              
    monto_recarga NUMBER(10, 2),     
    fecha_recarga DATE,              
    fecha_venc DATE,                 
    cod_pdv NUMBER,                
    CONSTRAINT pk_recarga PRIMARY KEY (cod_linea, fecha_recarga),  
    CONSTRAINT fk_recarga_cliente FOREIGN KEY (cod_cliente) REFERENCES CLIENTES (cod_cliente), 
    CONSTRAINT fk_recarga_linea FOREIGN KEY (cod_linea) REFERENCES LINEAS (cod_linea)  
);

CREATE TABLE FACTURACION ( 
    cod_factura NUMBER PRIMARY KEY,  
    periodo_fact DATE,             
    concepto VARCHAR2(50),           
    monto_fact NUMBER(10, 2),       
    cod_cliente NUMBER,              
    cod_linea NUMBER,                
    cod_plan NUMBER,                
    CONSTRAINT fk_fact_cliente FOREIGN KEY (cod_cliente) REFERENCES CLIENTES (cod_cliente), 
    CONSTRAINT fk_fact_linea FOREIGN KEY (cod_linea) REFERENCES LINEAS (cod_linea),         
    CONSTRAINT fk_fact_plan FOREIGN KEY (cod_plan) REFERENCES PLANES (cod_plan)           
);

CREATE TABLE PUNTO_DE_VENTA ( 
    cod_pdv NUMBER PRIMARY KEY,         
    desc_pdv VARCHAR2(100),             
    region_pdv VARCHAR2(50),            
    dpto_pdv VARCHAR2(50),              
    prov_pdv VARCHAR2(50),              
    dist_pdv VARCHAR2(50),              
    canal_pdv VARCHAR2(50)              
);

CREATE TABLE PLAN_TARIFARIO ( 
    cod_plan NUMBER PRIMARY KEY,       
    desc_plan VARCHAR2(100),            
    fec_creac_plan DATE,                
    CF NUMBER(10, 2),                   
    estado_plan VARCHAR2(20)            
);

CREATE TABLE TRAFICO ( 
    cod_cliente NUMBER,                
    cod_linea NUMBER,                   
    linea_B VARCHAR2(20),             
    zona_tarif VARCHAR2(20),           
    operador_B VARCHAR2(50),           
    flag_NF NUMBER(1),                
    trafico NUMBER(10, 2),            
    consumo NUMBER(10, 2),             
    costo_trafico NUMBER(10, 2),      
    fecha_trafico DATE,                
    cod_plan NUMBER,                  
    CONSTRAINT pk_trafico PRIMARY KEY (cod_cliente, cod_linea, fecha_trafico),  
    CONSTRAINT fk_trafico_plan FOREIGN KEY (cod_plan) REFERENCES PLAN_TARIFARIO (cod_plan),  
    CONSTRAINT fk_trafico_cliente FOREIGN KEY (cod_cliente) REFERENCES CLIENTES (cod_cliente),  
    CONSTRAINT fk_trafico_linea FOREIGN KEY (cod_linea) REFERENCES LINEAS (cod_linea)  
);

CREATE TABLE VENTA ( 
    nro_venta NUMBER PRIMARY KEY,        
    cod_cliente NUMBER NOT NULL,         
    cod_linea NUMBER NOT NULL,           
    cod_pdv NUMBER NOT NULL,            
    fec_venta DATE NOT NULL,            
    estado_linea VARCHAR2(20) NOT NULL,  
    cod_plan NUMBER NOT NULL,           
    CONSTRAINT fk_venta_cliente FOREIGN KEY (cod_cliente) REFERENCES CLIENTES (cod_cliente),  
    CONSTRAINT fk_venta_linea FOREIGN KEY (cod_linea) REFERENCES LINEAS (cod_linea),        
    CONSTRAINT fk_venta_pdv FOREIGN KEY (cod_pdv) REFERENCES PUNTO_DE_VENTA (cod_pdv),       
    CONSTRAINT fk_venta_plan FOREIGN KEY (cod_plan) REFERENCES PLAN_TARIFARIO (cod_plan)    
);

select floor(10.15) + round(10.15,2) from dual;

--9-	Agregue el código necesario para las siguientes tareas: (3pts)
--a.	Agregar un campo a la tabla cliente de tipo numérico de nombre promedio_facturacion tipo de dato numérico.
ALTER TABLE CLIENTES
ADD promedio_facturacion NUMBER(10, 2);
--b.	Elaborar un cursor para que se actualice en este campo nuevo (promedio_facturacion) el promedio de facturación de los últimos 2 meses de todos los clientes que tienen más de 24 años.
DECLARE
  CURSOR cliente_cursor IS
    SELECT cod_cliente
    FROM CLIENTES
    WHERE (SYSDATE - fec_nacimiento)/365 > 24;

  v_cod_cliente CLIENTES.cod_cliente%TYPE;
  v_promedio_facturacion NUMBER(10, 2);
BEGIN
  OPEN cliente_cursor;

  LOOP
    FETCH cliente_cursor INTO v_cod_cliente;
    EXIT WHEN cliente_cursor%NOTFOUND;

    SELECT AVG(monto_fact)
    INTO v_promedio_facturacion
    FROM FACTURACION
    WHERE cod_cliente = v_cod_cliente
      AND periodo_fact >= ADD_MONTHS(SYSDATE, -2); 

    UPDATE CLIENTES
    SET promedio_facturacion = v_promedio_facturacion
    WHERE cod_cliente = v_cod_cliente;
  END LOOP;

  CLOSE cliente_cursor;

  COMMIT;
END;
