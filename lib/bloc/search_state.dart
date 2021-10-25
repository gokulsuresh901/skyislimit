part of 'search_bloc.dart';

abstract class SearchState {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchSuccesfull extends SearchState {
  final SearchResponse? searchResponse;
  final Items? searchResponseselectedItem;

  SearchSuccesfull({this.searchResponse,this.searchResponseselectedItem});
}

class SearchLoading extends SearchState {}