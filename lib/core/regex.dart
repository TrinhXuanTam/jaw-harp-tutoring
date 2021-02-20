class RegExMatchers {
  static final RegExp email = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  /// Password must contain:
  ///   - 6 to 20 characters
  ///   - Must contain at least one digit
  ///   - Must contain at least one letter (case insensitive)
  ///   - Can contain the following characters: ! @ # $ % & *
  static final RegExp password = RegExp(r"^((?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%&*]{6,20})$");
}