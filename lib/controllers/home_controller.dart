import 'package:superlist/common_libs.dart';

class HomeController extends GetxController {
  bool attachItem3Scroll = false;
  bool attachItem4Scroll = false;
  bool attachItem5Scroll = false;
  bool attachItem6Scroll = false;

  final Rx<PageController> _pageController = PageController(initialPage: 0).obs;
  PageController get pageController => _pageController.value;

  Timer? timer;

  final RxBool _signInHovered = false.obs;
  final RxBool _homeCheckHovered = false.obs;
  final RxBool _isDonwloadItemVisible = false.obs;
  final RxBool _downlaodItem1Hovered = false.obs;
  final RxBool _isScrollingUp = false.obs;

  final RxString _selectedHomeMenu1 = 'Teamwork'.obs;
  final RxString _downloadItem2Hovered = 'macOS'.obs;
  final RxString _homeMenu1HoveredItem = ''.obs;
  final RxString _homeMenu2HoveredItem = ''.obs;
  final RxString _homeMenu5HoveredItem = ''.obs;
  final RxString _homeItem7HoveredItem = ''.obs;

  final RxInt _homeItem5ColorIndex = 0.obs;

  final RxDouble _homeItem3VisibilityPercentage = 0.0.obs;
  final RxDouble _homeItem4VisibilityPercentage = 0.0.obs;
  final RxDouble _homeItem5VisibilityPercentage = 0.0.obs;
  final RxDouble _homeItem6VisibilityPercentage = 0.0.obs;

  int get homeItem5ColorIndex => _homeItem5ColorIndex.value;

  double get homeItem3VisibilityPercentage =>
      _homeItem3VisibilityPercentage.value;
  double get homeItem4VisibilityPercentage =>
      _homeItem4VisibilityPercentage.value;
  double get homeItem5VisibilityPercentage =>
      _homeItem5VisibilityPercentage.value;
  double get homeItem6VisibilityPercentage =>
      _homeItem6VisibilityPercentage.value;

  bool get isScrollingUp => _isScrollingUp.value;
  bool get signInHovered => _signInHovered.value;
  bool get homeCheckHovered => _homeCheckHovered.value;
  bool get isDonwloadItemVisible => _isDonwloadItemVisible.value;
  bool get downlaodItem1Hovered => _downlaodItem1Hovered.value;

  String get downloadItem2Hovered => _downloadItem2Hovered.value;
  String get selectedHomeMenu1 => _selectedHomeMenu1.value;

  RxString get selectedHomeMenu1Rx => _selectedHomeMenu1;

  String get homeMenu1HoveredItem => _homeMenu1HoveredItem.value;
  String get homeMenu2HoveredItem => _homeMenu2HoveredItem.value;
  String get homeMenu5HoveredItem => _homeMenu5HoveredItem.value;
  String get homeItem7HoveredItem => _homeItem7HoveredItem.value;

  initTimer() => runTimer();

  runTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      final text = selectedHomeMenu1 == 'Teamwork'
          ? 'Personal projects'
          : selectedHomeMenu1 == 'Personal projects'
              ? 'Everything in between'
              : 'Teamwork';
      _selectedHomeMenu1(text);
    });
  }

  setIsScrollingUp(bool hover) => _isScrollingUp(hover);

  setSignInHover(bool hover) => _signInHovered(hover);

  setHomeItem3VisibilityPercentage(double value) {
    final previous = homeItem3VisibilityPercentage;
    final check1 = (value - previous).abs() > .05 || value > 0.9;
    final check2 = !isScrollingUp &&
        (attachItem3Scroll ||
            value >=
                0.4); // to solve a revese error that occurs when the item is on top.
    final check3 = isScrollingUp && value > previous;
    if (check1) {
      if (check3 || check2) {
        attachItem3Scroll = true;
        _homeItem3VisibilityPercentage(value > 0.9 ? 1 : value);
      } else {
        attachItem3Scroll = false;
      }
    }
  }

  setHomeItem4VisibilityPercentage(double value) {
    final previous = homeItem4VisibilityPercentage;
    final check1 = (value - previous).abs() > .05 || value > 0.9;
    final check2 = !isScrollingUp &&
        (attachItem4Scroll ||
            value >=
                0.8); // to solve a revese error that occurs when the item is on top.
    final check3 = isScrollingUp && value > previous;

    if (check1) {
      if (check3 || check2) {
        attachItem4Scroll = true;
        _homeItem4VisibilityPercentage(value > 0.9 ? 1 : value);
      } else {
        attachItem4Scroll = false;
      }
    }
  }

  setHomeItem5VisibilityPercentage(double value) {
    final previous = homeItem5VisibilityPercentage;

    final check1 = (value - previous).abs() > .05 || value > 0.9;
    final check2 = !isScrollingUp &&
        (attachItem5Scroll ||
            value >=
                0.6); // to solve a revese error that occurs when the item is on top.
    final check3 = isScrollingUp && value > previous;

    if (check1) {
      if (check3 || check2) {
        attachItem5Scroll = true;
        _homeItem5VisibilityPercentage(value > 0.9 ? 1 : value);
      } else {
        attachItem5Scroll = false;
      }
    }
  }

  setHomeItem6VisibilityPercentage(double value) {
    final previous = homeItem6VisibilityPercentage;

    final check1 = (value - previous).abs() > .05 || value > 0.9;
    final check2 = !isScrollingUp &&
        (attachItem6Scroll ||
            value >=
                0.6); // to solve a revese error that occurs when the item is on top.
    final check3 = isScrollingUp && value > previous;
    if (check1) {
      if (check3 || check2) {
        attachItem6Scroll = true;
        _homeItem6VisibilityPercentage(value > 0.9 ? 1 : value);
      } else {
        attachItem6Scroll = false;
      }
    }
  }

  setDonwloadItemVisible(bool visible) => _isDonwloadItemVisible(visible);

  setHomeCheckHovered(bool hover) => _homeCheckHovered(hover);

  setDownlaodItem1Hovered(bool hover) => _downlaodItem1Hovered(hover);

  setDownlaodItem2Hovered(String text) => _downloadItem2Hovered(text);

  setSelectedHomeMenu1(String text) {
    if (text.isEmpty) return;
    _selectedHomeMenu1(text);
    runTimer();
  }

  setHomeMenu1HoveredItem(String text) => _homeMenu1HoveredItem(text);

  setHomeMenu2HoveredItem(String text) => _homeMenu2HoveredItem(text);

  setHomeItem5HoveredItem(String text) => _homeMenu5HoveredItem(text);

  setHomeItem7HoveredItem(String text) => _homeItem7HoveredItem(text);

  sethomeItem5ColorIndex(int index) => _homeItem5ColorIndex(index);
}
