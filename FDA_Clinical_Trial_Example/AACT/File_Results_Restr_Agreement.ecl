IMPORT AACT;
fName := AACT.FileName_Prefix + 'results_restriction_agreement_txt';
fixed := AACT.Fix_Broken_Records(fName, 4);

PATTERN pipe_char := '\174';
PATTERN content1  := PATTERN('[\000-\173]');
PATTERN content2  := PATTERN('[\175-\377]');
PATTERN content   := (content1 OR content2)+;
PATTERN aid_content := content;
PATTERN nid_content := content;
PATTERN pi_employee_content := content;
PATTERN restr_agreement_content := content;
RULE Rule_Rest_Agreement := aid_content pipe_char
                          OPT(nid_content) pipe_char
                          OPT(pi_employee_content) pipe_char
                          OPT(restr_agreement_content);


Rest_Agreement := RECORD
  STRING AGREEMENT_ID             := MATCHTEXT(aid_content);
  STRING NCT_ID                   := MATCHTEXT(nid_content);
  STRING PI_EMPLOYEE              := MATCHTEXT(pi_employee_content);
  STRING RESTRICTIVE_AGREEMENT    := MATCHTEXT(restr_agreement_content);
END;
ds := PARSE(fixed, line, Rule_Rest_Agreement, Rest_Agreement, MAX)
    : PERSIST('PERSIST::JDH::AACT::RESULTS_RESTR_AGREEMENT');

EXPORT File_Results_Restr_Agreement := ds;
