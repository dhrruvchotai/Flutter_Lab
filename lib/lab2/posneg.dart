import "dart:io";

void main(){
  print("Enter num : ");
  int a = int.parse(stdin.readLineSync()!);

  if(a > 0){
    print("Number is positive.");
  }
  else{
    print("Number is negative");
  }
}