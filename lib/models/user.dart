enum AuthModes { signup, login }

class MenuUser {
  String? name;
  String email;
  String uid;

  MenuUser({
    this.name,
    required this.uid,
    required this.email,
  });
}
