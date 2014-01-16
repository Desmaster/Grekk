import 'dart:html';
import 'dart:async'; 

import 'Display.dart';
import 'Keyboard.dart';

class Grekk {
    
  CanvasRenderingContext2D graphics;
  Timer timer;
  bool running = false;
  int canvasWidth, canvasHeight;
  
  Grekk() {
    Display.init();
    graphics = Display.getGraphics();
  }
  
  void start() {
    running = true;
    Duration duration = new Duration(milliseconds:17);
    timer = new Timer.periodic(duration, (Timer timer) => run());
  }
  
  void run() {
      tick();
      render();
  }
  
  void tick() {
    if (Keyboard.isKeyDown(38)) {
      print("Key!!");
    }
  }
  
  void render() {
    graphics.fillStyle = "yellow";
    graphics.fillRect(50, 50, Display.getWidth() - 100, Display.getHeight() - 100);
  }
  
}

void main() {
  Grekk game = new Grekk();

  game.start();
}

void onDataLoaded(String responseText) {
  var jsonString = responseText;
  print(jsonString);
}