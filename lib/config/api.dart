import 'package:dio/dio.dart';






class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://api.escuelajs.co/api/v1",
    ),
  );


  Future getData(String endpoint) async {
    try {
      return await _dio.get(endpoint);
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}