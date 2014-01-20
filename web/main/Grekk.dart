import 'dart:html';
import 'dart:async'; 
import 'dart:js';
import 'dart:math';

import 'Core.dart';
import 'Display.dart';
import 'database/Database.dart';


class Grekk {
    
  CanvasRenderingContext2D graphics;
  Database database;
  Timer timer;
  Table table;
  bool running = false;
  int canvasWidth, canvasHeight;
  String tableName, columnName;
  
  Grekk(String host) {
    database = new Database(host);
    Display.init();
    graphics = Display.getGraphics();
  }
  
  void start() {
      Core.init(database, this);
      running = true;
      Duration duration = new Duration(milliseconds:1000);
      timer = new Timer.periodic(duration, (Timer timer) => run());
  }
  
  void run() {
    if (database.connected) {
      tick();
      render();
    }
  }
  
  void tick() {
    table = database.query("SELECT $columnName as KeyName, count(*) as Amount FROM $tableName group by KeyName ORDER BY Amount DESC LIMIT 5");
    table.init();
  }
  
  List colors = new List(5);
  void updateTable(MouseEvent e) {
    SelectElement tables = querySelector("#tables");
    SelectElement columns = querySelector("#columns");
    tableName = tables.options[tables.selectedIndex].innerHtml;
    columnName = columns.options[columns.selectedIndex].innerHtml;
    for (int i = 0; i < colors.length; i++) {
      var letters = '0123456789ABCDEF'.split('');
      var color = '#';
      for (var i = 0; i < 6; i++ ) {
        color += letters[(new Random().nextDouble() * 15).round()];
      }
      colors[i] = color;
    }
  }
  
  void render() {
    graphics.clearRect(0, 0, Display.getWidth(), Display.getHeight());
    int widthPerBar = (Display.getWidth() / 5).round();
    for (int i = 0; i < table.json.length; i++) {
      
      int amount = int.parse(table.json[i]["Amount"]);
      int max = int.parse(table.json[0]["Amount"]);
      double changePerPoint = Display.getHeight() / max;
      int negativePoints = max - amount;
      double pixelsDrained = negativePoints * changePerPoint;
      
      int barY = pixelsDrained.round();
      int barHeight = Display.getHeight() - pixelsDrained.round();
      
      graphics.beginPath();
      graphics.rect(i *widthPerBar, barY, widthPerBar, Display.getHeight());
      graphics.fillStyle = "" + colors[i];
      graphics.fill();
      graphics.lineWidth = 2;
      graphics.strokeStyle = "black";
      graphics.stroke();
      graphics.fillStyle = "black";
      if (table.json[i]["KeyName"] != null) {
        graphics.fillText(table.json[i]["KeyName"], 16 +  i * widthPerBar, barY + 16);
      }
      graphics.fillText("Amount: " + amount.toString(), 16 +  i * widthPerBar, barY + 32);
      
    }
  }
  
}

void main() {
  var host = context.callMethod('prompt', ['Please enter your host to proceed (e.g. localhost):']);
  Grekk game = new Grekk(host);
  while (!game.database.connected) {
    var password = context.callMethod('prompt', ['Please enter your password to proceed:']);
    game.database.connectDB(password);
  }
  game.start();
}

void onDataLoaded(String responseText) {
  var jsonString = responseText;
  print(jsonString);
}