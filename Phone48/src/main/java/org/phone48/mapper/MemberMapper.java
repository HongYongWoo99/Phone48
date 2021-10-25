package org.phone48.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.phone48.dto.MemberDTO;

@Mapper
public interface MemberMapper {

	MemberDTO login(HashMap<String, Object> map); 

	int updateMember(MemberDTO dto);

	List<MemberDTO> selectMember(HashMap<String, Object> map);
}
