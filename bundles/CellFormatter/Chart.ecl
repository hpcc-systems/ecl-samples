IMPORT $.GenData AS GenData;
IMPORT CellFormatter;

states := DEDUP(SORT(GenData.Dataset_Person, state), state);

Viz_Layout := RECORD
  STRING2 state;
  INTEGER NumRows;
  DATASET(GenData.StateInitial_Layout) data__hidden;
  VARSTRING bar__javascript;
  VARSTRING pie__javascript;
  VARSTRING bubble__javascript;
end;

d3Chart := CellFormatter.JavaScript.Chart('data__hidden', 'middleinitial', 'stat');
Viz_Layout TransStates(GenData.Layout_Person L) := TRANSFORM
	SELF.NumRows := 0;
	SELF.data__hidden := [];
    SELF.bar__javascript := d3Chart.Bar;
    SELF.pie__javascript := d3Chart.Pie;
    SELF.bubble__javascript := d3Chart.Bubble;
	SELF := L;
END;

vizStates := PROJECT(states, TransStates(LEFT));
OUTPUT(vizStates, named('StatesMiddleInitial'));

Viz_Layout DeNormStates(Viz_Layout L, DATASET(GenData.StateInitial_Layout) R) := TRANSFORM
	SELF.NumRows := COUNT(R);
	SELF.data__hidden := R;
	SELF := L;
END;


ChartDataset := DENORMALIZE(vizStates, GenData.StateInitial_Rollup, LEFT.state = RIGHT.state, GROUP, DeNormStates(LEFT,ROWS(RIGHT)));
OUTPUT(ChartDataset, NAMED('Chart'));

