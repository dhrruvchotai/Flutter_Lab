import "dart:io";

void main() {
  print("Enter n : ");
  String str = stdin.readLineSync()!;

  for (int i = str.length - 1; i >= 0; i--) {
    stdout.write(str[i]);
  }
}