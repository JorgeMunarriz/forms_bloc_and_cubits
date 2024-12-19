import 'package:formz/formz.dart';

// Define input validation errors
enum EmailError { empty, length, regExp }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {


  static final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Email.dirty(super.value) : super.dirty();
  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == EmailError.empty) {
      return 'El email es necesario';
    }
    if (displayError == EmailError.length)
      {return 'El email debe tener más de 6 caracteres';}
    if (displayError == EmailError.regExp)
     { return 'Debe tener el formato de un email';}

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {
    
    if (value.isEmpty || value.trim().isEmpty) return EmailError.empty;
    if (value.length < 6) return EmailError.length;
    if (!emailRegExp.hasMatch(value)) {
      return EmailError.regExp;
    }
    return null;
  }
}
