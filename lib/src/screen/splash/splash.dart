import 'package:app2/src/application.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late SplashProvider provider;

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () => provider.initController(this),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = context.watch<SplashProvider>();
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: provider.runAnimation,
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            size: 100,
            progress: provider.controller ?? AnimationController(vsync: this),
          ),
        ),
      ),
    );
  }
}
