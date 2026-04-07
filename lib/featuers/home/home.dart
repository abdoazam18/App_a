import 'package:auth/featuers/home/home_reepo.dart';
import 'package:auth/featuers/home/model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}




class _HomeScreenState extends State<HomeScreen> {
  // 1. تعريف الـ Repository والـ List
  final repo = HomeRepo();
  List<product> products = [];
  bool isLoading = true; //  

  Future<void> fetchProducts() async {
    try {
      final result = await repo.getProduct();
      setState(() {
        products = result;
        isLoading = false; //  
      });
    } catch (e) {
      print("Error fetching products: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 240, 240), 
      appBar: AppBar(
        title: const Text("Products"), 
        backgroundColor: const Color.fromARGB(255, 192, 182, 182),
      ),
      body: isLoading 
        ? const Center(child: CircularProgressIndicator(color: Colors.white)) 
        : ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Card(
                color: const Color.fromARGB(255, 105, 97, 97), //  
                margin: const EdgeInsets.all(8),
                child: ListTile(

                  onTap: (){

                    Nav
                  },


                  title: Text(
                    "${products[index].title}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "${products[index].category?.name}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: Text(
                    "\$${products[index].price}",
                    style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold),
                  ),
                  leading: ClipRRect( // إضافة حواف دائرية للصورة عشان التصميم
                    borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                      "${products[index].images!.isNotEmpty ? products[index].images?.first : ""}",
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
    );
  }
}