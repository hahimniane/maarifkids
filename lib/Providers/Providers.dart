import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../enums.dart';
import '../theme.dart';

class ThemeProvider extends ChangeNotifier{
  // UserType userType=UserType.parent;
 ThemeData activeThemeData= ParentTheme.lightTheme();

  changeUserType(UserType newUserType){

    activeThemeData=newUserType==UserType.parent? ParentTheme.lightTheme():AdminTheme.lightTheme();
    print('the current theme data is ${activeThemeData}');


  notifyListeners();

  }
}