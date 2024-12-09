class CategoryAndQuantityUnitPayload {
  final String sellerid;

  const CategoryAndQuantityUnitPayload({
    required this.sellerid,
  });

  Map<String, dynamic> toJson() {
    return {
      "sellerid": sellerid,
    };
  }

  factory CategoryAndQuantityUnitPayload.fromJson(Map<String, dynamic> map) {
    return CategoryAndQuantityUnitPayload(
      sellerid: map["userid"] ?? "",
    );
  }
}

class CategoryAndQuantityUnitResponse {
  final List<dynamic> categories;
  final List<dynamic> quantityunit;

  const CategoryAndQuantityUnitResponse({
    required this.categories,
    required this.quantityunit,
  });

  Map<String, List> toJson() {
    return {
      "categories": categories,
      "quantityunit": quantityunit,
    };
  }

  factory CategoryAndQuantityUnitResponse.fromJson(Map<String, dynamic> map) {
    return CategoryAndQuantityUnitResponse(
      categories: map['categories'] ?? "",
      quantityunit: map['quantityunit'] ?? "",
    );
  }
}
