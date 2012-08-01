/**
 * The generic extraction record layout produced by the specific extraction routines.
 */

EXPORT Extract_Layout := MODULE

  EXPORT Entry := RECORD
    UNICODE     element;      //the element r line tag for classic EDGAR
    UNICODE     contextRef;   //the contextRef attribute or position data for classic EDGAR
    UNICODE     unitRef;      //the unitRef attribute or blank for classic EDGAR
    UNICODE     decimals;     //the decimals attribute or blank for classic EDGAR
    UNICODE     content;      //the text content of the element
  END;

  EXPORT Main := RECORD
    STRING      fileName;
    UNICODE     accessionNumber;
    UNICODE     name;
    UNICODE     filingType;
    UNICODE     filingDate;
    UNICODE     reportPeriod;
    DATASET(Entry) values;
  END;
END;
