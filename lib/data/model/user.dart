class User{
  String? fullName;
  String? email;
  String? gender;
  String? favorite;

  //contructor named
  User({
    this.fullName,
    this.email,
    this.gender,
    this.favorite,
  });

  User.fromJson(Map<String, dynamic> json){
    fullName = json['fullName'];
    email = json['email'];
    gender = json['gender'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String,dynamic>{};
    data['fullName'] = fullName;
    data['email'] = email;
    data['gender'] = gender;
    data['favorite'] = favorite;
    return data;
  }
}