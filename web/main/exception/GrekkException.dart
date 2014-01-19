library GrekkException;

import 'dart:core';

class GrekkError extends Error {
  
  final message;
  
  GrekkError([this.message]);
  
  String toString() {
    if (message != null) {
      return "Grekk Error: $message";
    }
    return "Grekk Error";
  }
  
}