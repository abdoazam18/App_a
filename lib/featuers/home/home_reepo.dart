import 'package:auth/config/api.dart';
import 'package:auth/featuers/home/model.dart';
import 'package:dio/dio.dart';



class HomeRepo {
  final ApiService api = ApiService();

  Future<List<product>> getProduct() async {
    final response = await api.getData("/products");
    final List jsonListData = response.data;
    
    // Using map to convert JSON list to ProductModel objects
    return jsonListData.map((e) => product.fromJson(e)).toList();
  }
}



