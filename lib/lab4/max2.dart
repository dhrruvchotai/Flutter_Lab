import "dart:io";

void main(){
  print("Enter a : ");
  int a = int.parse(stdin.readLineSync()!);

  print("Enter b : ");
  int b = int.parse(stdin.readLineSync()!);

  int ans = max(a,b);
  print("Ans is : ${ans}");

}
int max(int a,int b){
  if(a>b){
    return a;
  }
  return b;
}
