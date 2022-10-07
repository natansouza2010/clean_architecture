import 'package:clean_architecture/modules/search/domain/entities/result_search_model.dart';
import 'package:clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_architecture/modules/search/infra/datasource/search_datasource.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository{

  final SearchDatasource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText) async {
    try{
      final result = await datasource.getSearch(searchText);
      return Right(result);
    }catch(e){
      return Left(DataSourceError());
    }


  }

 

}