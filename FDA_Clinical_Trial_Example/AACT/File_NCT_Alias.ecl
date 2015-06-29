IMPORT AACT;
fName := AACT.FileName_Prefix + 'nct_aliases_txt';
NCT_Alias := RECORD
  STRING NCT_ALIAS_ID;
  STRING NCT_ID;
  STRING NCT_ALIAS;
END;
ds := DATASET(fName, NCT_Alias, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

EXPORT File_NCT_Alias := ds;