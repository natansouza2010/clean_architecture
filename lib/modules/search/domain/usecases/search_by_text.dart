import 'package:clean_architecture/modules/search/domain/entities/result_search_model.dart';
import 'package:clean_architecture/modules/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

import '../errors/errors.dart';

abstract class SearchByText {

  Future<Either<FailureSearch,List<ResultSearch>?>?> call(String searchText);
}


class SearchByTextImpl implements SearchByText{
  final SearchRepository repository;
  SearchByTextImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText) async {

    if(searchText == null || searchText.isEmpty) {
      return Left(InvalidtextError());
    }

    return repository.search(searchText);
  }


}