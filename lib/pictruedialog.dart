import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../data/model/productmodel.dart';
import '../../conf/const.dart';


String linkAvatar = 'https://qph.cf2.quoracdn.net/main-qimg-7fb4f710e8d9fd5e26ed30c6040cf0bd-lq';

// zoom hình profile trong drawer
Widget pictureDialogProfile(BuildContext context) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0), // Adjust the value as needed
    ),
    child: Image.network(
      linkAvatar,
      fit: BoxFit.cover,
    ),
  );
}

// zoom hình sản phẩm
Widget pictureDialogProduct(Product productModel){
  return Dialog(
    child: Image.asset( url_product_img + productModel.img!,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.image),)
  );
}
