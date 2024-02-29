import 'package:stacked/stacked.dart';

class MainViewModel extends IndexTrackingViewModel {
  void onItemTapped(int index) {
    if (currentIndex == index) return;

    setIndex(index);
  }
}
