IMPORT $.GenData;
IMPORT CellFormatter;

CityRecord := RECORD
  STRING2 state;
  QSTRING5 zip;
  STRING1 label;
  INTEGER stat;
END;

CityRecord toCity(GenData.StateZipCityInitial_Layout L) := TRANSFORM
  SELF.label := L.middleinitial;
  SELF.stat := L.stat;
  SELF := L;
END;

cities := PROJECT(GenData.StateZipCityInitial_Rollup, toCity(LEFT));

ZipRecord := RECORD
  STRING2 state;
  QSTRING5 label;
  DATASET(CityRecord) kids;
END;

ZipRecord DeNormCities(GenData.Layout_Person L, DATASET(CityRecord) R2) := transform
    SELF.state := L.state;
    SELF.label := L.zip;
    SELF.kids := CHOOSEN(R2, 6);
    SELF := L;
END;

zips := DEDUP(SORT(GenData.Dataset_Person, state, zip), state, zip);
zipCities := DENORMALIZE(zips, cities, LEFT.zip = RIGHT.zip, GROUP, DeNormCities(LEFT,ROWS(RIGHT)));
//zipCities;

StateRecord := RECORD
  STRING2 label;
  DATASET(ZipRecord) kids;
END;

StateRecord DeNormZips(GenData.Layout_Person L, DATASET(ZipRecord) R3) := TRANSFORM
  SELF.label := L.state;
  SELF.kids := CHOOSEN(R3, 5);
  SELF := L;
END;

states := DEDUP(SORT(GenData.Dataset_Person, state), state);
stateZips := DENORMALIZE(states, zipCities, LEFT.state = RIGHT.state, GROUP, DeNormZips(LEFT,ROWS(RIGHT)));
//stateZips;

CountryRecord := RECORD
  STRING22 label;
  DATASET(StateRecord) kids;
END;

Viz_Layout := RECORD
  CountryRecord data__hidden;
  VARSTRING ClusterDendrogram__javascript;
  VARSTRING CirclePacking__javascript;
  VARSTRING ReingoldTilfordTree__javascript;
  VARSTRING SunburstPartition__javascript;
END;

d3Tree := CellFormatter.JavaScript.Tree('data__hidden', 'label', 'kids', 'stat');
OUTPUT(CHOOSEN(stateZips, 4), NAMED('StateTree'));
OUTPUT(DATASET([{{'USA', CHOOSEN(stateZips, 4)}, d3Tree.ClusterDendrogram, d3Tree.CirclePacking, d3Tree.ReingoldTilfordTree, d3Tree.SunburstPartition}], Viz_Layout), NAMED('Tree'));
