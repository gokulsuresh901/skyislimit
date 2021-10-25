part of 'repository_bloc.dart';

@immutable
abstract class RepositoryEvent {}

class FetchRepositoryEvent extends RepositoryEvent {
  String ?user_name;
  FetchRepositoryEvent({this.user_name});
}