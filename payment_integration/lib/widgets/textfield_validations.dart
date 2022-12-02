import '../config.dart';

class Validation {
  RegExp digitRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  RegExp regex = RegExp("^([0-9]{4}|[0-9]{6})");
  // Email Validation
  emailValidation(email) {
    if (email.isEmpty) {
      return appFonts.pleaseEnterEmail;
    } else if (!digitRegex.hasMatch(email)) {
      return appFonts.pleaseEnterValid;
    }
    return null;
  }

  // Name Validation
  nameValidation (username) {
    if (username.isEmpty) {
      return appFonts.pleaseEnterUsername;
    }
    return null;
  }

  // Amount Validation
  amountValidation (amount) {
    if (amount.isEmpty) {
      return appFonts.pleaseEnterAmount;
    }
    return null;
  }

}
