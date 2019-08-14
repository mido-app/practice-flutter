import 'package:flutter/material.dart';
import 'package:hello_flutter/models/page_meta.dart';
import './pages/01_getting_start.dart';
import './pages/02_user_interface.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => HomePage(),
        GettingStartPage.meta.route: (context) => GettingStartPage(),
        UserInterfacePage.meta.route: (context) => UserInterfacePage(),
      }
    )
  );
}

class HomePage extends StatelessWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    const pages = <PageMeta>[
      GettingStartPage.meta,
      UserInterfacePage.meta
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Sample Apps'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if(i.isOdd) return Divider();
          final index = i ~/ 2;
          return ListTile(
            title: Text(pages[index].title),
            onTap: () {
              Navigator.pushNamed(context, pages[index].route);
            },
          );
        },
        itemCount: pages.length * 2 - 1,
      ),
    );
  }
}
