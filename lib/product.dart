import 'package:openfoodfacts/model/Ingredient.dart';

class Produit {
  //Characteristics of each product
  String product;
  String brand;
  String bin;
  String origin;
  List<Ingredient> packaging;
  String fairtrade;
  String pic;
  int score;

  //constructor
  Produit(
    String product,
    String brand,
    String bin,
    String origin,
    List<Ingredient> packaging,
    String fairtrade,
    String pic,
    int score,
  ) {
    this.product = product;
    this.brand = brand;
    this.bin = bin;
    this.packaging = packaging;
    this.origin = origin;
    this.fairtrade = fairtrade;
    this.pic = pic;
    this.score = score;
  }
}
