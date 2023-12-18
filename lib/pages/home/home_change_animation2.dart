import 'dart:math';
import 'package:superlist/common_libs.dart';

class HomeChangeAnimation2 extends StatefulWidget {
  const HomeChangeAnimation2({Key? key}) : super(key: key);

  @override
  State<HomeChangeAnimation2> createState() => _HomeChangeAnimation2State();
}

class _HomeChangeAnimation2State extends State<HomeChangeAnimation2>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _animation;
  int index = 0;

  @override
  void initState() {
    controller = AnimationController(duration: fastDuration, vsync: this);

    _animation = Tween<double>(begin: 0.0, end: 40.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        final text = Get.find<HomeController>().selectedHomeMenu1;
        index = text == 'Teamwork'
            ? 0
            : text == 'Personal projects'
                ? 1
                : 2;
        setState(() {});
        controller.reverse();
      }
    });

    Get.find<HomeController>().selectedHomeMenu1Rx.listen((_) {
      if (controller.isAnimating) {
        controller.reset();
      }
      controller.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final image = index == 0
        ? image2
        : index == 1
            ? image3
            : image4;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0.0, _animation.value),
          child: Opacity(
            opacity: min(1, 1 - controller.value),
            child: Image.asset(image,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.contain),
          ),
        );
      },
    );
  }
}
