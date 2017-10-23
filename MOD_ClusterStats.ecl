EXPORT MOD_ClusterStats := MODULE
EXPORT IDCount(InFile,IdField) := FUNCTIONMACRO
	IMPORT SALT_Profile;
  r0 := RECORD
    InFile.IdField;
    SALT_Profile.UIDType InCluster := COUNT(GROUP);
  end;
  tots := TABLE(InFile,r0,IdField,MERGE);
  RETURN COUNT(tots);
  ENDMACRO;
EXPORT Counts(InFile,IdField) := FUNCTIONMACRO
	IMPORT SALT_Profile;
  r0 := RECORD
    InFile.IdField;
    SALT_Profile.UIDType InCluster := COUNT(GROUP);
  end;
  tots := TABLE(InFile,r0,IdField,MERGE);
  r1 := RECORD
    tots.InCluster;
    SALT_Profile.UIDType NumberOfClusters := COUNT(group);
  END;
  RETURN SORT(TABLE(tots,r1,InCluster,FEW),InCluster);
  ENDMACRO;
EXPORT Sources(InFile,IdField,SrcField) := FUNCTIONMACRO
	IMPORT SALT_Profile;
  r0 := RECORD
    InFile.IdField;
		InFile.SrcField;
    SALT_Profile.UIDType InCluster := COUNT(GROUP);
  END;
  tots := TABLE(InFile,r0,IdField,SrcField,MERGE);
	toti := TABLE(tots,{IdField,UNSIGNED Srcs := COUNT(GROUP)},IdField,MERGE);
	jtt := TABLE(Tots,{SrcField,all_src_cnt := COUNT(GROUP)},SrcField,FEW);
	r1 := RECORD
	  SALT_Profile.StrType left_src;
	  SALT_Profile.StrType right_src;
		END;
	tids := COUNT(toti);
	tids2 := COUNT(toti(Srcs>1));
	j := JOIN(tots,tots,LEFT.IdField=RIGHT.IdField AND LEFT.SrcField<>RIGHT.SrcField,TRANSFORM(R1,SELF.left_src := LEFT.SrcField,SELF.right_src := RIGHT.SrcField),LEFT OUTER);
	jt := TABLE(j,{left_src,right_src,pair_cnt := COUNT(GROUP)},left_src,right_src,FEW);
	r2 := RECORD
	  jt.left_src;
	  jt.right_src;
		jt.pair_cnt;
		UNSIGNED left_src_cnt;
		UNSIGNED right_src_cnt := 0;
	END;
	r2 add_l(jt le,jtt ri) := TRANSFORM
	  SELF.left_src_cnt := ri.all_src_cnt;
	  SELF := le;
	END;
	j1 := JOIN(jt,jtt,LEFT.left_src=RIGHT.SrcField,add_l(LEFT,RIGHT),LOOKUP);
	r2 add_r(j1 le,jtt ri) := TRANSFORM
	  SELF.right_src_cnt := ri.all_src_cnt;
	  SELF := le;
	END;
	j2 := JOIN(j1,jtt,LEFT.right_src=RIGHT.SrcField,add_r(LEFT,RIGHT),LOOKUP,LEFT OUTER);
	linked_src_rec := RECORD
	  SALT_Profile.StrType Src;
		UNSIGNED2      CoOccur_Pcnt;
		UNSIGNED       CoOccur;
		UNSIGNED       ExpectedCoOccur;
	END;
	src_base := RECORD,MAXLENGTH(32000)
	  src := jtt.SrcField;
		total_count := jtt.all_src_cnt;
		occur_pcnt := jtt.all_src_cnt * 100 / tids;
		DATASET(linked_src_rec) sources := DATASET([],linked_src_rec);
	END;
	base := TABLE(jtt,src_base);
	src_base add_child(base le,j2 ri) := TRANSFORM
	  SELF.sources := le.sources+ROW({ri.right_src,ri.pair_cnt*100/le.total_count,ri.pair_cnt,le.total_count*ri.right_src_cnt/tids2},linked_src_rec);
	  SELF := le;
	END;
	dn := DENORMALIZE(base,j2,LEFT.src = RIGHT.left_src,add_child(LEFT,RIGHT));
  RETURN SORT(dn,src,-total_count);
  ENDMACRO;
  END;
