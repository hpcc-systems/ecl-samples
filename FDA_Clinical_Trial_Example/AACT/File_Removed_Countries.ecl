IMPORT AACT;
fName := AACT.FileName_Prefix + 'removed_countries_txt';
Removed_Countries := RECORD
  STRING REMOVED_COUNTRIES_ID;
  STRING COUNTRY;
  STRING NCT_ID;
END;
ds := DATASET(fName, Removed_Countries, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

export File_Removed_Countries := ds;