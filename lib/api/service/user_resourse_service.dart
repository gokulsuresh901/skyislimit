
import 'dart:convert';


import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:skyislimit/api/model/repository_request.dart';
import 'package:skyislimit/api/model/repository_response.dart';
import 'package:skyislimit/api/model/search_request.dart';
import 'package:skyislimit/api/model/search_response.dart';

class UserResourceService {
  Client? httpClient;
  Logger ?logger = Logger();
  UserResourceService() {
    this.httpClient = Client();
  }

  Future<SearchResponse?> fetchData(
      SearchRequest? searchRequest) async {
   try{
     String apiPath = "https://api.github.com/search/users";
     Response response = await this
         .httpClient!
         .get(Uri.parse(apiPath+"?q=${searchRequest?.q}"));
     Map<String, dynamic>  _responseMap = json.decode(response.body);
     Logger().i("hello world");
     logger!.i(response.body);
     logger!.i(SearchResponse.fromJson(_responseMap).toJson());
     return SearchResponse.fromJson(_responseMap);
   }catch(e) {
     Logger().i(e.toString());
   }  }
  Future<RepositoryResponse?> fetchRepository(
      RepositoryRequest? repositoryRequest) async {
    try{
      String apiPath = "https://api.github.com/users/${repositoryRequest?.user_name}/repos";
      Response response = await this
          .httpClient!
          .get(Uri.parse(apiPath));
      List<dynamic>  _responseMap = json.decode(response.body);
      Logger().i("hello world");
      logger!.i(response.body);
      logger!.i(response.body);
      return RepositoryResponse.fromJson(_responseMap);
    }catch(e) {
      Logger().i(e.toString());
    }  }
  }