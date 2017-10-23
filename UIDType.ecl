// This attribute is here so that you can make all of your UIDs bigger (or smaller) if you wish
// A word of caution though; the performance of many core processes are driven by the size of this UID
// So add on two bytes at your own peril!!!
// Note also that SOME routines (particularly INGEST) assume this is a numeric
// ALL assume that the ordering relations (>, >= etc) will work for it.
export UIDType := UNSIGNED6;
