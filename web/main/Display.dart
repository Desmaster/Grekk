library display;

import 'dart:html';

import 'input/Input.dart';

class Display {
  
  static CanvasElement canvas;
  static CanvasRenderingContext2D graphics;
  static int canvasWidth, canvasHeight;
  
  static void init() {
    canvas = querySelector("#canvas") as CanvasElement;
    Keyboard.create();
    Mouse.create();
    graphics = canvas.context2D;
    canvasWidth = canvas.width;
    canvasHeight = canvas.height;
  }
  
  static CanvasRenderingContext2D getGraphics() {
    return graphics;
  }
  
  static int getWidth() {
    return canvasWidth;
  }
  
  static int getHeight() {
    return canvasHeight;
  }
  
}