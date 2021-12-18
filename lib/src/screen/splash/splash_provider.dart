import 'package:app2/src/application.dart';

class SplashProvider extends ChangeNotifier {
  AnimationController? controller;

  void initController(TickerProvider tickerProvider) {
    controller = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(milliseconds: 800),
    );
    notifyListeners();
  }

  bool firstAnimation = true;
  void runAnimation() {
    if (firstAnimation) {
      controller
        ?..reset()
        ..forward();
    } else {
      controller?.reverse();
    }

    firstAnimation = !firstAnimation;
  }
}
