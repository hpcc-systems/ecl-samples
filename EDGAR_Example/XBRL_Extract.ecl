IMPORT EDGAR_Example;
IMPORT EDGAR_Example.Extract_Layout;

// This is done as a module for symmetry with Classic EDGAR Extraction
EXPORT XBRL_Extract := MODULE
  ds(STRING fileName) := EDGAR_Example.Raw_Input_Files.Files_XBRL(fileName, TRUE);   // strip prefix

  Extract_Layout.Entry getEntry(UNICODE element) := TRANSFORM
    SELF.element    := element;
    SELF.contextRef := XMLUNICODE('@contextRef');
    SELF.unitRef    := XMLUNICODE('@unitRef');
    SELF.decimals   := XMLUNICODE('@decimals');
    SELF.content    := XMLUNICODE('');
  END;

  Extract_Layout.Main cvt(RECORDOF(ds) lr) := TRANSFORM
    SELF.fileName         := lr.fileName;
    SELF.filingType       := XMLUNICODE('dei:DocumentType');
    SELF.reportPeriod     := XMLUNICODE('dei:DocumentPeriodEndDate');
    SELF.name             := XMLUNICODE('dei:EntityRegistrantName');
    SELF.filingDate       := 'N/A';    // only classic EDGAR
    SELF.accessionNumber  := 'N/A';    // only classic EDGAR
    SELF.values           := XMLPROJECT('us-gaap:NetIncomeLoss', getEntry('us-gaap:NetIncomeLoss'))
                           + XMLPROJECT('us-gaap:SalesRevenueNet', getEntry('us-gaap:SalesRevenueNet'));
  END;

  EXPORT File(STRING fileName) := PARSE(ds(fileName), text, cvt(LEFT), XML('xbrl'));

END;