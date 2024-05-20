class UserModel {
  String? uid;
  String? userName;
  String? emailAddress;
  String? password;

  UserModel(
      {this.uid,
        this.userName,
        this.emailAddress,
        this.password});

  //receive data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      userName: map['userName'],
      emailAddress: map['emailAddress'],
      password: map['password'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'userName': userName,
      'emailAddress': emailAddress,
      'password': password,
    };
  }
}
