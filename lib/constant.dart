import 'package:flutter/material.dart';

const usernameInputDecoration = InputDecoration(
  label: Text('Username'),
  prefixIcon: Icon(Icons.people),
  focusedBorder: OutlineInputBorder(),
  enabledBorder: OutlineInputBorder(),
  errorBorder: OutlineInputBorder(),
);

const passwordInputDecoration = InputDecoration(
  label: Text('Password'),
  prefixIcon: Icon(Icons.lock),
  focusedBorder: OutlineInputBorder(),
  enabledBorder: OutlineInputBorder(),
  errorBorder: OutlineInputBorder(),
);
