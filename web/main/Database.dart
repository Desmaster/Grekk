library Database;

import 'dart:html';
import 'dart:convert';

class Database {
  
  String host, password;
  HttpRequest request;
  bool connected = false;
  
  Database(String host) {
    this.host = host;
  }
  
  void connectDB(String password) {
    this.password = password;
    request = new HttpRequest();
    request.onReadyStateChange.listen(onReady);
    String url = "http://$host/api/dart/";
    request.open('POST', url, async: false);
    Object postData = {"password" : password};
    FormData data = new FormData();
    data.append("data", JSON.encode(postData));
    request.send(data);
  }

  void onReady(ProgressEvent e) {
    if (request.readyState == HttpRequest.DONE && (request.status == 200 || request.status == 0)) {
      var response = JSON.decode(request.responseText);
      print(response);
      if (response["LOG"] == "Connected") {
        connected = true;
      }
    }
  }
  
  void query(String q) {
    String url = "http://$host/api/dart/";
    request.open('POST', url, async: false);
    Object postData = {"password" : password, "query" : q};
    FormData data = new FormData();
    data.append("data", JSON.encode(postData));
    request.send(data);
  }
  
  String getString(String object) {
    
  }
  
  int getInt(String object) {
    
  }
  
  bool getBoolean(String object) {
    
  }
  
}