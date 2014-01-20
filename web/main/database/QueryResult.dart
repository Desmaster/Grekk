part of Database;

class QueryResult {
  
  bool succes;
  
  List json;
  QueryResult(this.succes, this.json);
  
  void init() {
  }
  
  dynamic get() {
    return json;
  }
  
}