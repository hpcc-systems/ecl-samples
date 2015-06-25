IMPORT AACT;
fName := AACT.FileName_Prefix + 'links_txt';
Links := RECORD
  STRING LINK_ID;
  STRING NCT_ID;
  STRING URL;
  STRING DESCRIPTION;
END;
ds := DATASET(fName, Links, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

EXPORT File_Links := ds;
