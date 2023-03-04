// Validate Email
String? emailValidation(value) {
  if (value == null ||
      value.isEmpty ||
      !value.contains('.com') ||
      !value.contains('@')) {
    return 'Please enter a valid email address.';
  }
  return null;
}

// Password Validation
String? passwordValidation(value) {
  if (value == null || value.isEmpty || value.toString().length < 5) {
    return 'Please enter a valid password.';
  }
  return null;
}
