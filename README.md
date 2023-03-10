# Relational Database, For a Mock Client

<br>

Hello!

In this university project, I was given a mock client, who was running a fitness business, and wanted to store that businesses data, in an electronic database. After considering the nature of the data, and how it would be interacted with on a daily basis, I determined a relational database would be most appropriate, and then began building said database:


<br>
<br>
<br>


### Conceptual Model

So, first I created a conceptual model of the fitness businesses relational database, here: <br><br>
![Image Of Conceptual Model](https://github.com/peterw-github/FitnessSQL/blob/main/Conceptual%20Model/Image_ConceptualModel.JPG)



<br>
<br>
<br>


### 2 Extra Forms, Normalisation Process

Then, the client gave me some additional information. They use 2 different paper forms as part of their business, a class staffing report form, and a class attendance report form. They wanted the data from those forms, to be put into the database as well.

Thus, I took the forms, and applied the normalization process to them, to help cut down on redundancy and inconsistencies that would very likely arise eventually otherwise. The process applied to both forms, is visible here: <br>
https://github.com/peterw-github/FitnessSQL/blob/main/Logical%20Model/Normalisation%20Process.pdf


<br>
<br>
<br>


### Logical Model

The normalised forms and conceptual model were then combined, and a logical model was built (what the relational database will look like): <br><br>
![Image Of Logical Model](https://github.com/peterw-github/FitnessSQL/blob/main/Logical%20Model/Image_LogicalModel.JPG)


<br>
<br>
<br>


### Physical Model (The Actual Database)

Finally, the SQL code to build the physical model (a more detailed version of the logical model, and what the database will actually be) is here: <br>
https://github.com/peterw-github/FitnessSQL/blob/main/Logical%20Model/logicalmodel_schema.sql <br>

 


<br>
<br>
<br>

## Additional SQL Code

With the businesses relational database now fully built in Oracle SQL Developer, I began practicing SQL, on two other mock relational databases in Oracle. 

The first was medical facilities database, and I wrote queries for it, visible here: <br>
https://github.com/peterw-github/FitnessSQL/blob/main/Additional%20SQL%20Code/Mock%20Medical%20Facility/medfacility_queries.sql

The second was a library networks database, and I wrote inserts, deletes, and general alterations, visible here: <br>
https://github.com/peterw-github/FitnessSQL/tree/main/Additional%20SQL%20Code/Mock%20Library%20Network



