import 'dart:io';
import 'product.dart';

class StoreManager {
  List<Product> productsList = [];

////////////////////////////////////////////////////////////////////////////////
  void addProduct() {
    String name;
    int price;
    int quantity;

    while(true){
      print('Enter product name (0 to cancel):');
      name = stdin.readLineSync() ?? '';
      if (name == '0') return;
      if (name == '') {
        print(
            "you should enter an string for the name of this new product(null not allowed). try again ...");
        continue;
      }
      break;
    }

    while(true){
      print('Enter product price (0 to cancel):');
      price = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
      if (price == 0) return;
      if (price == -1) {
        print(
            "Invalid input! you should enter an integer number for price. try again ...");
        continue;
      }
      break;
    }

    while(true){
      print('Enter product quantity (0 to cancel):');
      quantity = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
      if (quantity == 0) return;
      if (quantity == -1) {
        print(
            "Invalid input! you should enter an integer number for quantity. try again ...");
        continue;
      }
      break;
    }

    Product newProduct = Product(
      productName: name,
      productCount: quantity,
      productPrice: price,
    );
    productsList.add(newProduct);

    print('Product ${newProduct.productName} successfully added.');
  }
////////////////////////////////////////////////////////////////////////////////

  void displayProducts() {
    for (int i = 0; i < productsList.length; i++) {
      print(
        '${i + 1}- ${productsList[i].productName} '
        'Price: ${productsList[i].productPrice} '
        'Quantity: ${productsList[i].productCount}',
      );
    }
  }
////////////////////////////////////////////////////////////////////////////////

  void deleteProduct() {
    int index;
    while(true){
      displayProducts();
      print('Enter the product number to delete (0 to cancel):');
      index = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
      if (index == 0) return;
      if (index == -1){
        print("Invalid input! try again ...");
        continue;
      }
      if (index > productsList.length || index < 0) {
        print("input index not in rage of products indexes! try again...");
        continue;
      }
      break;
    }

    String deletedProductName = productsList[index - 1].productName;
    productsList.removeAt(index - 1);
    print('Product $deletedProductName successfully deleted.');
  }
////////////////////////////////////////////////////////////////////////////////
  void editProduct() {
    int index;
    String newName;
    int newPrice;
    int newQuantity;

    while(true){
      displayProducts();
      print('Enter the product number to edit (0 to cancel):');
      index = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
      if (index == 0) return;
      if (index == -1){
        print("Invalid input! try again ...");
        continue;
      }
      if (index > productsList.length || index < 0) {
        print("input product number not in available rage! try again...");
        continue;
      }
      break;
    }

    while(true){
      print('Enter new product name (0 to cancel):');
      newName = stdin.readLineSync() ?? '';
      if (newName == '0') return;
      if (newName == '') {
        print(
            "you should enter an string for the name of this new product(null not allowed). try again ...");
        continue;
      }
      break;
    }

    while(true){
      print('Enter new product price (0 to cancel):');
      newPrice = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
      if (newPrice == 0) return;
      if (newPrice == -1) {
        print(
            "Invalid input! you should enter an integer number for price. try again ...");
        continue;
      }
      break;
    }

    while(true){
      print('Enter new product quantity (0 to cancel):');
      newQuantity = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
      if (newQuantity == 0) return;
      if (newQuantity == -1) {
        print(
            "Invalid input! you should enter an integer number for quantity. try again ...");
        continue;
      }
      break;
    }

    productsList[index - 1].productName = newName;
    productsList[index - 1].productPrice = newPrice;
    productsList[index - 1].productCount = newQuantity;

    print('Product successfully updated.');
  }
////////////////////////////////////////////////////////////////////////////////

  void displayLowStockProducts() {
    List<Product> lowStockProducts =
        productsList.where((product) => product.productCount < 5).toList();
    for (int i = 0; i < lowStockProducts.length; i++) {
      print(
          '${i + 1}- ${lowStockProducts[i].productName} Price: ${lowStockProducts[i].productPrice} Quantity: ${lowStockProducts[i].productCount}');
    }
  }
////////////////////////////////////////////////////////////////////////////////
}
