import 'package:auth/featuers/home/model.dart';
import 'package:auth/featuers/prodect/prodectrepo.dart';

import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final int productId;
  const ProductDetails({super.key, required this.productId});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}


class _ProductDetailsState extends State<ProductDetails> {
  final repo = ProductDetailsRepo();
  product? product1;
  bool isLoading = true;

  @override
  void initState() {
    fetchProduct();
    super.initState();
  }

  Future<void> fetchProduct() async {
    try {
      final result = await repo.getProductByID(widget.productId);
      setState(() {
        product1 = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // يفضل إضافة print(e) هنا لتتبع الأخطاء في الـ Console
    } finally {
      setState(() {
        // الـ setState هنا ستعمل في كل الأحوال
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: isLoading 
        ? const Center(child: CircularProgressIndicator()) 
        : Center(
            child: Text(product1?.title ?? "No Product Found"),
          ),
    );
  }
}





