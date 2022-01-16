import 'package:faaliyet_takip_uygulamasi/base_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(const HomePage());

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      child: Center(
        child: Container(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
