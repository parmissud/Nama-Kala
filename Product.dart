class Product {
  String image;
  String name;
  String category;
  String seller;
  String price;
  String color;
  String size;
  String score;
  List<String> availableColors;
  List<String> availableSize;
  String num;
  String title;

  Product(
      this.image,
      this.name,
      this.category,
      this.seller,
      this.price,
      this.availableColors,
      this.availableSize,
      this.score,
      this.num,
      this.color,
      this.size,
      this.title);

  @override
  String toString() {
    return 'product_ $image _ $name _ $category _ $seller _ $price _ $availableColors _ $availableSize _ $score _ $num _ $color _ $size _ $title _end\n';
  }
}