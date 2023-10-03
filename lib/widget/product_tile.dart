import 'package:api_integration/model/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget{
  final product products;
  ProductTile(this.products);
  @override
  Widget build(BuildContext context) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),

                ),
                child: CachedNetworkImage(imageUrl: products.image!,
                fit: BoxFit.cover,
                ),
              ),

            ],
          ),
          SizedBox(height: 8,),
          Text(products.title!,
          maxLines: 2,
          style:TextStyle(fontWeight: FontWeight.w800,fontFamily: 'avenir'),
          overflow: TextOverflow.ellipsis,),
          SizedBox(height: 2,),
          Text(products.category,style: TextStyle(color: Colors.grey),),

          const SizedBox(height: 8),
          Text('\$${products.price}',
              style: const TextStyle(fontSize: 18, )),
          SizedBox(height: 8,),
          if(products.rating!=null)
            Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(products.rating!.rate.toString(),
                    style:  const TextStyle(color: Colors.white),),
                  const Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          SizedBox(
            height: 8,
          ),
          Text(products.description)
        ],
      ),
    ),
  );
  }

}