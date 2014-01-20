library Database;

import 'dart:html';
import 'dart:convert';
import 'dart:collection';

part 'QueryResult.dart';
part 'Table.dart';

class Database {
  
  String host, password;
  HttpRequest request;
  HttpRequest httpQuery;
  bool connected = false;
  
  Database(String host) {
    this.host = host;
  }
  
  void connectDB(String password) {
    this.password = password;
    request = new HttpRequest();
    request.onReadyStateChange.listen(onReady);
    String url = "http://$host/dart/";
    request.open('POST', url, async: false);
    Object postData = {"action" : "connect", "password" : password};
    FormData data = new FormData();
    data.append("data", JSON.encode(postData));
    request.send(data);
  }

  void onReady(ProgressEvent e) {
    if (request.readyState == HttpRequest.DONE && (request.status == 200 || request.status == 0)) {
      print(request.responseText);
      var response = JSON.decode(request.responseText);
      if (response["LOG"] == "Connected") {
        connected = true;
      }
    }
  }
  
  QueryResult query(String q) {
    if (!connected) return null;
    httpQuery = new HttpRequest();
    QueryResult result;
    httpQuery.onReadyStateChange.listen((ProgressEvent e) {
      String json = httpQuery.responseText;
      if (json != "") {
        print(json);
        List response = JSON.decode(json);
        result = new Table(response);
      }
    });
    String url = "http://$host/dart/";
    httpQuery.open('POST', url, async: false);
    Object postData = {"action" : "query", "password" : password, "query" : q};
    FormData data = new FormData();
    data.append("data", JSON.encode(postData));
    httpQuery.send(data);
    return result;
  }
  
}