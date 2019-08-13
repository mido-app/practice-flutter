import 'package:flutter/material.dart';
import './pages/getting_start.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => HomePage(),
        SuggestWordListPage.route: (context) => SuggestWordListPage()
      }
    )
  );
}

class HomePage extends StatelessWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    const pages = <PageInfomation>[
      PageInfomation(SuggestWordListPage.route, 'Getting Start')
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
            title: Text(pages[index].name),
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

class PageInfomation {
  final String route;
  final String name;

  const PageInfomation(this.route, this.name);
}
