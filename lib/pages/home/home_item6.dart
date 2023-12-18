import 'package:superlist/common_libs.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeItem6 extends StatefulWidget {
  const HomeItem6({super.key});

  @override
  State<HomeItem6> createState() => _HomeItem6State();
}

class _HomeItem6State extends State<HomeItem6> {
  List<Color> colors = [
    const Color(0xFF33B887),
    const Color(0xFFF74E3A),
    const Color(0xFF8E89FA),
    const Color(0xFF2180D6),
  ];

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      final visibility = (controller.homeItem6VisibilityPercentage);
      final valid = controller.homeItem6VisibilityPercentage < 0.6;

      const margin = kDefaultMargin * 6;
      const corner = cornersLarge * 6;
      final double margin2 = margin + (margin * visibility);
      final double corner2 = corner + (corner * visibility);

      final double marginValue = valid ? margin : margin2;
      final double cornerValue = valid ? corner : corner2;

      return AnimatedContainer(
        height: context.screenHeight,
        duration: fastDuration,
        padding: const EdgeInsets.only(
            top: kDefaultPadding * 2, bottom: kDefaultPadding * 2),
        alignment: Alignment.center,
        width: double.infinity,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(color: blue6),
        child: VisibilityDetector(
          key: const Key("home_item6"),
          onVisibilityChanged: (VisibilityInfo info) {
            controller.setHomeItem6VisibilityPercentage(info.visibleFraction);
            if (controller.homeItem6VisibilityPercentage > 0.3 &&
                controller.homeItem6VisibilityPercentage < 0.7) {
              colors.shuffle();
              setState(() {});
            }
          },
          child: AnimatedContainer(
            duration: fastDuration,
            height: 800,
            margin: EdgeInsets.only(left: marginValue, right: marginValue),
            padding: const EdgeInsets.all(margin),
            alignment: Alignment.center,
            width: double.infinity,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                color: colors[0],
                borderRadius: BorderRadius.circular(cornerValue)),
            child: Text(
              'Join our Beta',
              style: poppins50wBold.copyWith(color: Colors.white),
            ).fadeInAndMoveFromBottom(),
          ),
        ),
      );
    });
  }
}
