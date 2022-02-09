import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/constants/strings.dart' as Strings;
import 'package:news_app/models/newsInfo.dart';
class API_MANAGER{
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var str = 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c6324af610d44fdaad502dd7f494080f';
   // var response = await client.get(Strings.news_url);
    var response = await client.get(Uri.parse(str));
    var newsModel =null;

    try{
      if(response.statusCode == 200){
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }


      return newsModel;

  }
}