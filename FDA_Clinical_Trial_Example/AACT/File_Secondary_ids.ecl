IMPORT AACT;
fName := AACT.FileName_Prefix + 'secondary_ids_txt';
Secondary_ids := RECORD
  STRING SEC_ID;
  STRING NCT_ID;
  STRING SECONDARY_ID;
END;
ds := DATASET(fName, Secondary_ids, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

EXPORT File_Secondary_ids := ds;