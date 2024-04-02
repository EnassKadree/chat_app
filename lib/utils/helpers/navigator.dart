import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Widget page) 
{
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

void navigateRemoveUntil(BuildContext context, Widget page) 
{
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => page), (route) => false);
}

void pop(BuildContext context) 
{
  if(Navigator.of(context).canPop())
  {
    Navigator.of(context).pop();
  }
}
