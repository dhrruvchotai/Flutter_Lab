import "dart:io";

void main(){
  print("Enter a string : ");
  String str = stdin.readLineSync()!;

  List<String> elmts = str.split(" ");

  for(int i=0;i<elmts.length;i++){
    while(elmts.contains('/')){
      int indx = elmts.lastIndexOf("/");
      int a = int.parse(elmts[indx-1]);
      int b = int.parse(elmts[indx+1]);
      int ans = a~/b;
      elmts.removeRange(indx-1,indx+2);
      elmts.insert(indx - 1, ans.toString());
    }
    while(elmts.contains("*")){
      int indx = elmts.lastIndexOf("*");
      int a = int.parse(elmts[indx-1]);
      int b = int.parse(elmts[indx+1]);
      int ans = a*b;
      elmts.removeRange(indx-1,indx+2);
      elmts.insert(indx - 1, ans.toString());
    }
    while(elmts.contains("+")){
      int indx = elmts.lastIndexOf("+");
      int a = int.parse(elmts[indx-1]);
      int b = int.parse(elmts[indx+1]);
      int ans = a+b;
      elmts.removeRange(indx-1,indx+2);
      elmts.insert(indx - 1, ans.toString());
    }
    while(elmts.contains("-")){
      int indx = elmts.lastIndexOf("-");
      int a = int.parse(elmts[indx-1]);
      int b = int.parse(elmts[indx+1]);
      int ans = a-b;
      elmts.removeRange(indx-1,indx+2);
      elmts.insert(indx - 1, ans.toString());
    }
  }

  print(elmts[0]);

}

