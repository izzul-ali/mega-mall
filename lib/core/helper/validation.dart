class AppValidation {
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$",
    );
    return emailRegex.hasMatch(email);
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    final phoneRegex = RegExp(r"^[0-9]{10,15}$"); // Allows 10 to 15 digits
    return phoneRegex.hasMatch(phoneNumber);
  }

  static String? validateEmailOrPhoneNumber(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter your email or phone number';
    } else if (isValidEmail(input) || isValidPhoneNumber(input)) {
      return null; // Input is valid
    } else {
      return 'Please enter a valid email or phone number';
    }
  }

  static String? validatePassword(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter your password';
    } else if (input.length < 7) {
      return 'Password must be at least 7 characters long';
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(input)) {
      return 'Password must contain at least one symbol';
    }
    return null; // Password is valid
  }
}
