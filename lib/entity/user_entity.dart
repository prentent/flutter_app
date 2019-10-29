class UserEntity {
	String code;
	UserData data;
	String info;

	UserEntity({this.code, this.data, this.info});

	UserEntity.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
		info = json['info'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['info'] = this.info;
		return data;
	}
}

class UserData {
	String accessToken;
	String studentName;
	String feeFlag;
	String expiresDate;
	String currTermCode;
	String studentId;
	String photoUrl;
	String currXq;
	int planId;

	UserData({this.accessToken, this.studentName, this.feeFlag, this.expiresDate, this.currTermCode, this.studentId, this.photoUrl, this.currXq, this.planId});

	UserData.fromJson(Map<String, dynamic> json) {
		accessToken = json['access_token'];
		studentName = json['student_name'];
		feeFlag = json['fee_flag'];
		expiresDate = json['expires_date'];
		currTermCode = json['curr_term_code'];
		studentId = json['student_id'];
		photoUrl = json['photo_url'];
		currXq = json['curr_xq'];
		planId = json['plan_id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['access_token'] = this.accessToken;
		data['student_name'] = this.studentName;
		data['fee_flag'] = this.feeFlag;
		data['expires_date'] = this.expiresDate;
		data['curr_term_code'] = this.currTermCode;
		data['student_id'] = this.studentId;
		data['photo_url'] = this.photoUrl;
		data['curr_xq'] = this.currXq;
		data['plan_id'] = this.planId;
		return data;
	}
}
