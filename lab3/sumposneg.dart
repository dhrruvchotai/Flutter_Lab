import "dart:io";

void main(){
  int sumpos = 0;
  int sumneg = 0;
  while(true){
    int n = int.parse(stdin.readLineSync()!);
    if(n == 0){
      break;
    }
    else if(n>0 && n%2 == 0){
      sumpos = sumpos + n;
    }
    else if(n<0 && n%2 != 0){
      sumneg = sumneg + n;
    }
  }
  print(sumpos);
  print(sumneg);
}
