IMPORT AACT;
fName := AACT.FileName_Prefix + 'results_point_of_contact_txt';

Results_Point_Contact := RECORD
  STRING POINT_OF_CONTACT_ID;
  STRING NCT_ID;
  STRING NAME_OR_TITLE;
  STRING ORGANIZATION;
  STRING PHONE;
  STRING EMAIL_ADDRESS;
END;

ds := DATASET(fName, Results_Point_Contact, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

EXPORT File_Results_Point_Contact := ds;