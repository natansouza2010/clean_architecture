import 'package:clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture/modules/search/infra/datasource/search_datasource.dart';
import 'package:clean_architecture/modules/search/infra/models/result_search_model.dart';
import 'package:dio/dio.dart';




class GithubDatasource implements SearchDatasource{
  final Dio dio;
  GithubDatasource(this.dio);

  @override
  Future<List<ResultSearchModel>> getSearch(String searchtext) async {
    final response = await dio.get("https://api.github.com/search/users?q=${_normalizeText(searchtext)}");

    if(response.statusCode == 200) {
      final list = (response.data['items'] as List).map((e) => ResultSearchModel.fromJson(e) ).toList();

      return list;
    }else{
      throw DataSourceError();
    }

    // TODO: implement getSearch
    throw UnimplementedError();
  }



  String _normalizeText(String searchText){

    return searchText.replaceAll(" ", "+");
  }


}