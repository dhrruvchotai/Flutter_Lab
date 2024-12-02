import "dart:io";

void main(){
  print("Enter a : ");
  int a = int.parse(stdin.readLineSync()!);

  print("Enter b : ");
  int b = int.parse(stdin.readLineSync()!);

  print("Enter op : ");
  String s = stdin.readLineSync()!;

  switch(s) {
    case '+' : print(a+b);
      break;
    case '-' : print(a-b);
      break;
    case '*' : print(a*b);
      break;
    case '/' : print(a/b);
    break;
  }

}