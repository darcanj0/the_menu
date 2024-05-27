enum AuthModes { signup, login }

class MenuUser {
  String name;
  String email;
  String uid;

  MenuUser({
    required this.name,
    required this.uid,
    required this.email,
  });
}
