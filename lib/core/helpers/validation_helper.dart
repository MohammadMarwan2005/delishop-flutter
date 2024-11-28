
extension ValidationHelper on String {
  bool isEmailValid() {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(this);
  }
  bool isPasswordValid() {
    return hasUpperCase() && hasLowerCase() && hasNumber() && hasSpecialCharacter() && hasMinLength();
    // return RegExp(
    //     r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
    //     .hasMatch(this);
  }


  bool isPhoneNumberValid() {
    return RegExp(r'[0-9]+$').hasMatch(this);
  }

  bool hasLowerCase() {
    return RegExp(r'^(?=.*[a-z])').hasMatch(this);
  }

  bool hasUpperCase() {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(this);
  }

  bool hasNumber() {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(this);
  }

  bool hasSpecialCharacter() {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(this);
  }

  bool hasMinLength() {
    return RegExp(r'^(?=.{8,})').hasMatch(this);
  }
}