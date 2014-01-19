library Database;

import 'dart:html';
import 'dart:convert';
import 'dart:js';

part 'QueryResult.dart';
part 'Table.dart';

class Database {
  
  String host, password;
  HttpRequest request;
  HttpRequest httpQuery;
  bool connected = false;
  bool qcon = false;
  
  Database(String host) {
    this.host = host;
    httpQuery = new HttpRequest();
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
  
  void query(String q) {
    if (!connected) return;
    httpQuery.onReadyStateChange.listen(parseQuery);
    String url = "http://$host/dart/";
    httpQuery.open('POST', url, async: false);
    Object postData = {"action" : "query", "password" : password, "query" : q};
    FormData data = new FormData();
    data.append("data", JSON.encode(postData));
    httpQuery.send(data);
  }
  
  QueryResult parseQuery(ProgressEvent e) {
    if (!qcon) {
      qcon = true;
      return null;
    }
    QueryResult result;
    String json = httpQuery.responseText;
    context.callMethod('alert', [json]);
//    print(json);
    var response = JSON.decode(json);
    if (response["ERROR"] == "FAIL") {
      result = new QueryResult(false, response); 
    } else if(response["LOG"] == "SUCCES") {
      result = new Table(response);
    }
  }
  
}