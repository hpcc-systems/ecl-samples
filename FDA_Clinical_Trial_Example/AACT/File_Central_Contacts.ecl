IMPORT AACT;
fName := AACT.FileName_Prefix + 'central_contacts_txt';
Central_Contacts := RECORD
  STRING CENTRAL_CONTACT_ID;
  STRING NCT_ID;
  STRING CONTACT_TYPE;
  STRING NAME_DEGREE;
  STRING PHONE;
  STRING PHONE_EXT;
  STRING EMAIL;
END;
ds := DATASET(fName, Central_Contacts, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

EXPORT File_Central_Contacts := ds;