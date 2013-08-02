IMPORT $;

dp := DATASET('~progguide::exampledata::people', $.Layout_Person, THOR);

EXPORT Dataset_Person := dp(MiddleInitial != '');