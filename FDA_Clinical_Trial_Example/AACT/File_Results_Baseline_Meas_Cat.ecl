// File, CSV is OK
IMPORT AACT;
fName := AACT.FileName_Prefix + 'results_baseline_measure_catgy_txt';
Base_Measure_Cat_S := RECORD
  STRING BASELINE_MEASURE_CATGY_ID;
  STRING BASELINE_ID;
  STRING CATEGORY_TITLE;
  STRING ARM_GROUP_ID;
  STRING BASELINE_VALUE;
  STRING SPREAD;
  STRING LOWER_LIMIT;
  STRING UPPER_LIMIT
END;
Base_Measure_Cat := RECORD
  STRING BASELINE_MEASURE_CATGY_ID;
  STRING BASELINE_ID;
  STRING CATEGORY_TITLE;
  STRING ARM_GROUP_ID;
  BOOLEAN hasValues;
  REAL8 BASELINE_VALUE;
  REAL8 SPREAD;
  REAL8 LOWER_LIMIT;
  REAL8 UPPER_LIMIT;
END;
inData := DATASET(fName, Base_Measure_Cat_S, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));
Base_Measure_Cat cvt(Base_Measure_Cat_S l) := TRANSFORM
  SELF.BASELINE_VALUE := (REAL8) l.baseline_value;
  SELF.spread := (REAL8) l.spread;
  SELF.lower_limit := (REAL8) l.lower_limit;
  SELF.upper_limit := (REAL8) l.upper_limit;
  SELF.hasValues := l.baseline_value+l.spread+l.lower_limit+l.upper_limit<>' ';
  SELF := l;
END;
rslt := PROJECT(inData, cvt(LEFT));

EXPORT File_Results_Baseline_Meas_Cat := rslt;