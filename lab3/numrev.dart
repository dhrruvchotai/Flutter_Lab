import "dart:io";

void main(){
  print("Enter n : ");
  int n = int.parse(stdin.readLineSync()!);

  while(n!=0){
    stdout.write(n%10);
    n = n ~/ 10;
  }

}