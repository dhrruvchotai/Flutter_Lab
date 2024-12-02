import "dart:io";

void main() {
  print("Enter a : ");
  int a = int.parse(stdin.readLineSync()!);

  print("Enter b : ");
  int b = int.parse(stdin.readLineSync()!);

  print("Enter c : ");
  int c = int.parse(stdin.readLineSync()!);

  int res1 = (a>b)?a:b;
  int res2 = (b>c)?b:c;
  int res = (res1>res2)?res1:res2;

  print("${res} is largest.");
}