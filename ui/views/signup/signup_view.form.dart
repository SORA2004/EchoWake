// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String NameInputValueKey = 'nameInput';
const String EmailInputValueKey = 'emailInput';
const String PasswordInputValueKey = 'passwordInput';
const String ConfirmPasswordInputValueKey = 'confirmPasswordInput';

final Map<String, TextEditingController> _SignupViewTextEditingControllers = {};

final Map<String, FocusNode> _SignupViewFocusNodes = {};

final Map<String, String? Function(String?)?> _SignupViewTextValidations = {
  NameInputValueKey: null,
  EmailInputValueKey: null,
  PasswordInputValueKey: null,
  ConfirmPasswordInputValueKey: null,
};

mixin $SignupView {
  TextEditingController get nameInputController =>
      _getFormTextEditingController(NameInputValueKey);
  TextEditingController get emailInputController =>
      _getFormTextEditingController(EmailInputValueKey);
  TextEditingController get passwordInputController =>
      _getFormTextEditingController(PasswordInputValueKey);
  TextEditingController get confirmPasswordInputController =>
      _getFormTextEditingController(ConfirmPasswordInputValueKey);

  FocusNode get nameInputFocusNode => _getFormFocusNode(NameInputValueKey);
  FocusNode get emailInputFocusNode => _getFormFocusNode(EmailInputValueKey);
  FocusNode get passwordInputFocusNode =>
      _getFormFocusNode(PasswordInputValueKey);
  FocusNode get confirmPasswordInputFocusNode =>
      _getFormFocusNode(ConfirmPasswordInputValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_SignupViewTextEditingControllers.containsKey(key)) {
      return _SignupViewTextEditingControllers[key]!;
    }

    _SignupViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _SignupViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_SignupViewFocusNodes.containsKey(key)) {
      return _SignupViewFocusNodes[key]!;
    }
    _SignupViewFocusNodes[key] = FocusNode();
    return _SignupViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    nameInputController.addListener(() => _updateFormData(model));
    emailInputController.addListener(() => _updateFormData(model));
    passwordInputController.addListener(() => _updateFormData(model));
    confirmPasswordInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    nameInputController.addListener(() => _updateFormData(model));
    emailInputController.addListener(() => _updateFormData(model));
    passwordInputController.addListener(() => _updateFormData(model));
    confirmPasswordInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          NameInputValueKey: nameInputController.text,
          EmailInputValueKey: emailInputController.text,
          PasswordInputValueKey: passwordInputController.text,
          ConfirmPasswordInputValueKey: confirmPasswordInputController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _SignupViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _SignupViewFocusNodes.values) {
      focusNode.dispose();
    }

    _SignupViewTextEditingControllers.clear();
    _SignupViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get nameInputValue => this.formValueMap[NameInputValueKey] as String?;
  String? get emailInputValue =>
      this.formValueMap[EmailInputValueKey] as String?;
  String? get passwordInputValue =>
      this.formValueMap[PasswordInputValueKey] as String?;
  String? get confirmPasswordInputValue =>
      this.formValueMap[ConfirmPasswordInputValueKey] as String?;

  set nameInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NameInputValueKey: value}),
    );

    if (_SignupViewTextEditingControllers.containsKey(NameInputValueKey)) {
      _SignupViewTextEditingControllers[NameInputValueKey]?.text = value ?? '';
    }
  }

  set emailInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailInputValueKey: value}),
    );

    if (_SignupViewTextEditingControllers.containsKey(EmailInputValueKey)) {
      _SignupViewTextEditingControllers[EmailInputValueKey]?.text = value ?? '';
    }
  }

  set passwordInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PasswordInputValueKey: value}),
    );

    if (_SignupViewTextEditingControllers.containsKey(PasswordInputValueKey)) {
      _SignupViewTextEditingControllers[PasswordInputValueKey]?.text =
          value ?? '';
    }
  }

  set confirmPasswordInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ConfirmPasswordInputValueKey: value}),
    );

    if (_SignupViewTextEditingControllers.containsKey(
        ConfirmPasswordInputValueKey)) {
      _SignupViewTextEditingControllers[ConfirmPasswordInputValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasNameInput =>
      this.formValueMap.containsKey(NameInputValueKey) &&
      (nameInputValue?.isNotEmpty ?? false);
  bool get hasEmailInput =>
      this.formValueMap.containsKey(EmailInputValueKey) &&
      (emailInputValue?.isNotEmpty ?? false);
  bool get hasPasswordInput =>
      this.formValueMap.containsKey(PasswordInputValueKey) &&
      (passwordInputValue?.isNotEmpty ?? false);
  bool get hasConfirmPasswordInput =>
      this.formValueMap.containsKey(ConfirmPasswordInputValueKey) &&
      (confirmPasswordInputValue?.isNotEmpty ?? false);

  bool get hasNameInputValidationMessage =>
      this.fieldsValidationMessages[NameInputValueKey]?.isNotEmpty ?? false;
  bool get hasEmailInputValidationMessage =>
      this.fieldsValidationMessages[EmailInputValueKey]?.isNotEmpty ?? false;
  bool get hasPasswordInputValidationMessage =>
      this.fieldsValidationMessages[PasswordInputValueKey]?.isNotEmpty ?? false;
  bool get hasConfirmPasswordInputValidationMessage =>
      this.fieldsValidationMessages[ConfirmPasswordInputValueKey]?.isNotEmpty ??
      false;

  String? get nameInputValidationMessage =>
      this.fieldsValidationMessages[NameInputValueKey];
  String? get emailInputValidationMessage =>
      this.fieldsValidationMessages[EmailInputValueKey];
  String? get passwordInputValidationMessage =>
      this.fieldsValidationMessages[PasswordInputValueKey];
  String? get confirmPasswordInputValidationMessage =>
      this.fieldsValidationMessages[ConfirmPasswordInputValueKey];
}

extension Methods on FormStateHelper {
  setNameInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameInputValueKey] = validationMessage;
  setEmailInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailInputValueKey] = validationMessage;
  setPasswordInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PasswordInputValueKey] = validationMessage;
  setConfirmPasswordInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ConfirmPasswordInputValueKey] =
          validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    nameInputValue = '';
    emailInputValue = '';
    passwordInputValue = '';
    confirmPasswordInputValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      NameInputValueKey: getValidationMessage(NameInputValueKey),
      EmailInputValueKey: getValidationMessage(EmailInputValueKey),
      PasswordInputValueKey: getValidationMessage(PasswordInputValueKey),
      ConfirmPasswordInputValueKey:
          getValidationMessage(ConfirmPasswordInputValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _SignupViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _SignupViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      NameInputValueKey: getValidationMessage(NameInputValueKey),
      EmailInputValueKey: getValidationMessage(EmailInputValueKey),
      PasswordInputValueKey: getValidationMessage(PasswordInputValueKey),
      ConfirmPasswordInputValueKey:
          getValidationMessage(ConfirmPasswordInputValueKey),
    });
