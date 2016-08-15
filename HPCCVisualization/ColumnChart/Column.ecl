//  Irish county population record structure
r := RECORD
	STRING location;
	UNSIGNED4 males;
	UNSIGNED4 females;
	UNSIGNED4 total;
END;

//  Irish county population data
d := DATASET([{'Carlow', '27431', '27181', '54612'}, {'Dublin City', '257303', '270309', '527612'}, {'Dun Laoghaire-Rathdown', '98567', '107694', '206261'}, {'Fingal', '134488', '139503', '273991'}, {'South Dublin', '129544', '135661', '265205'}, {'Kildare', '104658', '105654', '210312'}, {'Kilkenny', '47788', '47631', '95419'}, {'Laoighis', '40587', '39972', '80559'}, {'Longford', '19649', '19351', '39000'}, {'Louth', '60763', '62134', '122897'}, {'Meath', '91910', '92225', '184135'}, {'Offaly', '38430', '38257', '76687'}, {'Westmeath', '42783', '43381', '86164'}, {'Wexford', '71909', '73411', '145320'}, {'Wicklow', '67542', '69098', '136640'}, {'Clare', '58298', '58898', '117196'}, {'Cork City', '58812', '60418', '119230'}, {'Cork County', '198658', '201144', '399802'}, {'Kerry', '72628', '72873', '145502'}, {'Limerick City', '27947', '29159', '57106'}, {'Limerick County', '67868', '66835', '134703'}, {'North Tipperary', '35340', '34982', '70322'}, {'South Tipperary', '44244', '44188', '88432'}, {'Waterford City', '22921', '23811', '46732'}, {'Waterford County', '33543', '33520', '67063'}, {'Galway City', '36514', '39015', '75529'}, {'Galway County', '88244', '86880', '175124'}, {'Leitrim', '16144', '15654', '31798'}, {'Mayo', '65420', '65218', '130638'}, {'Roscommon', '32353', '31712', '64065'}, {'Sligo', '32435', '32958', '65393'}, {'Cavan', '37013', '36170', '73183'}, {'Donegal', '80523', '80614', '161137'}, {'Monaghan', '30441', '30042', '60483'}], r);

//  Output data to named result 'ie_population'
OUTPUT(d, NAMED('ie_population'));
