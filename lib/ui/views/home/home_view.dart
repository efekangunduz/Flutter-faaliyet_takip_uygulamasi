import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faaliyet_takip_uygulamasi/features/register/auth/auth.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/base_view.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/home/add_event_form_view.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/home/add_category_form_view.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/home/event_list_widget.dart';
import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/new_tab_widget.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/home/home_list_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(const HomePage());

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _pageTitle = 'Home';
  final String _addEventTabText = 'Add Event';
  final String _myEvents = 'Events';
  final String _addCategoryTabText = 'Add Category';
  final String _settingsTabText = 'Settings';
  final String saveText = 'Save';
  bool _adminOnly = true;
  final IconData _homeIcon = Icons.home;
  final IconData _addIcon = Icons.add;
  final IconData _eventsIcon = Icons.event;
  final IconData _addCategoryIcon = Icons.add_box;
  final IconData _settingsIcon = Icons.settings;
  final IconData _logoutIcon = Icons.logout;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      getData();
    });
  }

  getData() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    DocumentSnapshot<Map<String, dynamic>> documentStream =
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(auth.currentUser?.displayName.toString())
            .get();
    setState(() {
      _adminOnly = documentStream['admin'];
      print(_adminOnly);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: !_adminOnly ? 3 : 5,
      child: BaseView(
        appBar: appBarMethod(),
        child: TabBarView(
          children: [
            HomeList(),
            if (_adminOnly == true) ...{
              AddEvent(),
              AddCategory(),
            },
            EventList(),
            AddEvent(),
          ],
        ),
      ),
    );
  }

  AppBar appBarMethod() {
    return AppBar(
      leading: Icon(_homeIcon),
      actions: [
        IconButton(
          onPressed: () {
            logout();
            Navigator.of(context).pushNamed("/register");
          },
          icon: Icon(_logoutIcon),
        )
      ],
      title: Text(_pageTitle),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigoAccent, Colors.purpleAccent],
          ),
        ),
      ),
      bottom: tabBarMethod(),
    );
  }

  TabBar tabBarMethod() {
    return TabBar(
      indicatorColor: Colors.white,
      tabs: [
        NewTab(
          iconTitle: _pageTitle,
          icon: Icon(_homeIcon),
        ),
        if (_adminOnly == true) ...{
          NewTab(icon: Icon(_addIcon), iconTitle: _addEventTabText),
          NewTab(icon: Icon(_addCategoryIcon), iconTitle: _addCategoryTabText),
        },
        NewTab(icon: Icon(_eventsIcon), iconTitle: _myEvents),
        NewTab(icon: Icon(_settingsIcon), iconTitle: _settingsTabText),
      ],
    );
  }
}
