import 'package:clean_architecture/modules/search/domain/entities/result_search_model.dart';
import 'package:clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class SearchRepositoryMock extends Mock implements SearchRepository{

}

main () {
  final repository = SearchRepositoryMock();
  final usecase = SearchByTextImpl(repository);



  test('deve retornar uma lista de ResultSearch', () async{
    when(repository.search("oi")).thenAnswer((_) async => Right(<ResultSearch>[]));
    final result = await usecase.call("jacob");
    // expect(result, isA<Right>());
    expect(result, isA<List<ResultSearch>>()  );
  });

  test('deve retornar um exception cas o texto seja invalido', () async{
    when(repository.search("oi")).thenAnswer((_) async => Right(<ResultSearch>[]));
    final result = await usecase.call("");
    // expect(result, isA<Right>());
    expect(result.isLeft(),true );
    // expect(result?.fold((l) => l, (r) => r), isA<InvalidtextError>() );
  });
}