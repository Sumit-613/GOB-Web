class UserModel {
  String fullName;
  String phNo;
  String email;
  String gender;
  String age;
  String photoURL;
  UserModel() {
    this.fullName = '';
    this.phNo = '';
    this.email = '';
    this.gender = '';
    this.age = '';
    this.photoURL = '';
  }
  UserModel.init(this.fullName, this.phNo, this.email, this.gender, this.age,
      this.photoURL);

  Map<String, dynamic> toJson() => {
        'fullName': this.fullName,
        'phNo': this.phNo,
        'email': this.email,
        'gender': this.gender,
        'age': this.age,
        'photoURL': this.photoURL
      };

  static UserModel fromJson(dynamic json) {
    return json != null
        ? UserModel.init(json['fullName'], json['phNo'], json['email'],
            json['gender'], json['age'], json['photoURL'])
        : null;
  }
}
