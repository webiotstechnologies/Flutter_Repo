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

   // Otp Validation
  otpValidation (value) {
    if (value!.isEmpty) {
      return (appFonts.pleaseEnterValue);
    }
    if (!regex.hasMatch(value)) {
      return (appFonts.pleaseEnterValid);
    }
    return null;
  }

  // Username Validation
  usernameValidation (username) {
    if (username.isEmpty) {
      return appFonts.pleaseEnterUsername;
    }
    return null;
  }

  // Password Validation
  passValidation (password) {
    if (password.isEmpty) {
      return appFonts.pleaseEnterPassword;
    }
    if (password.length < 8) {
      return appFonts.passwordMustBe;
    }
    return null;
  }

  // Number Validation
  numberValidation (number) {
    if (number.isEmpty) {
      return appFonts.pleaseEnterNumber;
    }
    if (number.length < 10) {
      return appFonts.enterValidNumber;
    }
    return null;
  }

}
