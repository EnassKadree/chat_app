import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Widget page) 
{
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}