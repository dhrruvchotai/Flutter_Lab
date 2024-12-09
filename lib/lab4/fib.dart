import 'dart:io';

void main(){

  print("Enter num : ");
  int n = int.parse(stdin.readLineSync()!);
  printfib(n);

}
void printfib(int n,{int a = 0,int b = 1}){

  int i = 2;
  stdout.write("${a} + ${b}");

 while(i < n){
   int sum = a+b;
   stdout.write(" + ${sum}");
   a = b;
   b = sum;
   i++;
 }

}