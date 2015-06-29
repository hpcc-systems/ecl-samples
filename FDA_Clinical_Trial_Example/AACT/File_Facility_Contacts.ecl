IMPORT AACT;
fname := AACT.FileName_Prefix + 'facility_contacts_txt';
Facility_Contacts := RECORD
  STRING FACILITY_CONTACT_ID;
  STRING FACILITY_ID;
  STRING NCT_ID;
  STRING CONTACT_TYPE;
  STRING NAME_DEGREE;
  STRING PHONE;
  STRING PHONE_EXT;
  STRING EMAIL;
END;
ds := DATASET(fName, Facility_Contacts, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

EXPORT File_Facility_Contacts := ds;