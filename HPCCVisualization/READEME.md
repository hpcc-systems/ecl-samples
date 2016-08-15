##HPCC Visualization Framework##

The goal of these samples is demonstrate how to embed common visualizations from the HPCC Visualization Framework inside a workunit and/or a Roxie query.

Each sample has a common file structure:
* ecl:  The ecl that creates the data to be visualized
* manifest:  The manifest tells the eclcc compiler about the required resources to include in the workunit
* res/index.html:  The resource payload that renders the data in the visualization

###Submitting a sample###

These samples are designed to be run in "local" repository mode (if you don't know what that is, then you are running in local!).  To submit any of the samples, you will need to:
1.  Ensure the ecl-samples folder is visible within your ECL IDE workspace.  To do this, select "preferences/compiler" and add the folder to the list of "ECL Folders".
2.  Navigate to the sample folder you want to submit, open the ecl file and submit it to your HPCC Platform instance.
3.  Once execution is complete, open the workunit details page in ECL Watch and click on the "Resources" tab, your visualization should now be visible.

###Background notes###

These samples are reliant on the "embedded resources" capability of the eclcc compiler, ESP and ECL Watch.  This feature allows the developer to include _any_ resources within an ECL archive and subsequently within the workunit itself.  The developer simply specifyies which resources to include in a special "manifest" file (which must have the same name as the ecl file, but with the "manifest" extension).  ECL Watch will display these embedded resources in the "Resources" tab on the workunit details page.  Should ECL Watch spot a resource called "index.html" it will automatically open that resource and render it by default.

