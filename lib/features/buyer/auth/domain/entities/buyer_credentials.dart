class BuyerCredential {
  final String sellerid;

  const BuyerCredential({
    required this.sellerid,
  });

  factory BuyerCredential.fromJson(Map<String, dynamic> map) {
    return BuyerCredential(
      sellerid: map['id']!,
    );
  }
}
