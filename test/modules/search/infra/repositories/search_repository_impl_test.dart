import 'package:clean_architecture/modules/search/domain/entities/result_search_model.dart';
import 'package:clean_architecture/modules/search/infra/datasource/search_datasource.dart';
import 'package:clean_architecture/modules/search/infra/models/result_search_model.dart';
import 'package:clean_architecture/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDataSouceMock extends Mock implements SearchDatasource{

  }
  



main() {

  SearchDataSouceMock datasource = SearchDataSouceMock();
  final repository = SearchRepositoryImpl(datasource);


  test('deve retornar uma lista de ResultSearch', () async {

    // when(datasource.getSearch(any)).thenAnswer((_) async => <ResultSearchModel>[] );

    final result = await repository.search("jacob");

    expect(result , isA<List<ResultSearch>>());
  });
}