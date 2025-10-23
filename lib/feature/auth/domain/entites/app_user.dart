class AppUserEntity {
  String uId;
  String name;
  String email;

  AppUserEntity({required this.uId, required this.name, required this.email});

  factory AppUserEntity.fromEntity(AppUserEntity user) {
    return AppUserEntity(uId: user.uId, name: user.name, email: user.email);
  }
}
