import 'package:flutter/cupertino.dart';
import 'package:openfoodfacts/model/Ingredient.dart';
import 'package:openfoodfacts/model/ProductResult.dart';

class Produit {
  //Characteristics of each product
  String name;
  String brand;
  String barcode;
  //String bin;
  String origin;
  //List<Ingredient> packaging;
  List<String> packaging;
  //String fairtrade;
  String picUrl;
  NetworkImage picture;
  double score;

  //constructor
  Produit.fromProductResult(ProductResult prodRes) {
    this.barcode = prodRes.barcode;
    this.name = prodRes.product.productName;
    this.brand = prodRes.product.brandsTags[0];
    this.origin = prodRes.product.countriesTags[0];
    this.picUrl = prodRes.product.imgSmallUrl;
    this.picture = NetworkImage(this.picUrl);
    this.packaging = prodRes.product.packagingQuantity;
    this.score = prodRes.product.ecoscoreScore;
  }

  /*Produit(
    String product,
    String brand,
    String bin,
    String origin,
    List<Ingredient> packaging,
    String fairtrade,
    String pic,
    int score,
  ) {
    this.name = product;
    this.brand = brand;
    //this.bin = bin;
    //this.packaging = packaging;
    this.origin = origin;
    //this.fairtrade = fairtrade;
    this.picUrl = pic;
    this.picture = NetworkImage(picUrl);
    //this.score = score;
  }
*/
}
