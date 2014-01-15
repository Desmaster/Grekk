import 'dart:html';
import 'dart:async'; 

import 'Player.dart';
import 'Display.dart';

class Grekk {
    
  CanvasRenderingContext2D graphics;
  Player player;
  Timer timer;
  bool running = false;
  int canvasWidth, canvasHeight;
  
  Grekk() {
    Display.init();
    graphics = Display.getGraphics();
    player = new Player();
  }
  
  void start() {
    running = true;
    Duration duration = new Duration(milliseconds:500);
    timer = new Timer.periodic(duration, (Timer timer) => run());
  }
  
  void run() {
      tick();
      render();
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

  var response = HttpRequest.getString("http://localhost/dart-api/", withCredentials: true, onProgress:print)
                 .then((String text) {
                   print(text);
                 });
  game.start();
}

void onDataLoaded(String responseText) {
  var jsonString = responseText;
  print(jsonString);
}