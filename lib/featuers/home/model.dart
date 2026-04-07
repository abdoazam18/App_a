import 'package:auth/featuers/home/modelcatogry.dart';



class product {
  int? id;
  String? title;
  String? slug;
  int? price;
  String? description;
  Category? category;
  List<String>? images;

  product(
      {this.id,
      this.title,
      this.slug,
      this.price,
      this.description,
      this.category,
      this.images});

  product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['price'] = this.price;
    data['description'] = this.description;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['images'] = this.images;
    return data;
  }
}
