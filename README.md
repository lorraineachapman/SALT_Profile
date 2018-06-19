# SALT Profile Bundle

This folder contains the SALT Profile Bundle code and documentation on usage.

The SALT Profile bundle analyzes a structured HPCC dataset, reporting a variety of information about each discrete field that aids in "getting to know" one's data.  Once installed, the easiest way to call it is:
````
IMPORT SALT_Profile;
SALT_Profile.MAC_Profile(my_dataset);
````

If your data already includes a numeric cluster identifier and a source identifier, you may pass the optional `id_field` and `src_field` parameters to add some  cluster and source analysis:
````
IMPORT SALT_Profile;
SALT_Profile.MAC_Profile(my_dataset,my_cluster,my_source);
````

For greater control over which OUTPUTs to compute and generate, you may call MOD_Profile directly:
````
IMPORT SALT_Profile;
mp := SALT_Profile.MOD_Profile(my_dataset);
OUTPUT(mp.invSummary);
````

## Installation

For example:

    ecl bundle install https://github.com/leonarta/SALT_Profile.git

For more information about the bundle commands in the ecl command line tool, see the `HPCC Client Tools Manual`.

For more information about how to create an Ecl bundle, see the ECL Bundle Writer's Guide (https://github.com/hpcc-systems/HPCC-Platform/blob/master/ecl/ecl-bundle/BUNDLES.rst).

### What this bundle is for

Data profiling is a process which provides important type, statistical, and pattern information on the data fields and concepts and their contents in an input data file.
 
This information is important in analyzing the content and shape (patterns) of the data in your data files and helps you make important decisions concerning filtering, de-duping, and linking of records, and to provide information on the changing characteristics of data over time.
 
SALT data profiling provides breakdowns of all the characters, string lengths, field cardinality (the number of unique values a field contains), top 300 data values, and word counts along with relative percentages in every field or concept.
 
In addition, SALT calculates and displays the top 300 data patterns to help analyze the shape of your data.
 
Patterns are represented by replacing upper case alpha characters with A, lower case alpha characters with a, digits with 9, special characters are unchanged. Figure 4 displays sample partial data field profile output.
 
The SALT data profiling capability also provides useful summary statistical data such as the number of records in the input file, and the percentage of non-blank data, maximum field length, average field length, minimum value, maximum value, mean, and variance for every field.
 
This summary information provides a quick view which can be compared with previous versions of a data file to identify anomalies or to verify anticipated changes in the content of a data file.
