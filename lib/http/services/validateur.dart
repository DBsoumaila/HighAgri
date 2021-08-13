class Validator {
  static String? validateField({required String value}) {
    if (value.isEmpty) {
      return 'Ce champs ne peux pas etre nul';
    }

    return null;
  }

  static String? validateUserID({required String uid}) {
    if (uid.isEmpty) {
      return 'ID utilisqteur ne pas etre nul';
    } else if (uid.length <= 3) {
      return 'Tapez plus de 3 caractères pour le ID utilisateur';
    }

    return null;
  }
}
