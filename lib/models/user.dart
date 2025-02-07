class User {
  final String username;
  final String password;
  int totalCorrect;
  int totalIncorrect;
  int bestStreak;

  User({
    required this.username,
    required this.password,
    this.totalCorrect = 0,
    this.totalIncorrect = 0,
    this.bestStreak = 0,
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

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'],
      password: map['password'],
      totalCorrect: map['totalCorrect'] ?? 0,
      totalIncorrect: map['totalIncorrect'] ?? 0,
      bestStreak: map['bestStreak'] ?? 0,
    );
  }
}
