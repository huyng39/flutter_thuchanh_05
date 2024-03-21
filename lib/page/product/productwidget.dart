import 'package:flutter/material.dart';
import 'package:flutter_thuchanh_05/page/product/productbody.dart';
import '../../conf/const.dart';
import 'package:flutter_thuchanh_05/data/model/productmodel.dart';
import '../../data/provider/productprodiver.dart';
import 'package:flutter_thuchanh_05/data/model/categorymodel.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  List<Product> lstPro = [];
  Future<String> loadProList() async {
    lstPro = await ReadData().loadDataByCat(catId) as List<Product>;
    return '';
  }

  @override
  void initState() {
    super.initState();
    loadProList(widget.objCat.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product list ${widget.objCat.name.toString().toUpperCase()}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: loadProList(widget.objCat.id!),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return GridView.builder(
              itemCount: lstPro.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 4,
                mainAxisSpacing: 8,)
                itemBuilder: (context, index){
                  return itemProView(lstProduct[index]);
                });
          }),
              ),
    );
  }
    
  }

  
  // @override
  // Widget build(BuildContext context) {
  //   return const Padding(
  //     padding: EdgeInsets.all(16.0),
  //     chi;ld
  //   );
  // }
}
