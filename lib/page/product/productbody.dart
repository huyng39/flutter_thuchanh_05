import 'package:flutter/material.dart';
import '../../data/model/productmodel.dart';
import '../../conf/const.dart';
import 'package:intl/intl.dart';


//create sub widget
Widget itemProView(Product productModel) {
  String linkImgPro = url_product_img + productModel.img!;
  return Container(
    margin: const EdgeInsets.only(left: 5, right: 5),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1.5,
          blurRadius: 3,
          offset: const Offset(0, 0.5),
        )
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          url_product_img + productModel.img!,
          height: 100,
          width: 100,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.image),
        ),
        Text(
          productModel.name ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          NumberFormat('###,###.### ₫').format(productModel.price),
          style: const TextStyle(
            fontSize: 15, color: Colors.red,fontWeight: FontWeight.bold),
            selectionColor: const Color.fromARGB(255, 0, 0, 1),
        ),
        Text(
          productModel.des!,
          style: const TextStyle(fontSize: 12, color: Colors.blue),
        ),
      ],
    ),
  );
}

Widget itemProViewByCate(Product productModel) {
  String cate = productModel.catId.toString();
  String cateName = "";
  if(cate == "1")
  {
    cateName = "iPhone";
  }
  else if (cate == "2")
  {
    cateName = "Samsung";
  }
  else if (cate == "3")
  {
    cateName = "Oppo";
  }
  else if (cate == "4")
  {
    cateName = "Xiaomi";
  }
  else if (cate == "5")
  {
    cateName = "Nokia";
  }
  else if (cate == "6")
  {
    cateName = "Realme";
  }
  else if (cate == "7")
  {
    cateName = "Vivo";
  }
  else if (cate == "8")
  {
    cateName = "Masstel";
  }

  String linkImgPro = url_product_img + productModel.img!;
  return Container(
    margin: const EdgeInsets.only(left: 5, right: 5),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1.5,
          blurRadius: 3,
          offset: const Offset(0, 0.5),
        )
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          url_product_img + productModel.img!,
          height: 100,
          width: 100,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.image),
        ),
        Text(
          productModel.name ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          NumberFormat('###,###.### ₫').format(productModel.price),
          style: const TextStyle(
            fontSize: 15, color: Colors.red,fontWeight: FontWeight.bold),
            selectionColor: const Color.fromARGB(255, 0, 0, 1),
        ),
        Text(
          productModel.des!,
          style: const TextStyle(fontSize: 12, color: Colors.blue),
        ),
        Text(
          'Danh mục: ${cateName}' ,
          style: const TextStyle(fontSize: 12, color: Colors.blue),
        )
      ],
    ),
  );
}
