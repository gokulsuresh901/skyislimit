import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skyislimit/bloc/search_bloc.dart';
import 'package:skyislimit/pages/repository_page.dart';

import 'home_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Search Page"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          SizedBox(
            height: 200,
          ),

          Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: TextField(
                controller: search,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'username',
                    hintText: 'Enter valid username'),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: FlatButton(
              onPressed: () {
                BlocProvider.of<SearchBloc>(context).add(FetchSearchEvent(q:search.text));
                 Navigator.push(context, MaterialPageRoute(builder: (_) => RepositoryPage()));

              },
              child: Text(
                'SEARCH',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),


        ],
      ),
    );
  }
}