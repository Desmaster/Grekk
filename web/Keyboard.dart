library Keyboard;

import 'dart:html';

class Keyboard {
  
  static const int KEY_BACK            = 8; /* backspace */
  static const int KEY_TAB             = 9;
  static const int KEY_RETURN          = 13; /* Enter on main keyboard */
  static const int KEY_SHIFT           = 16;
  static const int KEY_CONTROL         = 17;
  static const int KEY_MENU            = 18; /* left Alt */
  static const int KEY_PAUSE           = 19; /* Pause */
  static const int KEY_CAPITAL         = 20;
  static const int KEY_ESCAPE          = 27;
  static const int KEY_SPACE           = 32;
  static const int KEY_PRIOR           = 33; /* PgUp on arrow keypad */
  static const int KEY_NEXT            = 34; /* PgDn on arrow keypad */
  static const int KEY_END             = 35; /* End on arrow keypad */
  static const int KEY_HOME            = 36; /* Home on arrow keypad */
  static const int KEY_LEFT            = 37; /* LeftArrow on arrow keypad */
  static const int KEY_UP              = 38; /* UpArrow on arrow keypad */
  static const int KEY_RIGHT           = 39; /* RightArrow on arrow keypad */
  static const int KEY_DOWN            = 40; /* DownArrow on arrow keypad */
  static const int KEY_INSERT          = 45; /* Insert on arrow keypad */
  static const int KEY_DELETE          = 46; /* Delete on arrow keypad */
  static const int KEY_0               = 48;
  static const int KEY_1               = 49;
  static const int KEY_2               = 50;
  static const int KEY_3               = 51;
  static const int KEY_4               = 52;
  static const int KEY_5               = 53;
  static const int KEY_6               = 54;
  static const int KEY_7               = 55;
  static const int KEY_8               = 56;
  static const int KEY_9               = 57;
  static const int KEY_A               = 65;
  static const int KEY_B               = 66;
  static const int KEY_C               = 67;
  static const int KEY_D               = 68;
  static const int KEY_E               = 69;
  static const int KEY_F               = 70;
  static const int KEY_G               = 71;
  static const int KEY_H               = 72;
  static const int KEY_I               = 73;
  static const int KEY_J               = 74;
  static const int KEY_K               = 75;
  static const int KEY_L               = 76;
  static const int KEY_O               = 79;
  static const int KEY_M               = 77;
  static const int KEY_N               = 78;
  static const int KEY_P               = 80;
  static const int KEY_Q               = 81;
  static const int KEY_R               = 82;
  static const int KEY_S               = 83;
  static const int KEY_T               = 84;
  static const int KEY_U               = 85;
  static const int KEY_V               = 86;
  static const int KEY_W               = 87;
  static const int KEY_X               = 88;
  static const int KEY_Y               = 89;
  static const int KEY_Z               = 90;
  static const int KEY_NUMPAD0         = 96;
  static const int KEY_NUMPAD1         = 97;
  static const int KEY_NUMPAD2         = 98;
  static const int KEY_NUMPAD3         = 99;
  static const int KEY_NUMPAD4         = 100;
  static const int KEY_NUMPAD5         = 101;
  static const int KEY_NUMPAD6         = 102;
  static const int KEY_NUMPAD7         = 103;
  static const int KEY_NUMPAD8         = 104;
  static const int KEY_NUMPAD9         = 105;
  static const int KEY_MULTIPLY        = 106; /* * on numeric keypad */
  static const int KEY_ADD             = 107; /* + on numeric keypad */
  static const int KEY_SUBTRACT        = 109; /* - on numeric keypad */
  static const int KEY_DECIMAL         = 110; /* . on numeric keypad */
  static const int KEY_DIVIDE          = 111; /* / on numeric keypad */
  static const int KEY_F1              = 112;
  static const int KEY_F2              = 113;
  static const int KEY_F3              = 114;
  static const int KEY_F4              = 115;
  static const int KEY_F5              = 116;
  static const int KEY_F6              = 117;
  static const int KEY_F7              = 118;
  static const int KEY_F8              = 119;
  static const int KEY_F9              = 120;
  static const int KEY_F10             = 121;
  static const int KEY_F11             = 122;
  static const int KEY_F12             = 123;
  static const int KEY_NUMLOCK         = 144;
  static const int KEY_SCROLL          = 145; /* Scroll Lock */
  static const int KEY_SEMICOLON       = 186;
  static const int KEY_EQUALS          = 187;
  static const int KEY_COMMA           = 188;
  static const int KEY_PERIOD          = 190; /* . on main keyboard */
  static const int KEY_SLASH           = 191; /* / on main keyboard */
  static const int KEY_GRAVE           = 192; /* accent grave */
  static const int KEY_MINUS           = 189; /* - on main keyboard */
  static const int KEY_LBRACKET        = 219;
  static const int KEY_BACKSLASH       = 220;
  static const int KEY_RBRACKET        = 221;
  static const int KEY_APOSTROPHE      = 222;
  
  static List keys = new List(700);
  
  static void init() {
    window.onKeyDown.listen(keyDown);
    window.onKeyUp.listen(keyUp);
  }

  static void keyDown(KeyboardEvent e) {
    keys[e.keyCode] = true;
  }
  
  static void keyUp(KeyboardEvent e) {
    keys[e.keyCode] = false;
  }
  
  static bool isKeyDown(int key) {
    if (keys[key] == null) return false;
    return keys[key];
  }
  
}