extension StringExtensions on String {
  String capitalizeFirst() {
    if (isEmpty) return '';
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String capitalizeEach() {
    return split(' ').map((String word) => word.capitalizeFirst()).join(' ');
  }

  bool get isValidEmail {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    return emailRegex.hasMatch(this);
  }

  bool get isValidPassword {
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );

    return passwordRegex.hasMatch(this);
  }

  DateTime? get convertToDateTime {
    try {
      final List<String> parts = split('/');

      if (parts.length != 3) return null;

      final int day = int.parse(parts[0]);
      final int month = int.parse(parts[1]);
      final int year = int.parse(parts[2]);

      return DateTime(year, month, day);
    } catch (e) {
      return null;
    }
  }

  String get firstPartEmail {
    int atIndex = indexOf('@');
    return substring(0, atIndex);
  }
}
