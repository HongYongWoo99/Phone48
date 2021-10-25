package org.phone48.dto;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class MemberDTO {
		private String id;
		private String password;
		private String email;
		private String tell;
		private int grade;
		private String nickname;
		private int point;
		
		public MemberDTO() {
		}

		public MemberDTO(String id, String password, String email, String tell, int grade, String nickname, int point) {
			super();
			this.id = id;
			this.password = password;
			this.email = email;
			this.tell = tell;
			this.grade = grade;
			this.nickname = nickname;
			this.point = point;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getTell() {
			return tell;
		}

		public void setTell(String tell) {
			this.tell = tell;
		}

		public int getGrade() {
			return grade;
		}

		public void setGrade(int grade) {
			this.grade = grade;
		}

		public String getNickname() {
			return nickname;
		}

		public void setNickname(String nickname) {
			this.nickname = nickname;
		}

		public int getPoint() {
			return point;
		}

		public void setPoint(int point) {
			this.point = point;
		}
		
		
		
}
