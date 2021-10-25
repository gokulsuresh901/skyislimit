import 'package:flutter/material.dart';
import 'package:skyislimit/pages/profile_page.dart';
import 'package:skyislimit/pages/repository_page.dart';
import 'package:skyislimit/pages/user_repository.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      ProfilePage(),
      UserRepository(),
    ];
    final _kTabs = <Tab>[
      const Tab(icon: Icon(Icons.supervised_user_circle), text: 'User Profile'),
      const Tab(icon: Icon(Icons.note), text: 'Repository'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          backgroundColor: Colors.cyan,
          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }
}