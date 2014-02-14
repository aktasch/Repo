CREATE OR REPLACE FUNCTION Anka.Fn_Efatura_Status(v_Identifier VARCHAR2)
  RETURN NUMBER IS
  RESULT  NUMBER;
  v_Count NUMBER;
BEGIN

  SELECT COUNT(1)
  INTO   v_Count
  FROM   Anka.Efatura_Liables
  WHERE  Identifier = v_Identifier;

  IF (v_Count <> 0) THEN
    SELECT Enabled
    INTO   RESULT
    FROM   Anka.Efatura_Liables
    WHERE  Identifier = v_Identifier;
  ELSE
    RESULT := 0;
  END IF;

  RETURN RESULT;
END Fn_Efatura_Status;
/
