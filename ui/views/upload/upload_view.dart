import 'dart:io';

import 'package:echowake/ui/views/upload/upload_view.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'upload_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'titleInput'),
])
class UploadView extends StackedView<UploadViewModel> with $UploadView {
  final VoidCallback onUploadComplete;

  const UploadView({
    super.key,
    required this.onUploadComplete,
  });

  @override
  Widget builder(
    BuildContext context,
    UploadViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('업로드'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '오디오 제목',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: titleInputController,
                    decoration: const InputDecoration(
                      hintText: '오디오 제목을 입력해주세요',
                      labelText: '오디오 제목',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '오디오 업로드',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Center(
                child: GestureDetector(
                  onTap: () => viewModel.pickAudio(),
                  child: Container(
                    width: 350,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.black, width: 1.0),
                    ),
                    child: viewModel.audioPath != null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Icon(
                                Icons.music_note,
                                size: 50,
                                color: Colors.blue,
                              ),
                              Text(
                                viewModel.audioPath!.split('/').last,
                                textAlign: TextAlign.center,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      viewModel.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                    ),
                                    onPressed: () => viewModel.toggleAudio(),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : const Icon(
                            Icons.cloud_upload,
                            size: 80,
                            color: Colors.lightBlueAccent,
                          ),
                  ),
                ),
              ),

              const SizedBox(height: 20), // 이 부분이 수정된 부분입니다.
              const Text(
                '썸네일 업로드',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Center(
                child: GestureDetector(
                  onTap: () => viewModel.pickThumbnailImage(),
                  child: Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black, width: 1.0),
                    ),
                    child: viewModel.thumbnailPath != null
                        ? Image.file(File(viewModel.thumbnailPath!))
                        : const Center(
                            child: Icon(
                              Icons.image,
                              size: 60,
                              color: Colors.grey,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "터치하여 썸네일 이미지를 바꿔보세요",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: viewModel.isBusy
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () =>
                            viewModel.uploadAndNavigate(onUploadComplete),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        child: const Text('업로드하기'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  UploadViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UploadViewModel();

  @override
  void onViewModelReady(UploadViewModel viewModel) {
    super.onViewModelReady(viewModel);
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(UploadViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
