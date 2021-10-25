

import 'package:get_it/get_it.dart';
import 'package:skyislimit/api/model/repository_request.dart';
import 'package:skyislimit/api/model/repository_response.dart';
import 'package:skyislimit/api/model/search_request.dart';
import 'package:skyislimit/api/model/search_response.dart';
import 'package:skyislimit/api/service/user_resourse_service.dart';

class ApiBridge {
  UserResourceService userResourceService = GetIt.I.get<UserResourceService>();

  ApiBridge();

  Future<SearchResponse?> fetchData(String ?searchVal) async {
    return await this.userResourceService.fetchData(SearchRequest(q:searchVal));
  }
  Future<RepositoryResponse?> fetchRepository(String ?searchVal) async {
    return await this.userResourceService.fetchRepository(RepositoryRequest(user_name:searchVal));
  }
}