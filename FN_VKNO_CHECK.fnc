CREATE OR REPLACE FUNCTION Anka.Fn_Vkno_Check(v_Vknid VARCHAR2)
  RETURN NUMBER IS
  RESULT       NUMBER;
  v_Last_Digit NUMBER;
  v_1          NUMBER;
  v_2          NUMBER;
  v_3          NUMBER;
  v_4          NUMBER;
  v_5          NUMBER;
  v_6          NUMBER;
  v_7          NUMBER;
  v_8          NUMBER;
  v_9          NUMBER;
  v_11         NUMBER;
  v_22         NUMBER;
  v_33         NUMBER;
  v_44         NUMBER;
  v_55         NUMBER;
  v_66         NUMBER;
  v_77         NUMBER;
  v_88         NUMBER;
  v_99         NUMBER;
  Toplam       NUMBER;
BEGIN
  IF (Length(v_Vknid) = 10) THEN
    v_1          := MOD((Substr(v_Vknid, 1, 1) + 9), 10);
    v_2          := MOD((Substr(v_Vknid, 2, 1) + 8), 10);
    v_3          := MOD((Substr(v_Vknid, 3, 1) + 7), 10);
    v_4          := MOD((Substr(v_Vknid, 4, 1) + 6), 10);
    v_5          := MOD((Substr(v_Vknid, 5, 1) + 5), 10);
    v_6          := MOD((Substr(v_Vknid, 6, 1) + 4), 10);
    v_7          := MOD((Substr(v_Vknid, 7, 1) + 3), 10);
    v_8          := MOD((Substr(v_Vknid, 8, 1) + 2), 10);
    v_9          := MOD((Substr(v_Vknid, 9, 1) + 1), 10);
    v_Last_Digit := Substr(v_Vknid, 10, 1);
  
    v_11 := MOD((v_1 * 512), 9);
    v_22 := MOD((v_2 * 256), 9);
    v_33 := MOD((v_3 * 128), 9);
    v_44 := MOD((v_4 * 64), 9);
    v_55 := MOD((v_5 * 32), 9);
    v_66 := MOD((v_6 * 16), 9);
    v_77 := MOD((v_7 * 8), 9);
    v_88 := MOD((v_8 * 4), 9);
    v_99 := MOD((v_9 * 2), 9);
  
    IF (v_1 <> 0 AND v_11 = 0) THEN
      v_11 := 9;
    END IF;
    IF (v_2 <> 0 AND v_22 = 0) THEN
      v_22 := 9;
    END IF;
    IF (v_3 <> 0 AND v_33 = 0) THEN
      v_33 := 9;
    END IF;
    IF (v_4 <> 0 AND v_44 = 0) THEN
      v_44 := 9;
    END IF;
    IF (v_5 <> 0 AND v_55 = 0) THEN
      v_55 := 9;
    END IF;
    IF (v_6 <> 0 AND v_66 = 0) THEN
      v_66 := 9;
    END IF;
    IF (v_7 <> 0 AND v_77 = 0) THEN
      v_77 := 9;
    END IF;
    IF (v_8 <> 0 AND v_88 = 0) THEN
      v_88 := 9;
    END IF;
    IF (v_9 <> 0 AND v_99 = 0) THEN
      v_99 := 9;
    END IF;
  
    Toplam := v_11 + v_22 + v_33 + v_44 + v_55 + v_66 + v_77 + v_88 + v_99;
  
    IF (MOD(Toplam, 10) = 0) THEN
      Toplam := 0;
    ELSE
      Toplam := (10 - MOD(Toplam, 10));
    END IF;
  
    IF (Toplam = v_Last_Digit) THEN
      RESULT := 1; -- DOGRU
    ELSE
      RESULT := 0; -- YANLIS
    END IF;
  ELSE
    RESULT := 0;
  END IF;

  RETURN RESULT;
END Fn_Vkno_Check;
/
