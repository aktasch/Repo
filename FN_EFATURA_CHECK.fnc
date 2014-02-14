CREATE OR REPLACE FUNCTION Anka.Fn_Efatura_Check(v_Firmid NUMBER)
  RETURN NUMBER IS
  RESULT  NUMBER;
  v_Count NUMBER;
BEGIN


  SELECT COUNT(1)
  INTO   v_Count
  FROM   Anka.Firm_Company
  WHERE  Status = 0
  AND    Firm_Id = v_Firmid;

  IF (v_Count <> 0) THEN
    SELECT Efatura_Status
    INTO   RESULT
    FROM   Anka.Firm_Company
    WHERE  Status = 0
    AND    Firm_Id = v_Firmid;
  ELSE
    RESULT := 0;
  END IF;

  RETURN RESULT;

  END Fn_Efatura_Check;
/
