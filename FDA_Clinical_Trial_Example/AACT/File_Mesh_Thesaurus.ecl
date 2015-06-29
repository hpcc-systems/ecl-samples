IMPORT AACT;
fName := AACT.FileName_Prefix + 'mesh_thesaurus_txt';
Mesh_Thesaurus := RECORD
  STRING MESH_SEQID;
  STRING MESH_ID;
  STRING MESH_TERM;
END;
ds := DATASET(fName, Mesh_Thesaurus, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

EXPORT File_Mesh_Thesaurus := ds;