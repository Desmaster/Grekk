import 'dart:html';
import 'dart:async'; 

import 'Display.dart';
import 'database/Database.dart';
import 'dart:js';

class Grekk {
    
  CanvasRenderingContext2D graphics;
  Database database;
  Timer timer;
  Table table;
  bool running = false;
  int canvasWidth, canvasHeight;
  
  Grekk() {
    database = new Database('localhost');
    Display.init();
    graphics = Display.getGraphics();
  }
  
  void start() {
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
    table = database.query("SELECT City, count(*) as Amount FROM customers group by City ORDER BY Amount DESC LIMIT 5");
    table.init();
    print(table.json[0]);
  }
  
  void render() {
    graphics.fillStyle = "yellow";
    graphics.fillRect(50, 50, Display.getWidth() - 100, Display.getHeight() - 100);
  }
  
}

void main() {
  Grekk game = new Grekk();
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