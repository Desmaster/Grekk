part of Input;

class Mouse {
  
  static int mouseB = -1;
  static int mouseX = -1;
  static int mouseY = -1;
  
  static void create() {
    window.onMouseDown.listen(mousePressed);
    window.onMouseUp.listen(mouseReleased);
    window.onDrag.listen(mouseDragged);
    window.onMouseMove.listen(mouseMoved);
  }
  
  static int getMouseX() {
    return mouseX;
  }
  
  static int getmouseY() {
    return mouseY;
  }
  
  static int getMouseB() {
    return mouseB;
  }
  
  static void mousePressed(MouseEvent e) {
    mouseB = e.button;
  }
  
  static void mouseReleased(MouseEvent e) {
    mouseB = -1; 
  }
  
  static void mouseDragged(MouseEvent e) {
    mouseX = e.screen.x;
    mouseY = e.screen.y;
  }
  
  static void mouseMoved(MouseEvent e) {
    mouseX = e.screen.x;
    mouseY = e.screen.y;
  }
  
}