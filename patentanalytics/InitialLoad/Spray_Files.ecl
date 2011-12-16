
import std, std.File, std.Str;
dirAlias := std.File.FsFilenameRecord;


STRING landing_zone := '10.239.20.76';
STRING directory := '/var/lib/HPCCSystems/dropzone/patent_data/';
STRING cluster := 'mythor';

dirList := std.File.RemoteDirectory(landing_zone, directory, '*.xml', FALSE);
// dirList := std.File.RemoteDirectory(landing_zone, directory, '*.txt', FALSE);
// dirList := std.File.RemoteDirectory(landing_zone, directory, '*.sgm', FALSE);

SprayFunction(STRING fileName, STRING internalFileName) := FUNCTION
  RETURN std.File.fSprayVariable( landing_zone , directory + filename , 16000000 ,
                     , , ,
                    cluster, internalFileName ,
                    , , ,
                    TRUE , TRUE , TRUE);
  // RETURN internalFileName;
END;


SprayResult := RECORD,MAXLENGTH(2048)
  STRING dfuWUID;
  STRING externalName;
  STRING internalName;
  INTEGER size;
END;

SprayResult doSpray(dirAlias l) := TRANSFORM
  STRING fname := l.name[1..LENGTH(l.name)-4];
  STRING dsname := '~THOR::Patents::' + fname + '::XML';
  SELF.externalName   := l.name;
  SELF.size := l.size;
  SELF.internalName := dsname;
  SELF.dfuWUID := SprayFunction(l.name, dsname);
END;

ds1 := dirList;

OUTPUT(COUNT(ds1), NAMED('Files_2_Spray'));
ds3 := NOTHOR(PROJECT(ds1, doSpray(LEFT)));

// OUTPUT(ds1, NAMED('Directory_List'));
// OUTPUT(ds3, NAMED('Spray_Log'));
OUTPUT(ds3,,'~THOR::Patents::SPRAY_Log::' + WORKUNIT);