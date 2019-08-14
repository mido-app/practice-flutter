import 'package:flutter/material.dart';
import '../models/page_meta.dart';

// URL: https://flutter.dev/docs/development/ui/widgets-intro
class IntroductionToWidgetsPage extends StatelessWidget {
  static const route = '02-introduction-to-widgets';
  static const meta = PageMeta('02-introduction-to-widgets', '02. Introduction to Widgets');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meta.title),),
    );
  }
}
