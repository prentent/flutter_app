import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  var _pageController = new PageController(initialPage: 0);

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主页"),
      ),
      body: new PageView.builder(
        onPageChanged: _onItemTapped,
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          print(index);
          return _widgetOptions.elementAt(index);
        },
        itemCount: 3,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
//      margin: EdgeInsets.zero,
              accountName: new Text(
                "SuperLuo",
              ),
              accountEmail: new Text(
                "super_luo@163.com",
              ),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage("images/iconlogin.jpg"),
              ),
              onDetailsPressed: () {
                print("xxx");
              },

              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                  backgroundImage: new AssetImage("images/iconlogin.jpg"),
                ),
              ],
            ), // 可在这里替换自定义的header
            ListTile(
              title: Text('Item 1'),
              leading: new CircleAvatar(
                child: new Icon(Icons.school),
              ),
              onTap: () {
                print("Item 1");
              },
            ),
            ListTile(
              title: Text('Item 2'),
              leading: new CircleAvatar(
                child: new Text('B2'),
              ),
              onTap: () {
                print("Item 2");
              },
            ),
            ListTile(
              title: Text('Item 3'),
              leading: new CircleAvatar(
                child: new Icon(Icons.list),
              ),
              onTap: () {
                print("Item 3");
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          _pageController.animateToPage(index,
              duration: new Duration(seconds: 2),
              curve: new ElasticOutCurve(0.8));
          _onItemTapped(index);
        },
      ),
    );
  }
}
