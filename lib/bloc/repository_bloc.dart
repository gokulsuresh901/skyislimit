import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:skyislimit/api/model/repository_response.dart';
import 'package:skyislimit/core/apiBridge.dart';

part 'repository_event.dart';
part 'repository_state.dart';

class RepositoryBloc extends Bloc<RepositoryEvent, RepositoryState> {
  ApiBridge apiBridge = GetIt.I.get<ApiBridge>();
  RepositoryBloc() : super(RepositoryInitial()) {
    on<RepositoryEvent>((event, emit) async {
      if(event is FetchRepositoryEvent){
        emit(RepositoryLoading());
        RepositoryResponse? repositoryResponse=await this.apiBridge.fetchRepository(event.user_name);
        emit(RepositorySuccesfull(repositoryResponse: repositoryResponse));
      }
    });
  }
}
