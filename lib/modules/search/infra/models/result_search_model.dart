import 'package:clean_architecture/modules/search/domain/entities/result_search_model.dart';

class ResultSearchModel extends ResultSearch {

  final String? title;
  final String? content;
  final String? img;

  ResultSearchModel({this.title, this.content, this.img});


  Map<String, dynamic> toJson() {
    return {
      "title": this.title,
      "content": this.content,
      "img": this.img,
    };
  }

  factory ResultSearchModel.fromJson(Map<String, dynamic> json) {
    return ResultSearchModel(
      title: json["title"],
      content: json["content"],
      img: json["img"],
    );

  }


//

}