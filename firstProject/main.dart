import 'dart:io';
import 'store_manager.dart';

void main() {
  StoreManager storeManager = StoreManager();

  while (true) {
    print('\n1- Add Product\n2- Display Products\n3- Delete Product\n'
        '4- Edit Product\n5- Display Low Stock Products\n6- Exit');

    print('Enter your choice:');

    int choice = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

    switch (choice) {
      case 1:
        storeManager.addProduct();
        break;
      case 2:
        storeManager.displayProducts();
        break;
      case 3:
        storeManager.deleteProduct();
        break;
      case 4:
        storeManager.editProduct();
        break;
      case 5:
        storeManager.displayLowStockProducts();
        break;
      case 6:
        return;
      default:
        print('Invalid choice! Please enter a number between 1 and 6.');
    }
  }
}