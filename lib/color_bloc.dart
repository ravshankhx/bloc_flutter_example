import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ColorEvent { event_red, event_green }

class ColorBLoc extends Bloc<ColorEvent, Color> {
  Color _color = Colors.red;

  ColorBLoc() : super(Colors.red) {
    on<ColorEvent>((event, emit) async {
      _color = (event == ColorEvent.event_red) ? Colors.red : Colors.green;
      emit(_color);
    });
  }
}
