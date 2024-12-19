import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, length, regExp }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {

  static final passwordRegExp = RegExp(
      r'^(?=\S*\d)(?=\S*[A-Z])(?=\S*[a-z])\S{8,16}$',
    );
  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty(super.value) : super.dirty();
  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == PasswordError.empty) {
      return 'La contraseña es necesaria';
    }
    if (displayError == PasswordError.length) {
      return 'La contraseña debe tener entre 8 y 16 caracteres';
    }
    if (displayError == PasswordError.regExp) {
      return 'La contraseña debe tener al menos un dígito, una minúscula y una mayúscula.';
    }
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PasswordError? validator(String value) {
   
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (value.length < 8 || value.length > 16) return PasswordError.length;
    if (!passwordRegExp.hasMatch(value)) {
      return PasswordError.regExp;
    }

    return null;
  }
}
