import 'package:flutter/material.dart';
import '../../data/model/productmodel.dart';
import '../../conf/const.dart';



Widget PictureDialogProduct(Product productModel){
  return Dialog(
    child: Image.asset( url_product_img + productModel.img!,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.image),)
  );
}