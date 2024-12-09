import "dart:io";

void main(){
  List<int> lst = [];
  List<int> ans = [];

  print("Enter size : ");
  int n = int.parse(stdin.readLineSync()!);

  for(int i=0;i<n;i++){
    print("Enter a number at $i ");
    lst.add(int.parse(stdin.readLineSync()!));
  }

  print("Enter your target : ");
  int target = int.parse(stdin.readLineSync()!);

  for(int i=0;i<n-1;i++){
    for(int j=i+1;j<n;j++){
      if(lst[i]+lst[j] == target){
          ans.add(i);
          ans.add(j);
      }
    }
  }

  print(ans);

}