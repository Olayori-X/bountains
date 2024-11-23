import 'package:flutter/material.dart';

bool validateAndSaveForm(GlobalKey<FormState> formKey) {
  FormState? currentState = formKey.currentState;
  if (currentState != null) {
    if (!currentState.validate()) return false;

    currentState.save();
    return true;
  }
  return false;
}
