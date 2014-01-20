library Core;

import 'dart:html';

import 'database/Database.dart';
import 'Grekk.dart';

class Core {
  
  static Database database;
  
  static void init(Database database, Grekk grekk) {
    Core.database = database;
    loadControls(grekk);
  }
  
  static void loadControls(Grekk grekk) {
    DivElement controls = querySelector("#controls");
    SelectElement tables = new SelectElement()..setAttribute("id", "tables");
    SelectElement columns = new SelectElement()..setAttribute("id", "columns");
    tables.onChange.listen((Event e) {
      updateColumns();
    });
    Table result = database.query("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA='northwind'");
    for (int i = 0; i < result.json.length; i++) {
      OptionElement option = new OptionElement();
      option.appendText(result.json[i]["TABLE_NAME"]);
      tables.append(option);
    }
    controls.append(tables);
    controls.append(columns);
    controls.append(new ButtonElement()..appendText("Update Table")..onClick.listen(grekk.updateTable));
    updateColumns();
    grekk.updateTable(null); 
  }
  
  static void updateColumns() {
    SelectElement tables = querySelector("#tables");
    SelectElement columns = querySelector("#columns");
    String currentTable = tables.options[tables.selectedIndex].innerHtml;
    Table result = database.query("SELECT column_name FROM information_schema.COLUMNS WHERE table_name = '$currentTable'");
    columns.innerHtml = "";
    for (int i = 0; i < result.json.length; i++) {
      OptionElement option = new OptionElement();
      option.appendText(result.json[i]["column_name"]);
      columns.append(option);
    }
  }
  
}