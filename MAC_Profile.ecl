/* Measure string similarity based upon ration of common trigrams to all trigrams
 * found in the UNICODE argument strings.
 * @param inFile    the dataset
 * @param id_field  the right string
 * @param src_field distinguish the first and last trigrams.
 * @return          no return value - this is an action with several outputs
 */
EXPORT MAC_Profile(inFile,id_field='',src_field='') := MACRO
	SALT_Profile.MOD_Profile(inFile,id_field,src_field).out;
ENDMACRO;
