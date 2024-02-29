// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String BioInputValueKey = 'bioInput';
const String EmailInputValueKey = 'emailInput';

final Map<String, TextEditingController>
    _EditProfileViewTextEditingControllers = {};

final Map<String, FocusNode> _EditProfileViewFocusNodes = {};

final Map<String, String? Function(String?)?> _EditProfileViewTextValidations =
    {
  BioInputValueKey: null,
  EmailInputValueKey: null,
};

mixin $EditProfileView {
  TextEditingController get bioInputController =>
      _getFormTextEditingController(BioInputValueKey);
  TextEditingController get emailInputController =>
      _getFormTextEditingController(EmailInputValueKey);

  FocusNode get bioInputFocusNode => _getFormFocusNode(BioInputValueKey);
  FocusNode get emailInputFocusNode => _getFormFocusNode(EmailInputValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_EditProfileViewTextEditingControllers.containsKey(key)) {
      return _EditProfileViewTextEditingControllers[key]!;
    }

    _EditProfileViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _EditProfileViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_EditProfileViewFocusNodes.containsKey(key)) {
      return _EditProfileViewFocusNodes[key]!;
    }
    _EditProfileViewFocusNodes[key] = FocusNode();
    return _EditProfileViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    bioInputController.addListener(() => _updateFormData(model));
    emailInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    bioInputController.addListener(() => _updateFormData(model));
    emailInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          BioInputValueKey: bioInputController.text,
          EmailInputValueKey: emailInputController.text,
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

    for (var controller in _EditProfileViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _EditProfileViewFocusNodes.values) {
      focusNode.dispose();
    }

    _EditProfileViewTextEditingControllers.clear();
    _EditProfileViewFocusNodes.clear();
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

  String? get bioInputValue => this.formValueMap[BioInputValueKey] as String?;
  String? get emailInputValue =>
      this.formValueMap[EmailInputValueKey] as String?;

  set bioInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({BioInputValueKey: value}),
    );

    if (_EditProfileViewTextEditingControllers.containsKey(BioInputValueKey)) {
      _EditProfileViewTextEditingControllers[BioInputValueKey]?.text =
          value ?? '';
    }
  }

  set emailInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailInputValueKey: value}),
    );

    if (_EditProfileViewTextEditingControllers.containsKey(
        EmailInputValueKey)) {
      _EditProfileViewTextEditingControllers[EmailInputValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasBioInput =>
      this.formValueMap.containsKey(BioInputValueKey) &&
      (bioInputValue?.isNotEmpty ?? false);
  bool get hasEmailInput =>
      this.formValueMap.containsKey(EmailInputValueKey) &&
      (emailInputValue?.isNotEmpty ?? false);

  bool get hasBioInputValidationMessage =>
      this.fieldsValidationMessages[BioInputValueKey]?.isNotEmpty ?? false;
  bool get hasEmailInputValidationMessage =>
      this.fieldsValidationMessages[EmailInputValueKey]?.isNotEmpty ?? false;

  String? get bioInputValidationMessage =>
      this.fieldsValidationMessages[BioInputValueKey];
  String? get emailInputValidationMessage =>
      this.fieldsValidationMessages[EmailInputValueKey];
}

extension Methods on FormStateHelper {
  setBioInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BioInputValueKey] = validationMessage;
  setEmailInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailInputValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    bioInputValue = '';
    emailInputValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      BioInputValueKey: getValidationMessage(BioInputValueKey),
      EmailInputValueKey: getValidationMessage(EmailInputValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _EditProfileViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _EditProfileViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      BioInputValueKey: getValidationMessage(BioInputValueKey),
      EmailInputValueKey: getValidationMessage(EmailInputValueKey),
    });
