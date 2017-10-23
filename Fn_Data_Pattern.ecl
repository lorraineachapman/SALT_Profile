EXPORT Fn_Data_Pattern(StrType s) := 
#if (UnicodeCfg.UseUnicode)
    unicodelib.unicodesubstituteout(
    unicodelib.unicodesubstituteout(
		  unicodelib.unicodesubstituteout(s,U'ABCDEFGHIJKLMNOPQRSTUVWXYZ',U'A'),
			U'abcdefghijklmnopqrstuvwxyz',U'a'),
			U'0123456789',U'9');
#else
    stringlib.stringsubstituteout(
    stringlib.stringsubstituteout(
		  stringlib.stringsubstituteout(s,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','A'),
			'abcdefghijklmnopqrstuvwxyz','a'),
			'0123456789','9');
#end
;
