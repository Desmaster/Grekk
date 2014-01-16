import 'dart:html';
import 'dart:async'; 

import 'Display.dart';
import 'Database.dart';
import 'dart:js';

class Grekk {
    
  CanvasRenderingContext2D graphics;
  Database database;
  Timer timer;
  bool running = false;
  int canvasWidth, canvasHeight;
  
  Grekk() {
    database = new Database('tdegroot.nl');
    Display.init();
    graphics = Display.getGraphics();
  }
  
  void start() {
      running = true;
      Duration duration = new Duration(milliseconds:500);
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