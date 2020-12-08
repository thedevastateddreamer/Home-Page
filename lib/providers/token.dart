import 'package:flutter/cupertino.dart';

class Token with ChangeNotifier {
  int tokenNo = 0;
  int getTokenNumber(){
    return tokenNo;
  }

  void updateToken(int currentToken) {
    tokenNo = currentToken;
    notifyListeners();
  }
}
