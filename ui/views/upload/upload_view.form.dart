// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String TitleInputValueKey = 'titleInput';

final Map<String, TextEditingController> _UploadViewTextEditingControllers = {};

final Map<String, FocusNode> _UploadViewFocusNodes = {};

final Map<String, String? Function(String?)?> _UploadViewTextValidations = {
  TitleInputValueKey: null,
};

mixin $UploadView {
  TextEditingController get titleInputController =>
      _getFormTextEditingController(TitleInputValueKey);

  FocusNode get titleInputFocusNode => _getFormFocusNode(TitleInputValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_UploadViewTextEditingControllers.containsKey(key)) {
      return _UploadViewTextEditingControllers[key]!;
    }

    _UploadViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _UploadViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_UploadViewFocusNodes.containsKey(key)) {
      return _UploadViewFocusNodes[key]!;
    }
    _UploadViewFocusNodes[key] = FocusNode();
    return _UploadViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    titleInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    titleInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          TitleInputValueKey: titleInputController.text,
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

    for (var controller in _UploadViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _UploadViewFocusNodes.values) {
      focusNode.dispose();
    }

    _UploadViewTextEditingControllers.clear();
    _UploadViewFocusNodes.clear();
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

  String? get titleInputValue =>
      this.formValueMap[TitleInputValueKey] as String?;

  set titleInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({TitleInputValueKey: value}),
    );

    if (_UploadViewTextEditingControllers.containsKey(TitleInputValueKey)) {
      _UploadViewTextEditingControllers[TitleInputValueKey]?.text = value ?? '';
    }
  }

  bool get hasTitleInput =>
      this.formValueMap.containsKey(TitleInputValueKey) &&
      (titleInputValue?.isNotEmpty ?? false);

  bool get hasTitleInputValidationMessage =>
      this.fieldsValidationMessages[TitleInputValueKey]?.isNotEmpty ?? false;

  String? get titleInputValidationMessage =>
      this.fieldsValidationMessages[TitleInputValueKey];
}

extension Methods on FormStateHelper {
  setTitleInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TitleInputValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    titleInputValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      TitleInputValueKey: getValidationMessage(TitleInputValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _UploadViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _UploadViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      TitleInputValueKey: getValidationMessage(TitleInputValueKey),
    });
