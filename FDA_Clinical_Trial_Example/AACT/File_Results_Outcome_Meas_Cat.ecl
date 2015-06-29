IMPORT AACT;
fName := AACT.FileName_Prefix + 'results_outcome_measure_ctgy_txt';
Outcome_Meas_Cat_S := RECORD
  STRING OUTCOME_MEASURE_CATGY_ID;
  STRING OUTCOME_MEASURE_ID;
  STRING CATEGORY_TITLE;
  STRING ARM_GROUP_ID;
  STRING OUTCOME_VALUE;
  STRING SPREAD;
  STRING LOWER_LIMIT;
  STRING UPPER_LIMIT;
END;
Outcome_Meas_Cat := RECORD
  STRING OUTCOME_MEASURE_CATGY_ID;
  STRING OUTCOME_MEASURE_ID;
  STRING CATEGORY_TITLE;
  STRING ARM_GROUP_ID;
  BOOLEAN hasValues;
  REAL8 OUTCOME_VALUE;
  REAL8 SPREAD;
  REAL8 LOWER_LIMIT;
  REAL8 UPPER_LIMIT;
END;
inData := DATASET(fName, Outcome_Meas_Cat_S, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

Outcome_Meas_Cat cvt(Outcome_Meas_Cat_S l) := TRANSFORM
  SELF.outcome_value := (REAL8) l.outcome_value;
  SELF.spread := (REAL8) l.spread;
  SELF.lower_limit := (REAL8) l.lower_limit;
  SELF.upper_limit := (REAL8) l.upper_limit;
  SELF.hasValues := l.outcome_value+l.spread+l.upper_limit+l.lower_limit<>'';
  SELF := l
END;
rslt := PROJECT(inData, cvt(LEFT));

EXPORT File_Results_Outcome_Meas_Cat := rslt;