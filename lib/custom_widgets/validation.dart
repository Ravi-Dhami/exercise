class FieldValidator {
  static String? validateNumber(value, context) {
    if (value!.isEmpty) {
      return 'Enter Mobile Number';
    } else if (value.length < 10) {
      return "Enter At List 10 Charecter";
    } else if (value.length > 10) {
      return "Enter only 10 Charecter";
    }
    return null;
  }

  static String? validateName(value, context) {
    if (value!.isEmpty) {
      return 'Enter Student Name';
    } else if (value.length >= 50) {
      return 'Enter only 50 character';
    }
    return null;
  }

  static String? validateDob(value, context) {
    if (value!.isEmpty) {
      return 'Select Dob';
    }
    return null;
  }

  static String? validateAdmissionDate(value, context) {
    if (value!.isEmpty) {
      return 'Select Admission Date';
    }
    return null;
  }

  static String? validateAddress(value, context) {
    if (value!.isEmpty) {
      return 'Enter Address';
    }
    return null;
  }
}
