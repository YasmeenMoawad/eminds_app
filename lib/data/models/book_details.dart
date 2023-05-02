class Book {
  Book({
    required this.id,
    required this.title,
    required this.pageCount,
    required this.coverImg,
    required this.shortDesc,
    required this.longDesc,
    required this.authors,
    required this.categories,
    this.isFavorite = false,
    this.isInCart = false,
  });

  int id;

  String title;

  int pageCount;

  String coverImg;

  String shortDesc;

  String longDesc;

  List<String> authors;

  List<String> categories;

  bool isFavorite;

  bool isInCart;
}
