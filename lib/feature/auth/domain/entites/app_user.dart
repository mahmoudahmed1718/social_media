class AppUser {
  String uId;
  String name;
  String email;

  AppUser({required this.uId, required this.name, required this.email});

  factory AppUser.fromEntity(AppUser user) {
    return AppUser(uId: user.uId, name: user.name, email: user.email);
  }
}
