import 'package:ecommerce/core/helper/validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validation Test', () {
    group('validate phone number', () {
      test('Phone number should be >= 10 or <= 15 digits', () {
        const String invalidNumber = "0931716";

        expect(AppValidation.isValidPhoneNumber(invalidNumber), false);
      });
      test('Phone number should be valid', () {
        const String phoneNumber = "085218361021";

        expect(AppValidation.isValidPhoneNumber(phoneNumber), true);
      });
    });

    group('validate email', () {
      test('Email should be incorrect', () {
        const String invalidEmail = "izzul@invalid";

        expect(AppValidation.isValidEmail(invalidEmail), false);
      });
      test('Email should be correct', () {
        const String email = "izzuldev@gmail.com";

        expect(AppValidation.isValidEmail(email), true);
      });
    });

    group('validate email or phone number', () {
      test('Email or Phone number should be incorrect', () {
        const String invalidEmail = "izzul@invalid";
        const String invalidPhoneNumber = "0931716";

        expect(
          AppValidation.validateEmailOrPhoneNumber(invalidEmail),
          'Please enter a valid email or phone number',
        );
        expect(
          AppValidation.validateEmailOrPhoneNumber(invalidPhoneNumber),
          'Please enter a valid email or phone number',
        );
      });
      test('Email or Phone number should be correct', () {
        const String email = "izzuldev@gmail.com";
        const String phoneNumber = "085218361021";

        expect(AppValidation.validateEmailOrPhoneNumber(email), null);
        expect(AppValidation.validateEmailOrPhoneNumber(phoneNumber), null);
      });
    });

    group('validate password', () {
      test('Password should be incorrect', () {
        const String invalidLength = "efbwfb";
        const String noSymbol = "efbwfbejalnf";

        expect(
          AppValidation.validatePassword(invalidLength),
          'Password must be at least 7 characters long',
        );
        expect(
          AppValidation.validatePassword(noSymbol),
          'Password must contain at least one symbol',
        );
      });
      test('Password should be correct', () {
        const String password = "oefjqHsh&sgq232";

        expect(AppValidation.validatePassword(password), null);
      });
    });
  });
}
