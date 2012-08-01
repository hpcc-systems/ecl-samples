IMPORT std;
IMPORT std.Uni;
/**
 * A file of files from the file system, and some simple filters to get
 * subsets of the files (XBRL and OLD EDGAR SGML.
 * NB.  Data is really 8859-1 for Old EDGAR and UTF-8 for new.  Using
 * 8859-1 works for this extract, but better conversion should be done
 * for a real application
 */
EXPORT Raw_Input_Files := MODULE
  SHARED maxWindow	:= 4000;
  // Record produced from spray with NOSLPIT, and a prefix of filename,filesize.
  EXPORT Layout_Raw := RECORD
    STRING              fileName;
    DATA                text;		// unsigned 4 little endian is hidden by data type
  END;

  EXPORT Layout := RECORD
    STRING    fileName;
    UNICODE   text;
  END;
  isXML(DATA6 prfx) := TRANSFER('<?xml ', DATA6) = prfx;
  // FIXME: really should use the value of the encoding attribute for XML data.
  STRING encoding(DATA6 prfx) := IF(isXML(prfx), 'UTF-8', '8859-1');
  Layout cvt(Layout_Raw lr) := TRANSFORM
    SELF.fileName := lr.fileName;
    SELF.text     := TOUNICODE(lr.text, encoding(lr.text[1..6]));
  END;
  Convert(STRING fileName) := PROJECT(DATASET(fileName, Layout_Raw, FLAT), cvt(LEFT));
  EXPORT Files(STRING fileName) := Convert(fileName);

  EXPORT Files_XBRL(STRING fileName, BOOLEAN stripDocTypeDeclare=TRUE) := FUNCTION
    UNSIGNED4 Test(UNICODE text) := std.Uni.Find(text[1..maxWindow+6], u'<xbrl ', 1);

    d1 := Files(fileName)(Test(text) > 0);

    Layout stripDeclare(Layout lr) := TRANSFORM
      pos := Test(lr.text);
      SELF.text := IF(pos>0, lr.text[pos..], SKIP);
      SELF := lr;
    END;
    d2 := PROJECT(Files(fileName), stripDeclare(LEFT));

    RETURN IF(stripDocTypeDeclare, d2, d1);
  END;

  EXPORT Files_Old_EDGAR(String fileName, BOOLEAN stripWrapperText=TRUE) := FUNCTION
    UNSIGNED4 Test(UNICODE text) := std.Uni.Find(text[1..maxWindow+15],u'<SEC-DOCUMENT>',1);

    d1 := Files(fileName)(Test(text)>0);

    Layout stripWrapper(Layout lr) := TRANSFORM
      startPos:= Test(lr.text);
      backPos := MAX(1, LENGTH(lr.text) - maxWindow);
      stopPos := std.Uni.Find(lr.text[backPos..], u'</SEC-DOCUMENT>', 1);
      SELF.text := IF(startPos>0 AND stopPos>0, lr.text[startPos..backPos+stopPos+14], SKIP);
      SELF := lr;
    END;
    d2 := PROJECT(Files(fileName), stripWrapper(LEFT));

    RETURN IF(stripWrapperText, d2, d1);
  END;
END;