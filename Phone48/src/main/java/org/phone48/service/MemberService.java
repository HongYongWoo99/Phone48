<<<<<<< HEAD
package org.phone48.service;

import java.util.HashMap;
import java.util.List;

import org.phone48.dto.MemberDTO;
import org.phone48.mapper.MemberMapper;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	private MemberMapper mapper;

	public MemberService(MemberMapper mapper) {
		this.mapper = mapper;
		
	}

	public int updateMember(MemberDTO dto) {
		return mapper.updateMember(dto);
	}

	public MemberDTO login(String id, String password) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("password", password);
		return mapper.login(map);
	}

	public List<MemberDTO> selectMember(String kind, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("kind", kind);
		map.put("search", search);
		return mapper.selectMember(map);
	}
}
=======
package org.phone48.service;

import java.util.HashMap;
import java.util.List;

import org.phone48.dto.MemberDTO;
import org.phone48.mapper.MemberMapper;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	private MemberMapper mapper;

	public MemberService(MemberMapper mapper) {
		this.mapper = mapper;
		
	}

	public int updateMember(MemberDTO dto) {
		return mapper.updateMember(dto);
	}

	public MemberDTO login(String id, String password) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("password", password);
		return mapper.login(map);
	}

	public List<MemberDTO> selectMember(String kind, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("kind", kind);
		map.put("search", search);
		return mapper.selectMember(map);
	}
}
>>>>>>> b3aff71c807aef5a6dc1b734ab084082381061a7
