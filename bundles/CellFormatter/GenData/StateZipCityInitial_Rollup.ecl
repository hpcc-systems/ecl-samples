IMPORT $;

$.StateZipCityInitial_Layout PrimeStats($.Layout_Person L) := TRANSFORM
  SELF.stat := 1;
  SELF := L;
END;

PeopleStatsDataset := project($.Dataset_Person, PrimeStats(LEFT));
SortedTable := SORT(PeopleStatsDataset, RECORD);

$.StateZipCityInitial_Layout calcStat($.StateZipCityInitial_Layout L, $.StateZipCityInitial_Layout R) := TRANSFORM
  SELF.stat := L.stat + 1;
  SELF := L;
END;

EXPORT StateZipCityInitial_Rollup := ROLLUP(SortedTable, calcStat(LEFT,RIGHT), state, zip, city, middleinitial); 
