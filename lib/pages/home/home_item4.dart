import 'package:superlist/common_libs.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeItem4 extends StatefulWidget {
  const HomeItem4({super.key});

  @override
  State<HomeItem4> createState() => _HomeItem4State();
}

class _HomeItem4State extends State<HomeItem4> {
  late VideoPlayerController videoController;
  int current = 0;
  int total = 1;

  @override
  void initState() {
    videoController = VideoPlayerController.asset(video1);

    Future.delayed(Duration.zero, () {
      setUpPlayer();
    });

    super.initState();
  }

  setUpPlayer() async {
    try {
      await videoController.initialize();
      total = videoController.value.duration.inSeconds;
      videoController.play();
      videoController.setLooping(true);
      videoController.addListener(() {
        final currentPosition = videoController.value.position;
        current = currentPosition.inSeconds;
        setState(() {});
      });

      setState(() {});
    } catch (_) {}
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      final visibility = (controller.homeItem4VisibilityPercentage);
      final valid = controller.homeItem4VisibilityPercentage < 0.8;

      const margin = kDefaultMargin * 3;
      final double margin2 = (margin - (margin * visibility)).clamp(0, margin);
      const corner = cornersLarge * 2;
      final double corner2 = (corner - (corner * visibility)).clamp(0, corner);

      final double marginValue = valid ? margin : margin2;
      final double cornerValue = valid ? corner : corner2;

      return VisibilityDetector(
        key: const Key("home_item4"),
        onVisibilityChanged: (VisibilityInfo info) {
          controller.setHomeItem4VisibilityPercentage(info.visibleFraction);
        },
        child: Container(
          width: double.infinity,
          color: Colors.white,
          alignment: Alignment.topCenter,
          height: context.screenHeight,
          child: AnimatedContainer(
            duration: fastDuration,
            height: context.screenHeight,
            margin: EdgeInsets.only(
              left: marginValue,
              right: marginValue,
            ),
            padding: const EdgeInsets.all(margin),
            alignment: Alignment.center,
            width: double.infinity,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: blue5,
              borderRadius: BorderRadius.circular(cornerValue),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: RichText(
                      text: TextSpan(children: [
                        const TextSpan(text: "You've never\n"),
                        const TextSpan(text: "worked "),
                        TextSpan(
                          text: "this fast",
                          style: poppins90wBold.copyWith(color: primaryColor),
                        ),
                      ], style: poppins90wBold.copyWith(color: white2)),
                      textAlign: TextAlign.center,
                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                    ).fadeInAndMoveFromBottom(),
                  ),
                  verticalSpaceLarge,
                  Expanded(
                    child: buildVideo(),
                  ),
                ]),
          ),
        ),
      );
    });
  }

  AspectRatio buildVideo() {
    return AspectRatio(
      aspectRatio: 12 / 7,
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(cornersLarge),
              ),
              child: videoController.value.isInitialized
                  ? VideoPlayer(videoController)
                  : const SizedBox(),
            ).fadeIn(),
          ),
          verticalSpaceLarge,
          buildProgressBar(),
        ],
      ),
    );
  }

  LayoutBuilder buildProgressBar() {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      return Stack(
        children: [
          Container(
              width: width,
              height: 2,
              decoration: BoxDecoration(
                color: grey1,
                borderRadius: BorderRadius.circular(cornersMedium),
              )),
          Positioned(
            left: 0,
            child: AnimatedContainer(
              duration: slowDuration,
              width: width * (current / total),
              height: 2,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(cornersMedium)),
            ),
          ),
        ],
      ).fadeIn();
    });
  }
}
