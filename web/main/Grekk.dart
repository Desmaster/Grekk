import 'dart:html';
import 'dart:async'; 

import 'Display.dart';
import 'database/Database.dart';
import 'dart:js';

class Grekk {
    
  CanvasRenderingContext2D graphics;
  Database database;
  Timer timer;
  bool running = false;
  int canvasWidth, canvasHeight;
  
  Grekk() {
    database = new Database('localhost:81');
    Display.init();
    graphics = Display.getGraphics();
  }
  
  void start() {
      database.query("SELECT * FROM customers");
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