IMPORT AACT;
fName := AACT.FileName_Prefix + 'location_countries_txt';
Location_Countries := RECORD
  STRING LOCATION_COUNTRIES_ID;
  STRING COUNTRY;
  STRING NCT_ID;
END;
ds := DATASET(fName, Location_Countries, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

EXPORT File_Location_Countries := ds;