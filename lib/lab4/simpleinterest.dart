import "dart:io";

void main(){
  print("Enter p : ");
  double p = double.parse(stdin.readLineSync()!);

  print("Enter r : ");
  double r = double.parse(stdin.readLineSync()!);

  print("Enter n : ");
  double n = double.parse(stdin.readLineSync()!);

  double ans = si(p,r,n);
  print("Ans is ${ans}");

}
double si(double p,double r,double n){
  return (p*r*n)/100;
}