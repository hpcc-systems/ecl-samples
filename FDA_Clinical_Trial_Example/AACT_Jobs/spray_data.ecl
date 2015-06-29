//export spray_data := 'todo';
IMPORT STD;
IMPORT STD;
source_ip := '10.239.40.5';
//dstName := '~THOR::JDH::CLINICAL_TRIALS::AACT201403_results_outcomes_txt';
//source_path := '/var/lib/HPCCSystems/dropzone/AACT201403_results_outcomes.txt';
source_prefix := '/var/lib/HPCCSystems/dropzone/';
dest_prefix := '~THOR::JDH::AACT_CLINICAL_TRIALS::';
max_record_size := 125000;
csv_separator := '|';
csv_terminator := '\r\n';


//STD.File.SprayVariable(source_ip, source_path, max_record_size,
//                    csv_separator,  csv_terminator, '',
//                    'mythor', dstName,,,, TRUE, FALSE, TRUE, '');

dirList := STD.File.RemoteDirectory(source_ip, source_prefix, 'AACT201409*');
RECORDOF(dirList) fixName(RECORDOF(dirList) n) := TRANSFORM
  SELF.name := n.name[1..LENGTH(n.name)-4];
  SELF := n;
END;
fixedList := PROJECT(dirList, fixName(LEFT));

doSpray(STRING name) :=
    STD.File.SprayVariable(source_ip, source_prefix+name+'.txt', max_record_size,
                           csv_separator, csv_terminator, '',
                           'mythor', dest_prefix+name+'_txt',,,,
                           TRUE, FALSE, TRUE, '');

APPLY(fixedList, doSpray(name));
OUTPUT(fixedList, NAMED('Spray_List'));
