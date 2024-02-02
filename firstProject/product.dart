class Product {
  String productName;
  int productCount;
  int productPrice;

  Product({
    required this.productName,
    required this.productCount,
    required this.productPrice,
  });

  @override
  String toString() {
    return "product name :$productName";
  }
}
