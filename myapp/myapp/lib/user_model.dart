// ignore_for_file: non_constant_identifier_names

class UserModel {
  String fname;
  String lname;
  String gender;
  String height;
  String weight;
  String medicine;
  String ch_disease;
  String uid;
  String bdate;
  String first_aid_inf;
  String phoneNumber;

  UserModel({
    required this.fname,
    required this.lname,
    required this.gender,
    required this.height,
    required this.weight,
    required this.medicine,
    required this.ch_disease,
    required this.uid,
    required this.first_aid_inf,
    required this.bdate,
    required this.phoneNumber,
  });

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fname: map['fname'] ?? '',
      lname: map['lname'] ?? '',
      gender: map['gender'] ?? '',
      first_aid_inf: map['first_aid_inf'] ?? '',
      height: map['height'] ?? '',
      weight: map['weight'] ?? '',
      medicine: map['medicine'] ?? '',
      uid: map['uid'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      ch_disease: map['ch_disease'] ?? '',
      bdate: map['bdate'] ?? '',
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "fname": fname,
      "lname": lname,
      "gender": gender,
      "uid": uid,
      "first_aid_inf": first_aid_inf,
      "height": height,
      "weight": weight,
      "phoneNumber": phoneNumber,
      "medicine": medicine,
      "ch_disease": ch_disease,
      "bdate": bdate,
    };
  }
}