import 'Product.dart';

class User {
  String name;
  String pass;
  String familyName;
  String phoneNumber;
  String email;
  List<Product> byedProducts;
  List<Product> soldProducts;
  List<Product> basket;
  List<Product> favorites;

  User(this.name, this.pass, this.familyName, this.phoneNumber, this.email,
      this.byedProducts, this.soldProducts, this.basket, this.favorites);

  @override
  String toString() {
    return 'user_ $name _ $familyName _ $pass _ $phoneNumber _ $email _ $byedProducts _ $soldProducts _ $basket _ $favorites _end\n';
  }
}
