part of Database;

class QueryResult {
  
  bool succes;
  var json;
  
  QueryResult(this.succes, this.json);
  
  dynamic get() {
    return json;
  }
  
}