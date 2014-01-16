library Database;

import 'dart:html';

class Database {
  
  String host, password;
  
  Database(String host, String password) {
    this.host = host;
    this.password = password;
  }
  
  void connectDB() {
    var response = HttpRequest.getString("http://$host/api/dart/?password=$password")
                  .then((String text) {
                    print(text);
                  });
  }
  
  String getString(String object) {
    
  }
  
  int getInt(String object) {
    
  }
  
  bool getBoolean(String object) {
    
  }
  
}