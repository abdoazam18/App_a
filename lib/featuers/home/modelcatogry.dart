
class Category {
  int? id;
  String? name;
  String? image;
  String? slug;

  Category({this.id, this.name, this.image, this.slug});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['slug'] = this.slug;
    return data;
  }
}