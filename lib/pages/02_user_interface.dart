import 'package:flutter/material.dart';
import '../models/page_meta.dart';

/*
 * This page shows how to build user interface on Flutter
 */
class UserInterfacePage extends StatelessWidget {
  static const route = '02-user-interface';
  static const meta = PageMeta('02-introduction-to-widgets', '02. User Interface');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meta.title)),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text('This page shows how to build user interface on Flutter.'),
            Divider()
          ],
        ),
      ),
    );
  }
}
