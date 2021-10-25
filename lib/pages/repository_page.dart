import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skyislimit/bloc/search_bloc.dart';
import 'package:skyislimit/widget/repository_List.dart';

import 'home_page.dart';

class RepositoryPage extends StatelessWidget {
  const RepositoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:  BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if(state is SearchSuccesfull){
            return ListView.builder(itemCount: state.searchResponse?.items?.length,
             itemBuilder: (context,index){
               return InkWell(
                   onTap: (){
                     BlocProvider.of<SearchBloc>(context).add(SelectUserEvent(selectedItem:state.searchResponse?.items![index]));
                     Navigator.push(context, MaterialPageRoute(builder: (_) =>HomePage()));
                   },
                   child: RepositoryList(state.searchResponse?.items![index].login??""));
             },



            );}
            else return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
