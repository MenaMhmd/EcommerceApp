import 'package:flutter/material.dart';

import '../const/constant.dart';
import 'feedproducts.dart';

class AllProducts extends StatelessWidget{
  List<AllProducts>products=[];
  AllProducts({required this.products});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("All Products",style: TextStyle(fontWeight: FontWeight.bold),),
     ),
     body: GridView.builder(
       shrinkWrap: true,
       physics: NeverScrollableScrollPhysics(),
       itemCount: 12,
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2,
           crossAxisSpacing: 0.0,
           mainAxisSpacing: 0.0,
           childAspectRatio: .6),
       itemBuilder: (context, index) {
         return Text("");
       },
     ),
   );
  }
}