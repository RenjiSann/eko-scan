import 'package:openfoodfacts/openfoodfacts.dart';

class Product {
  //Characteristics of each product
  String product;
  String brand;
  String bin;
  String origin;
  String packaging;
  String fairtrade;
  String pic;
  double score;

  //constructor
  Product(String product, String brand, String bin, String origin,
      String packaging, String fairtrade, String pic, double score) {
    this.product = product;
    this.brand = brand;
    this.bin = bin;
    this.origin = origin;
    this.packaging = packaging;
    this.fairtrade = fairtrade;
    this.pic = pic;
    this.score = score;
  }

  //TODO Gaëtan : Fix what's below bc IDK if it works

  Product.fromID(String id) {
    getOPFProduct(id, this);
  }

  Future<void> getOPFProduct(String id, Product prod) async {
    ProductResult res =
        await OpenFoodAPIClient.getProductRaw(id, OpenFoodFactsLanguage.FRENCH);
    prod.brand = res.product.brands;
  }
}
