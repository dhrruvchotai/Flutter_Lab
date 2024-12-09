import "dart:io";

void main(){
  print("Enter n : ");
  int n = int.parse(stdin.readLineSync()!);
  int flag = 1;

  for(int i=2;i<=(n/2);i++){
    if(n%i == 0){
      flag = 0;
    }
  }
  if(flag == 0){
    print("${n} is not prime");
  }
  else{
    print("${n} is prime");
  }

}