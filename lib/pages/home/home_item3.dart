import 'package:superlist/common_libs.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeItem3 extends StatefulWidget {
  const HomeItem3({super.key});

  @override
  State<HomeItem3> createState() => _HomeItem3State();
}

class _HomeItem3State extends State<HomeItem3> {
  final List<Map<String, dynamic>> items = [
    {
      'color': purple1,
      'color2': blue2,
      'image': image5,
      'texts': [
        {'text': 'Tasks, notes\n', 'colored': true},
        {'text': '& everything\n', 'colored': false},
        {'text': 'in between.', 'colored': false},
      ],
    },
    {
      'color': green1,
      'color2': green2,
      'image': image6,
      'texts': [
        {'text': 'Integrated\n', 'colored': true},
        {'text': 'with apps\n', 'colored': false},
        {'text': 'you love.', 'colored': false},
      ],
    },
    {
      'color': red2,
      'color2': red1,
      'image': image7,
      'texts': [
        {'text': 'Work &\n', 'colored': true},
        {'text': 'personal\n', 'colored': true},
        {'text': 'at the flip\n', 'colored': false},
        {'text': 'of a switch.', 'colored': false},
      ],
    },
    {
      'color': blue4,
      'color2': blue3,
      'image': image8,
      'texts': [
        {'text': 'Perfect for\n', 'colored': false},
        {'text': 'teams and\n', 'colored': true},
        {'text': 'solo users.', 'colored': true},
      ],
    },
    {
      'color': red4,
      'color2': red3,
      'image': image9,
      'texts': [
        {'text': 'Private\n', 'colored': true},
        {'text': 'until you\n', 'colored': false},
        {'text': 'are ready.', 'colored': false},
      ],
    },
  ];

  final pageController = PageController();
  int currentPosition = 0;
  double pagePosition = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(_listener);
  }

  _listener() {
    pagePosition = pageController.page ?? 0;
    currentPosition = pageController.page?.floor() ?? 0;
    setState(() {});
  }

  @override
  void dispose() {
    pageController.removeListener(_listener);
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      bool visibilityValid = controller.homeItem3VisibilityPercentage > 0.4;
      return VisibilityDetector(
        key: const Key("home_item3"),
        onVisibilityChanged: (VisibilityInfo info) {
          controller.setHomeItem3VisibilityPercentage(info.visibleFraction);
        },
        child: AnimatedContainer(
          duration: fastDuration,
          width: double.infinity,
          color: visibilityValid ? Colors.white : backgroundColor,
          alignment: Alignment.center,
          height: context.screenHeight,
          padding: const EdgeInsets.only(
              left: kDefaultMargin * 3, right: kDefaultMargin * 3),
          child: !visibilityValid ? const SizedBox() : buildBody(),
        ),
      );
    });
  }

  Container buildBody() {
    return Container(
        height: context.screenHeight * .8,
        alignment: Alignment.center,
        width: double.infinity,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cornersLarge * 2)),
        child: PageView.builder(
          itemCount: items.length,
          scrollDirection: Axis.vertical,
          controller: pageController,
          itemBuilder: (context, index) => buildPageviewItem(index),
        ));
  }

  LayoutBuilder buildPageviewItem(int index) {
    return LayoutBuilder(builder: (context, constraints) {
      final item = items[index];
      final size = constraints.maxHeight;
      final delta = (pagePosition - index).abs();
      final offset = Offset(0, index <= currentPosition ? (size * delta) : 0);

      return Transform.translate(
        offset: offset,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: item['color2'],
            borderRadius: BorderRadius.circular(cornersLarge * 2),
          ),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        children: (item['texts'] as List)
                            .map((text) => TextSpan(
                                  text: text['text'],
                                  style: poppins50wBold.copyWith(
                                      color: text['colored']
                                          ? item['color']
                                          : null),
                                ))
                            .toList(),
                        style: poppins50wBold),
                    textAlign: TextAlign.center,
                    textScaleFactor: MediaQuery.of(context).textScaleFactor,
                  ).fadeIn(),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: item['color'],
                  child: Image.asset(item['image']).fadeIn(),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
