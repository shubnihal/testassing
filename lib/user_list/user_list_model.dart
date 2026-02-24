class UserProfile {
  final String profileImage;
  final String fullName;
  final String email;

  UserProfile({
    required this.profileImage,
    required this.fullName,
    required this.email,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      profileImage: json['image'],
      fullName: "${json['firstName']} ${json['lastName']}",
      email: json['email'],
    );
  }
}
