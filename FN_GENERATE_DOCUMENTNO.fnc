CREATE OR REPLACE FUNCTION Anka.Fn_Generate_Documentno(v_Prefix     VARCHAR, p_Issue_Date DATE DEFAULT SYSDATE)
  RETURN VARCHAR2 IS
  v_Documentno VARCHAR2(200 CHAR);
  v_Lastseqno  VARCHAR2(200 CHAR);
  v_Count      NUMBER;
  v_Seqno      NUMBER;
  v_Prefixyear NUMBER;
BEGIN
  /*
  1-      Passcard -- SCA
  2-      Çek --SYA
  3-      Komisyon (Üye Komisyon, Devir Temlik) --SDK
  4-      5$ Faturasý  --SD5
  5-      Üye Ýade  --SDI
  6-      Tedarikçi Ýade --STI
  */
  v_Prefixyear := To_Number(To_Char(p_Issue_Date, 'YYYY'));

  SELECT COUNT(1)
  INTO   v_Count
  FROM   Anka.Efatura_Documentno
  WHERE  Prefix = v_Prefix
  AND    Prefixyear = v_Prefixyear;

  IF (v_Count = 0) THEN
    --YENI YARAT
    v_Lastseqno  := '000000001';
    v_Documentno := v_Prefix || v_Prefixyear || v_Lastseqno;
  
    INSERT INTO Anka.Efatura_Documentno
      (Prefix, Prefixyear, Lastseqno, Document_No, Generated_Date)
    VALUES
      (v_Prefix, v_Prefixyear, 1, v_Documentno, SYSDATE);
    COMMIT;
  ELSE
    --SIRADAKINI AL
    SELECT Lastseqno + 1
    INTO   v_Seqno
    FROM   Anka.Efatura_Documentno
    WHERE  Prefix = v_Prefix
    AND    Prefixyear = v_Prefixyear;
  
    v_Documentno := v_Prefix || v_Prefixyear || Lpad(v_Seqno, 9, '0');
  
    UPDATE Anka.Efatura_Documentno
    SET    Lastseqno      = v_Seqno,
           Document_No    = v_Documentno,
           Generated_Date = SYSDATE
    WHERE  Prefix = v_Prefix
    AND    Prefixyear = v_Prefixyear;
  
  END IF;


  RETURN v_Documentno;
END Fn_Generate_Documentno;
/
