CREATE OR REPLACE FUNCTION ANKA.FN_TCKNID_CHECK (V_TCKNID VARCHAR2)
   RETURN NUMBER
IS
   ATCNO    NUMBER;
   BTCNO    NUMBER;
   C1       NUMBER;
   C2       NUMBER;
   C3       NUMBER;
   C4       NUMBER;
   C5       NUMBER;
   C6       NUMBER;
   C7       NUMBER;
   C8       NUMBER;
   C9       NUMBER;
   C10      NUMBER;
   C11      NUMBER;
   Q1       NUMBER;
   Q2       NUMBER;
   Result   NUMBER;
BEGIN
   IF (LENGTH (V_TCKNID) = 11)
   THEN
      C1 := SUBSTR (V_TCKNID, 1, 1);
      C2 := SUBSTR (V_TCKNID, 2, 1);
      C3 := SUBSTR (V_TCKNID, 3, 1);
      C4 := SUBSTR (V_TCKNID, 4, 1);
      C5 := SUBSTR (V_TCKNID, 5, 1);
      C6 := SUBSTR (V_TCKNID, 6, 1);
      C7 := SUBSTR (V_TCKNID, 7, 1);
      C8 := SUBSTR (V_TCKNID, 8, 1);
      C9 := SUBSTR (V_TCKNID, 9, 1);
      C10 := SUBSTR (V_TCKNID, 10, 1);
      C11 := SUBSTR (V_TCKNID, 11, 1);

      IF (MOD ( ( (C1 + C3 + C5 + C7 + C9) * 7) - (C2 + C4 + C6 + C8), 10) =
             C10)
      THEN
         IF (MOD ( (C1 + C2 + C3 + C4 + C5 + C6 + C7 + C8 + C9 + C10), 10) =
                C11)
         THEN
            RESULT := 1;
         ELSE
            RESULT := 0;
         END IF;
      END IF;
   END IF;

   RETURN RESULT;
END FN_TCKNID_CHECK;
/