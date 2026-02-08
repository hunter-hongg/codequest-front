import 'dart:math';

T choice<T>(List<T> list) {
  return list[Random().nextInt(list.length)];
}
