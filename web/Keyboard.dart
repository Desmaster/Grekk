library Keyboard;

import 'dart:html';

class Keyboard {
  
  static const int KEY_ESCAPE          = 0x01;
  static const int KEY_1               = 0x02;
  static const int KEY_2               = 0x03;
  static const int KEY_3               = 0x04;
  static const int KEY_4               = 0x05;
  static const int KEY_5               = 0x06;
  static const int KEY_6               = 0x07;
  static const int KEY_7               = 0x08;
  static const int KEY_8               = 0x09;
  static const int KEY_9               = 0x0A;
  static const int KEY_0               = 0x0B;
  static const int KEY_MINUS           = 0x0C; /* - on main keyboard */
  static const int KEY_EQUALS          = 0x0D;
  static const int KEY_BACK            = 0x0E; /* backspace */
  static const int KEY_TAB             = 0x0F;
  static const int KEY_Q               = 0x10;
  static const int KEY_W               = 0x11;
  static const int KEY_E               = 0x12;
  static const int KEY_R               = 0x13;
  static const int KEY_T               = 0x14;
  static const int KEY_Y               = 0x15;
  static const int KEY_U               = 0x16;
  static const int KEY_I               = 0x17;
  static const int KEY_O               = 0x18;
  static const int KEY_P               = 0x19;
  static const int KEY_LBRACKET        = 0x1A;
  static const int KEY_RBRACKET        = 0x1B;
  static const int KEY_RETURN          = 0x1C; /* Enter on main keyboard */
  static const int KEY_LCONTROL        = 0x1D;
  static const int KEY_A               = 0x1E;
  static const int KEY_S               = 0x1F;
  static const int KEY_D               = 0x20;
  static const int KEY_F               = 0x21;
  static const int KEY_G               = 0x22;
  static const int KEY_H               = 0x23;
  static const int KEY_J               = 0x24;
  static const int KEY_K               = 0x25;
  static const int KEY_L               = 0x26;
  static const int KEY_SEMICOLON       = 0x27;
  static const int KEY_APOSTROPHE      = 0x28;
  static const int KEY_GRAVE           = 0x29; /* accent grave */
  static const int KEY_LSHIFT          = 0x2A;
  static const int KEY_BACKSLASH       = 0x2B;
  static const int KEY_Z               = 0x2C;
  static const int KEY_X               = 0x2D;
  static const int KEY_C               = 0x2E;
  static const int KEY_V               = 0x2F;
  static const int KEY_B               = 0x30;
  static const int KEY_N               = 0x31;
  static const int KEY_M               = 0x32;
  static const int KEY_COMMA           = 0x33;
  static const int KEY_PERIOD          = 0x34; /* . on main keyboard */
  static const int KEY_SLASH           = 0x35; /* / on main keyboard */
  static const int KEY_RSHIFT          = 0x36;
  static const int KEY_MULTIPLY        = 0x37; /* * on numeric keypad */
  static const int KEY_LMENU           = 0x38; /* left Alt */
  static const int KEY_SPACE           = 0x39;
  static const int KEY_CAPITAL         = 0x3A;
  static const int KEY_F1              = 0x3B;
  static const int KEY_F2              = 0x3C;
  static const int KEY_F3              = 0x3D;
  static const int KEY_F4              = 0x3E;
  static const int KEY_F5              = 0x3F;
  static const int KEY_F6              = 0x40;
  static const int KEY_F7              = 0x41;
  static const int KEY_F8              = 0x42;
  static const int KEY_F9              = 0x43;
  static const int KEY_F10             = 0x44;
  static const int KEY_NUMLOCK         = 0x45;
  static const int KEY_SCROLL          = 0x46; /* Scroll Lock */
  static const int KEY_NUMPAD7         = 0x47;
  static const int KEY_NUMPAD8         = 0x48;
  static const int KEY_NUMPAD9         = 0x49;
  static const int KEY_SUBTRACT        = 0x4A; /* - on numeric keypad */
  static const int KEY_NUMPAD4         = 0x4B;
  static const int KEY_NUMPAD5         = 0x4C;
  static const int KEY_NUMPAD6         = 0x4D;
  static const int KEY_ADD             = 0x4E; /* + on numeric keypad */
  static const int KEY_NUMPAD1         = 0x4F;
  static const int KEY_NUMPAD2         = 0x50;
  static const int KEY_NUMPAD3         = 0x51;
  static const int KEY_NUMPAD0         = 0x52;
  static const int KEY_DECIMAL         = 0x53; /* . on numeric keypad */
  static const int KEY_F11             = 0x57;
  static const int KEY_F12             = 0x58;
  static const int KEY_F13             = 0x64; /*                     (NEC PC98) */
  static const int KEY_F14             = 0x65; /*                     (NEC PC98) */
  static const int KEY_F15             = 0x66; /*                     (NEC PC98) */
  static const int KEY_F16             = 0x67; /* Extended Function keys - (Mac) */
  static const int KEY_F17             = 0x68;
  static const int KEY_F18             = 0x69;
  static const int KEY_KANA            = 0x70; /* (Japanese keyboard)            */
  static const int KEY_F19             = 0x71; /* Extended Function keys - (Mac) */
  static const int KEY_CONVERT         = 0x79; /* (Japanese keyboard)            */
  static const int KEY_NOCONVERT       = 0x7B; /* (Japanese keyboard)            */
  static const int KEY_YEN             = 0x7D; /* (Japanese keyboard)            */
  static const int KEY_NUMPADEQUALS    = 0x8D; /* = on numeric keypad (NEC PC98) */
  static const int KEY_CIRCUMFLEX      = 0x90; /* (Japanese keyboard)            */
  static const int KEY_AT              = 0x91; /*                     (NEC PC98) */
  static const int KEY_COLON           = 0x92; /*                     (NEC PC98) */
  static const int KEY_UNDERLINE       = 0x93; /*                     (NEC PC98) */
  static const int KEY_KANJI           = 0x94; /* (Japanese keyboard)            */
  static const int KEY_STOP            = 0x95; /*                     (NEC PC98) */
  static const int KEY_AX              = 0x96; /*                     (Japan AX) */
  static const int KEY_UNLABELED       = 0x97; /*                        (J3100) */
  static const int KEY_NUMPADENTER     = 0x9C; /* Enter on numeric keypad */
  static const int KEY_RCONTROL        = 0x9D;
  static const int KEY_SECTION         = 0xA7; /* Section symbol (Mac) */
  static const int KEY_NUMPADCOMMA     = 0xB3; /* , on numeric keypad (NEC PC98) */
  static const int KEY_DIVIDE          = 0xB5; /* / on numeric keypad */
  static const int KEY_SYSRQ           = 0xB7;
  static const int KEY_RMENU           = 0xB8; /* right Alt */
  static const int KEY_FUNCTION        = 0xC4; /* Function (Mac) */
  static const int KEY_PAUSE           = 0xC5; /* Pause */
  static const int KEY_HOME            = 0xC7; /* Home on arrow keypad */
  static const int KEY_UP              = 0xC8; /* UpArrow on arrow keypad */
  static const int KEY_PRIOR           = 0xC9; /* PgUp on arrow keypad */
  static const int KEY_LEFT            = 0xCB; /* LeftArrow on arrow keypad */
  static const int KEY_RIGHT           = 0xCD; /* RightArrow on arrow keypad */
  static const int KEY_END             = 0xCF; /* End on arrow keypad */
  static const int KEY_DOWN            = 0xD0; /* DownArrow on arrow keypad */
  static const int KEY_NEXT            = 0xD1; /* PgDn on arrow keypad */
  static const int KEY_INSERT          = 0xD2; /* Insert on arrow keypad */
  static const int KEY_DELETE          = 0xD3; /* Delete on arrow keypad */
  static const int KEY_CLEAR           = 0xDA; /* Clear key (Mac) */
  static const int KEY_LMETA           = 0xDB; /* Left Windows/Option key */
  
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