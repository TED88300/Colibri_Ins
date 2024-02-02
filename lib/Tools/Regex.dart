import 'RegexCode.dart';

class Regex {
  static RegexCode checkEmail(String email) {
    RegExp regExp = new RegExp(
        r"^[0-9a-z._-]+@{1}[0-9a-z.-]{2,}[.]{1}[a-z]{2,5}$");
    if (email.isEmpty) {
      return (RegexCode.EMPTY);
    } else if (!regExp.hasMatch(email)) {
      return (RegexCode.INVALID_FORMAT);
    }
    return (RegexCode.VALID);
  }

  static bool validateEmail(String email) {
    RegexCode code = checkEmail(email);
print("validateEmail ${code}");
    switch (code) {
      case RegexCode.INVALID_FORMAT:
        return false;
      case RegexCode.VALID:
      case RegexCode.EMPTY:
        return true;
    }
    return true;

  }


  static RegexCode checkPhone(String phone) {
    if (phone.isEmpty) {
      return (RegexCode.EMPTY);
    } else if (phone.length < 9) {
      return (RegexCode.INVALID_FORMAT);
    }
    return (RegexCode.VALID);
  }


  static bool validatePhonevp(String phone) {
    RegexCode code = checkPhone(phone);

    print("phone $phone ${code.toString()}");

    switch (code) {
      case RegexCode.EMPTY:
      case RegexCode.INVALID_FORMAT:
      return false;
        break;
      case RegexCode.VALID:
        return true;
        break;
    }
    return true;
  }


}