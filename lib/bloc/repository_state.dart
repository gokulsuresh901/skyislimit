part of 'repository_bloc.dart';

@immutable
abstract class RepositoryState {}

class RepositoryInitial extends RepositoryState {}

class RepositorySuccesfull extends RepositoryState {
  final RepositoryResponse? repositoryResponse;

  RepositorySuccesfull({this.repositoryResponse});
}

class RepositoryLoading extends RepositoryState {}