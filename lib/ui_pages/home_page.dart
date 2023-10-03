import 'package:api_integration/controller/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';


import '../controller/product_controller.dart';
import '../widget/product_tile.dart';


class homepage extends StatelessWidget
{
  final Productcontroller productcontroller =Get.put(Productcontroller());
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.green,
       leading: Icon(Icons.arrow_back_ios),
       actions: [
         IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))
       ],
     ),
     body: Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             children: [
               Expanded(child: Text("Shop Me",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
               ),

             ],
           ),
         ),
         Expanded(
           child: Obx(
                 () {
               if (productcontroller.isloading.value) {
                 return Center(child: CircularProgressIndicator());
               } else
                 return StaggeredGridView.countBuilder(
                   crossAxisCount: 2,
                   itemCount: productcontroller.productList.length,
                   crossAxisSpacing: 16,
                   mainAxisSpacing: 16,
                   itemBuilder: (context, index) {
                     return ProductTile(productcontroller.productList[index]);
                   },
                   staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                 );
             },
           ),
         ),





       ],
     ),
   );
  }
  
}