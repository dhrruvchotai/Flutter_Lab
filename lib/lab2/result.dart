import "dart:io";

void main() {
  print("Enter a : ");
  int a = int.parse(stdin.readLineSync()!);

  print("Enter b : ");
  int b = int.parse(stdin.readLineSync()!);

  print("Enter c : ");
  int c = int.parse(stdin.readLineSync()!);

  print("Enter d : ");
  int d = int.parse(stdin.readLineSync()!);

  print("Enter e : ");
  int e = int.parse(stdin.readLineSync()!);

  double res = (a+b+c+d+e)/5;

  if(res<=35){
    print("fail");
  }
  else if(res>35 && res<=45){
    print("pass");
  }
  else if(res>45 && res<=60){
    print("second");
  }
  else if(res>60 && res>70){
    print("first");
  }
  else{
    print("distinction");
  }

}