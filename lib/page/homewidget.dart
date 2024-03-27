import 'package:flutter/material.dart';
import '../conf/const.dart';
import 'package:flutter_thuchanh_05/page/product/productbody.dart';
import '../../conf/const.dart';
import 'package:flutter_thuchanh_05/data/model/productmodel.dart';
import '../../data/provider/productprodiver.dart';
import 'package:flutter_thuchanh_05/data/model/categorymodel.dart';
import 'package:flutter_thuchanh_05/pictruedialog.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<Product> lstPro = [];
  Future<String> loadProList() async {
    lstPro = await ReadData().loadData() as List<Product>;
    return '';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadProList();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return const Center(
  //     child: Text(
  //       "Home page",
  //       style: titleStyle,
  //     ),
  //   );
  // }

  // show danh sách dạng grid view (ko chia theo danh m)
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadProList(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Center(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: GridView.builder(
                      itemCount: lstPro.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8),
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                            onTap: () => {
                                  showDialog(
                                      context: context,
                                      builder: (_) =>
                                          pictureDialogProduct(lstPro[index])),
                                },
                            child: itemProViewByCate(lstPro[index]));
                      })))
            ],
          ),
        );
      },
    );
  }

}
