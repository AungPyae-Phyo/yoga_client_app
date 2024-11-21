extension StringExtension on String {
  /// Capitalizes the first letter of each word in the string.
  String capitalize() {
    return split(" ").map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(" ");
  }
}
