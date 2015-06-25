IMPORT AACT;
fname := AACT.FileName_Prefix + 'sponsors_txt';
Sponsors := RECORD
  STRING SPONSOR_ID;
  STRING NCT_ID;
  STRING SPONSOR_TYPE;
  STRING AGENCY;
  STRING AGENCY_CLASS;
END;
ds := DATASET(fName, Sponsors, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

EXPORT File_Sponsors := ds;