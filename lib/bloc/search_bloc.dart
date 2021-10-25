import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:skyislimit/api/model/search_response.dart';
import 'package:skyislimit/core/apiBridge.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial());
  ApiBridge apiBridge = GetIt.I.get<ApiBridge>();


  @override
  Stream<SearchState> mapEventToState(
      SearchEvent event,
      ) async* {
    if (event is FetchSearchEvent) {
      yield SearchLoading();

      SearchResponse ?searchResponse = await apiBridge.fetchData(event.q);
      yield SearchSuccesfull(
          searchResponse: searchResponse);

    }
    else if (event is SelectUserEvent) {
      SearchSuccesfull previous=this.state as SearchSuccesfull;

   //   SearchResponse ?searchResponse = await apiBridge.fetchData(event.q);
      yield SearchSuccesfull(
        searchResponseselectedItem: event.selectedItem,
          searchResponse: previous?.searchResponse);

    }
  }
}
