import 'package:flutter/material.dart';
import 'package:flutter_thuchanh_05/page/product/productwidget.dart';
import 'page/homewidget.dart';
import 'page/category/categorywidget.dart';
import 'page/register/registerwidget.dart';
import 'page/account/accountwidget.dart';
import 'pictruedialog.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions2 = <Widget>[
    HomeWidget(),
    CategoryWidget(),
    RegisterWidget(),
    AccountWidget(),
  ];

  bool value = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // phải trả về scaffold nếu như muốn sử dụng drawer
    // để tránh lỗi bấm vào item trên drawer trả về màn hình đen
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('List Product'),
      ),
      body: Center(
        child: _widgetOptions2.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        child: ListView(
          //Ko bỏ padding từ listview
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: NetworkImage(
              //         'https://qph.cf2.quoracdn.net/main-qimg-7fb4f710e8d9fd5e26ed30c6040cf0bd-lq'),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () => {
                      showDialog(
                          context: context,
                          builder: (_) => pictureDialogProfile(context)),
                          
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://qph.cf2.quoracdn.net/main-qimg-7fb4f710e8d9fd5e26ed30c6040cf0bd-lq'),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Ngô Nhật Huy',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Expanded(
                    child: Text(
                      '20dh110616@st.huflit.edu.vn',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () async {
                Navigator.pop(context);
                const HomeWidget();
                //  Navigator.pop(context,
                //  MaterialPageRoute(builder: (BuildContext context) { return const HomeWidget(); }));
                _selectedIndex = 0;
                _onItemTapped;
                setState(() {});
              },
            ),
            ListTile(
              leading: const Icon(Icons.category_outlined),
              title: const Text('Category'),
              onTap: () {
                Navigator.pop(context);
                const CategoryWidget();

                _selectedIndex = 1;
                setState(() {});
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Register'),
              onTap: () {
                Navigator.pop(context);
                const RegisterWidget();
                _selectedIndex = 2;
                setState(() {});
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Info'),
              onTap: () {
                Navigator.pop(context);
                const AccountWidget();
                _selectedIndex = 3;
                setState(() {});
              },
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                _selectedIndex = 0;
                setState(() {});
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Register',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
