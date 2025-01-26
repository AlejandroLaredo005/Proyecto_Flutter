class User {
  final String username;
  final String password;
  int totalCorrect = 0;
  int totalIncorrect = 0;
  int bestStreak = 0;

  User({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'totalCorrect': totalCorrect,
      'totalIncorrect': totalIncorrect,
      'bestStreak': bestStreak,
    };
  }
}
