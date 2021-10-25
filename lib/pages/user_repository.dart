import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skyislimit/bloc/repository_bloc.dart';
import 'package:skyislimit/bloc/search_bloc.dart';
import 'package:skyislimit/widget/repository_List.dart';

import 'home_page.dart';

class UserRepository extends StatelessWidget {
  const UserRepository({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:  BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if(state is SearchSuccesfull) {
              BlocProvider.of<RepositoryBloc>(context).add(FetchRepositoryEvent(user_name: state.searchResponseselectedItem?.login));
              return BlocBuilder<RepositoryBloc, RepositoryState>(
                builder: (context, repoState) {
                  if(repoState is RepositorySuccesfull){
                    return ListView.builder(
                        itemCount: repoState.repositoryResponse?.repos?.length,
                        itemBuilder: (context,index){
                      return Card(child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        child: Text(repoState.repositoryResponse?.repos![index]?.name??""),));
                    });
                  }
                  return Container();
                },
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
