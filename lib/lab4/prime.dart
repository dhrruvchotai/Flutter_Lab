import 'dart:io';

void main(){
  print("Enter n : ");
  int n = int.parse(stdin.readLineSync()!);
  int ans = check(n);

  if(ans == 1){
    print("Num is prime");
  }
  else{
    print("Num is not prime");
  }
}

int check(int n){
  int flag = 1;
  for(int i=2;i<=n/2;i++){
      if(n%i == 0) flag = 0;
  }
  if(flag == 0) return 0;
  return 1;
}
