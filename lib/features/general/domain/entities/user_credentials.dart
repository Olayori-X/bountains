class UserCredential {
  final String sellerid;

  const UserCredential({
    required this.sellerid,
  });

  factory UserCredential.fromJson(Map<String, dynamic> map) {
    return UserCredential(
      sellerid: map['id']!,
    );
  }
}
