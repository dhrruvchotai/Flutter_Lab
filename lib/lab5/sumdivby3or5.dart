import "dart:io";

void main() {
  List<int> lst1 = [];

  int n = int.parse(stdin.readLineSync()!);
  int sum = 0;

  for (int i = 0; i < n; i++) {
    print("Enter a number in list 1 at $i ");
    lst1.add(int.parse(stdin.readLineSync()!));
  }
  for (int i = 0; i < n; i++) {
    if(lst1[i] % 3 == 0 || lst1[i] % 5 == 0){
      sum += lst1[i];
    }
  }
  print(sum);
}