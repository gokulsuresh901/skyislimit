part of 'search_bloc.dart';

abstract class SearchEvent {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class FetchSearchEvent extends SearchEvent {
  String ?q;
  FetchSearchEvent({this.q});
}

class SelectUserEvent extends SearchEvent {
  final Items? selectedItem;
  SelectUserEvent({this.selectedItem});
}