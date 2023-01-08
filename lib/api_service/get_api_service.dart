import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/GetArticlesModel.dart';

class GetArticles{

  static Future<GetArticlesModel> getArticle() async {
    http.Response response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=e722c77c1f234e55b84c491aa6c961b9"));
    return getArticlesModelFromJson(response.body);
}
}