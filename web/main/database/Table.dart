part of Database;

class Table extends QueryResult {
  
  
  Table(List rows) : super(true, rows);
  
  void init() {
    print(json.length);
  }
  
  dynamic get() {
    return json;
  }
  
}