IMPORT AACT;
fName := AACT.FileName_Prefix + 'reported_events_txt';
fixed := AACT.Fix_Broken_Records(fName, 8);

PATTERN pipe_char := '\174';
PATTERN content1  := PATTERN('[\000-\173]');
PATTERN content2  := PATTERN('[\175-\377]');
PATTERN content   := (content1 OR content2)+;
PATTERN reid_content := content;
PATTERN nid_content := content;
PATTERN event_type_content := content;
PATTERN time_frame_content := content;
PATTERN desc_content := content;
PATTERN freq_threshold_content := content;
PATTERN default_vocab_content := content;
PATTERN default_assessment_content := content;
RULE Reported_Event_Rule := reid_content pipe_char
                        OPT(nid_content) pipe_char
                        OPT(event_type_content) pipe_char
                        OPT(time_frame_content) pipe_char
                        OPT(desc_content) pipe_char
                        OPT(freq_threshold_content) pipe_char
                        OPT(default_vocab_content) pipe_char
                        OPT(default_assessment_content);

Reported_Event := RECORD
  STRING REPORTED_EVENT_ID      := MATCHTEXT(reid_content);
  STRING NCT_ID                 := MATCHTEXT(nid_content);
  STRING EVENT_TYPE             := MATCHTEXT(event_type_content);
  STRING TIME_FRAME             := MATCHTEXT(time_frame_content);
  STRING DESCRIPTION            := MATCHTEXT(desc_content);
  STRING FREQUENCY_THRESHOLD    := MATCHTEXT(freq_threshold_content);
  STRING DEFAULT_VOCAB          := MATCHTEXT(default_vocab_content);
  STRING DEFAULT_ASSESSMENT     := MATCHTEXT(default_assessment_content);
END;
ds := PARSE(fixed, line, Reported_Event_Rule, Reported_Event, MAX)
    : PERSIST('PERSIST::JDH::AACT::REPORTED_EVENTS');

EXPORT File_Reported_Events := ds;