import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({super.key});

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경 색상을 흰색으로 설정
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/AppIcon-1024x+(7).png',
              width: 120.0, // 이미지 너비를 120픽셀로 설정
              height: 120.0, // 이미지 높이를 120픽셀로 설정
            ),
            const SizedBox(height: 20),
            const Text(
              'Blissom',
              style: TextStyle(
                color: Colors.lightBlue, // 텍스트 색상을 lightBlue로 설정
                fontSize: 24.0, // 텍스트 크기를 24픽셀로 설정
                fontWeight: FontWeight.bold, // 굵은 글씨체
              ),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(), // 로딩 인디케이터
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
