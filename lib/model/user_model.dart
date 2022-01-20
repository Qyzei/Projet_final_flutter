class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? displayName;
  String? photoURL;

  UserModel(
      {this.uid,
      this.email,
      this.firstName,
      this.secondName,
      this.displayName,
      this.photoURL});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
    );
  }
  UserModel.fromJson(Map<String, dynamic> json) {
    displayName = json["displayName"];
    photoURL = json["photoUrl"];
    email = json["email"];
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
    };
  }

  Map<String, dynamic> toJson() {
    // object - data
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    data['photoUrl]'] = this.photoURL;

    return data;
  }
}
