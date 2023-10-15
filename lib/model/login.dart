class LoginModel {
  final String email;
  final String password;
  LoginModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() => 'LoginModel(email: $email, password: $password)';
}

class ResponseModel {
  ResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.token,
  });

  final int? status;
  final String? message;
  final ResponseData? data;
  final String? token;

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : ResponseData.fromJson(json["data"]),
      token: json["token"],
    );
  }
}

class ResponseData {
  ResponseData({
    required this.imageUrl,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profession,
    required this.following,
    required this.followers,
    required this.savedPost,
    required this.posts,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? imageUrl;
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profession;
  final List<dynamic> following;
  final List<dynamic> followers;
  final List<dynamic> savedPost;
  final List<dynamic> posts;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      imageUrl: json["imageUrl"],
      id: json["_id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      profession: json["profession"],
      following: json["following"] == null
          ? []
          : List<dynamic>.from(json["following"]!.map((x) => x)),
      followers: json["followers"] == null
          ? []
          : List<dynamic>.from(json["followers"]!.map((x) => x)),
      savedPost: json["saved_post"] == null
          ? []
          : List<dynamic>.from(json["saved_post"]!.map((x) => x)),
      posts: json["posts"] == null
          ? []
          : List<dynamic>.from(json["posts"]!.map((x) => x)),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}
