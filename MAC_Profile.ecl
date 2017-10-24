/** Measure string similarity based upon ration of common trigrams to all trigrams
 *  found in the UNICODE argument strings.
 *  @param inFile    the dataset
 *  @param id_field  Field containing numeric Cluster ID
 *  @param src_field Field containing Source ID 
 *  @return          no return value - this is an action with several outputs
 */
EXPORT MAC_Profile(inFile,id_field='',src_field='') := MACRO
  SALT_Profile.MOD_Profile(inFile,id_field,src_field).out;
ENDMACRO;
