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

For more information about the bundle commands in the ecl command line tool, see the `HPCC Client Tools Manual`_

For more information about how to create an Ecl bundle, see the [https://github.com/hpcc-systems/HPCC-Platform/blob/master/ecl/ecl-bundle/BUNDLES.rst](ECL Bundle Writer's Guide).
