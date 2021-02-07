

class Product{

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
      String packaging, String fairtrade, String pic, double score){
    this.product = product;
    this.brand = brand;
    this.bin = bin;
    this.origin = origin;
    this.packaging = packaging;
    this.fairtrade = fairtrade;
    this.pic = pic;
    this.score = score;
  }

}