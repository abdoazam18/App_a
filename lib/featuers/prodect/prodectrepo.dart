import 'package:auth/config/api.dart';
import 'package:auth/core/assets/endpoint.dart';
import 'package:auth/featuers/home/model.dart';

class ProductDetailsRepo {
  final ApiService api = ApiService();


  Future<product> getProductByID(int id) async {
final response = await api.getData("${Endpoint.endpoint}/$id");  

  return product.fromJson(response.data);
  }
}