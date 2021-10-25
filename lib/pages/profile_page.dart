import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skyislimit/assets.dart';
import 'package:skyislimit/bloc/search_bloc.dart';
import 'package:skyislimit/widget/button_widget.dart';
import 'package:skyislimit/widget/numbers_widget.dart';
import 'package:skyislimit/widget/profile_widget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if(state is SearchSuccesfull && state.searchResponseselectedItem!=null){
          return ListView(
            physics: BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 24),
              ProfileWidget(
                imagePath: state.searchResponseselectedItem?.avatarUrl??"",
                onClicked: () {},
              ),
              const SizedBox(height: 24),
              buildName(state.searchResponseselectedItem?.login??""),
              const SizedBox(height: 24),
              const SizedBox(height: 48),
              buildAbout(state.searchResponseselectedItem?.htmlUrl??""),
              const SizedBox(height: 24),
            ],
          );}return SizedBox();
        },
      ),
    );
  }

  Widget buildName(String name) =>
      Column(
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
        ],
      );

  Widget buildUpgradeButton() =>
      ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {},
      );

  Widget buildAbout(String about) =>
      Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 400,
              child: WebView(
                initialUrl: about
              ),
            ),


            const SizedBox(height: 16),

          ],
        ),
      );
}