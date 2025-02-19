import 'package:components/dart/oops/generics.dart';

class Calculator{
  int addOne(int n){
    return n+1;
  }
}

void main(List<String> args) {
  Generics gen = Generics();
  print(gen.genericFunction(<int>[1, 2, 34]));
}