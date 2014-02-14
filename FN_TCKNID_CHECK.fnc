CREATE OR REPLACE FUNCTION Anka.Fn_Tcknid_Check(v_Tcknid VARCHAR2)
  RETURN NUMBER IS
  Atcno  NUMBER;
  Btcno  NUMBER;
  C1     NUMBER;
  C2     NUMBER;
  C3     NUMBER;
  C4     NUMBER;
  C5     NUMBER;
  C6     NUMBER;
  C7     NUMBER;
  C8     NUMBER;
  C9     NUMBER;
  C10    NUMBER;
  C11    NUMBER;
  Q1     NUMBER;
  Q2     NUMBER;
  RESULT NUMBER;
BEGIN
  IF (Length(v_Tcknid) = 11) THEN
    C1  := Substr(v_Tcknid, 1, 1);
    C2  := Substr(v_Tcknid, 2, 1);
    C3  := Substr(v_Tcknid, 3, 1);
    C4  := Substr(v_Tcknid, 4, 1);
    C5  := Substr(v_Tcknid, 5, 1);
    C6  := Substr(v_Tcknid, 6, 1);
    C7  := Substr(v_Tcknid, 7, 1);
    C8  := Substr(v_Tcknid, 8, 1);
    C9  := Substr(v_Tcknid, 9, 1);
    C10 := Substr(v_Tcknid, 10, 1);
    C11 := Substr(v_Tcknid, 11, 1);
  
    IF (MOD(((C1 + C3 + C5 + C7 + C9) * 7) - (C2 + C4 + C6 + C8), 10) = C10) THEN
      IF (MOD((C1 + C2 + C3 + C4 + C5 + C6 + C7 + C8 + C9 + C10), 10) = C11) THEN
        RESULT := 1;
      ELSE
        RESULT := 0;
      END IF;
    ELSE
        RESULT := 0;
    END IF;
  ELSE
    RESULT := 0;
  END IF;

  RETURN RESULT;
END Fn_Tcknid_Check;
/
