DECLARE VARIABLE NM SMALLINT;
IF (NEW.CODIGO IS NULL) THEN
BEGIN
    SELECT MAX(A.CODIGO) FROM DESC_CATEGORIA A INTO :NM;
    IF(NM IS NULL) THEN NEW.CODIGO=1;
    ELSE NEW.CODIGO=NM+1;
END


CREATE TABLE cargos_en_cuotas_CTAS 
(
  ORDEN                    NUMERO NOT NULL,
  NCUOTA                 CANTIDAD ,
  IMPCUOTA                  PESOS ,
  IMPPAGO                   PESOS DEFAULT 0.0,
  VIA                        SCOD ,
  MES                      NUMERO ,
  MESCOBRADO               NUMERO 
);

ALTER TABLE cargos_en_cuotas_CTAS ADD CONSTRAINT FK_cargos_en_cuotas_CTAS_1 
  FOREIGN KEY (ORDEN) REFERENCES AY_EC_OTORGADAS
  (ORDEN) 
  ON DELETE CASCADE
  ON UPDATE NO ACTION
;

CREATE ASC INDEX IDX_cargos_en_cuotas_CTAS1 ON AY_EC_OTORGADAS_CTAS (ORDEN, MES);

CREATE ASC INDEX IDX_cargos_en_cuotas_CTAS2 ON AY_EC_OTORGADAS_CTAS (ORDEN, NCUOTA);






CREATE TABLE cargos_en_cuotas 
(
  ORDEN                         NUMERO NOT NULL,
  NUMERO                   NUMAFILIADO ,
  BENEFICIO                     NUMERO ,
  CONCEPTO                      NUMERO ,
  VIA                             SCOD ,
  FECHA                          FECHA DEFAULT CURRENT_DATE,
  PRESTAMO                      MONEDA ,
  CUOTAS                      CANTIDAD ,
  IMPCUOTA                     NUMERIC( 10, 2),
  CTASPAGAS                   CANTIDAD ,
  LLAVE_PAGO             DESCRIPCION25 ,
  CTASCOBRADAS                CANTIDAD ,
  CTASPENDIENTES                BIGINT         COMPUTED BY ((CUOTAS-CTASPAGAS)-CTASCOBRADAS),
  MESINICIO                     NFECHA ,
  MESFINAL                      NFECHA ,
  CUOTAENVIO                   DECIMAL( 12, 2),
  CAPITAL                       MONEDA ,
  PORCENTUAL                   NUMERIC( 10, 2),
  PREVISION                    NUMERIC( 10, 2),
  TEA                          NUMERIC( 10, 2),
  CFT                          NUMERIC( 10, 2),
  USUARIO                      VARCHAR(   200)  COLLATE NONE,
  GRILLA                      SMALLINT,
  CODIGO_AYUDA_EC             SMALLINT,
  ESTADO                      SMALLINT         DEFAULT 0,
 CONSTRAINT PK_cargos_en_cuotas  PRIMARY KEY (ORDEN)
);



CREATE TRIGGER cargos_en_cuotas _AI0 FOR cargos_en_cuotas  ACTIVE AFTER INSERT POSITION 0 AS
DECLARE VARIABLE CC SMALLINT;
DECLARE VARIABLE VIAS VARCHAR(3);
DECLARE VARIABLE MES INTEGER;
BEGIN
IF (NOT (NEW.CUOTAS IS NULL OR NEW.CUOTAS=0))  THEN
BEGIN
CC=0;
MES=NEW.MESINICIO;
WHILE (CC<NEW.CUOTAS) DO
BEGIN
    INSERT INTO cargos_en_cuotas _ctas(ORDEN,MES,NCUOTA,IMPCUOTA,VIA)
        VALUES(NEW.ORDEN,:MES,:CC+1,NEW.IMPCUOTA,NEW.VIA);
    EXECUTE PROCEDURE MES_SIGUIENTE(MES) RETURNING_VALUES MES;
    CC=CC+1;
END
END
END 


CREATE TRIGGER cargos_en_cuotas _BD0 FOR cargos_en_cuotas  ACTIVE BEFORE DELETE POSITION 0 AS
BEGIN
DELETE FROM cargos_en_cuotas_CTAS WHERE ORDEN=OLD.ORDEN;
END 



CREATE TRIGGER cargos_en_cuotas_BI FOR cargos_en_cuotas  ACTIVE BEFORE INSERT POSITION 0 AS
DECLARE VARIABLE NM INTEGER;
BEGIN
 SELECT MAX(A.orden) FROM cargos_en_cuotas  A INTO :NM;
    IF(NM IS NULL) THEN NEW.orden=1;
    ELSE NEW.orden=NM+1;
END 


