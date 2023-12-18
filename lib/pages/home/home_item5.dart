import 'package:superlist/common_libs.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeItem5 extends StatefulWidget {
  const HomeItem5({super.key});

  @override
  State<HomeItem5> createState() => _HomeItem5State();
}

class _HomeItem5State extends State<HomeItem5> {
  List<Color> colors = [
    const Color(0xFF33B887),
    const Color(0xFFF74E3A),
    const Color(0xFF8E89FA),
    const Color(0xFF2180D6),
  ];
  List<dynamic> items = [
    {
      'text': 'AI Superpowers',
      'side': 'AI + Superlist = 🔮',
      'bg': const Color(0xFFDEDEEB)
    },
    {
      'text': 'Offline mode',
      'side': 'Keep working, even \nwhen your wi-fi isn’t.',
      'bg': const Color(0xFFCDCDDA)
    },
    {
      'text': 'Collaboration',
      'side': 'Collaborate with your \nteam, friends, or \nclients.',
      'bg': const Color(0xFFBCBCC9)
    },
    {
      'text': 'Real time',
      'side': 'Get things done \ntogether, in real time.',
      'bg': const Color(0xFFABABB8)
    },
    {
      'text': 'Repeating tasks',
      'side': 'Simplify your workflow \nby setting tasks to \nrepeat.',
      'bg': const Color(0xFF9999A7)
    },
    {
      'text': 'Tasks via email',
      'side': 'Turn emails into tasks \nwith the click of a \nbutton.',
      'bg': const Color(0xFF888896)
    },
    {
      'text': 'Reminders',
      'side': 'Never miss a deadline \nwith reminders.',
      'bg': const Color(0xFF777785)
    },
    {
      'text': 'Infinite depth',
      'side': 'Add a subtask, and \nanother one, and \nanother one…',
      'bg': const Color(0xFF666674)
    },
    {
      'text': 'Multiplatform',
      'side': 'Seamlessly work \nacross macOS, iOS, \nAndroid, and web.',
      'bg': const Color(0xFF555563)
    },
    {
      'text': 'Private & secure',
      'side':
          'Superlist is private by \ndefault. Share only \nwhat you want to.',
      'bg': const Color(0xFF444452)
    },
    {
      'text': 'Fast AF',
      'side': 'Work at the speed of \nlight (almost).',
      'bg': const Color(0xFF333341)
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      final visible = controller.homeItem5VisibilityPercentage > 0.6;
      return VisibilityDetector(
        key: const Key("home_item5"),
        onVisibilityChanged: (VisibilityInfo info) {
          controller.setHomeItem5VisibilityPercentage(info.visibleFraction);
        },
        child: AnimatedContainer(
          duration: fastDuration,
          padding: const EdgeInsets.only(
              top: kDefaultPadding * 3,
              bottom: kDefaultPadding * 3,
              left: kDefaultPadding * 8),
          alignment: Alignment.center,
          width: double.infinity,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(color: visible ? blue6 : blue5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: double.infinity),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(text: "Everything\n"),
                      TextSpan(
                        text: "a team needs",
                        style: poppins50wBold.copyWith(color: primaryColor),
                      ),
                    ],
                    style: poppins50wBold.copyWith(color: white2),
                  ),
                  textAlign: TextAlign.start,
                  textScaleFactor: MediaQuery.of(context).textScaleFactor,
                ).fadeInAndMoveFromBottom(),
                verticalSpaceLarge * 2,
                ...items
                    .map((data) => Align(
                        alignment: Alignment.centerLeft,
                        child: buildTextItem(controller, data)))
                    .toList(),
                verticalSpaceLarge,
                Text('The list goes on...',
                        style: poppins15wBold.copyWith(color: Colors.white))
                    .fadeInAndMoveFromBottom()
              ]),
        ),
      );
    });
  }

  InkWell buildTextItem(HomeController controller, data) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {},
      onHover: (value) {
        if (value) {
          int currentIndex = controller.homeItem5ColorIndex + 1;
          currentIndex = colors.length <= currentIndex ? 0 : currentIndex;
          controller.sethomeItem5ColorIndex(currentIndex);
          controller.setHomeItem5HoveredItem(data['text']);
        } else {
          controller.setHomeItem5HoveredItem('');
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            data['text'],
            style: poppins90wBold.copyWith(
                color: controller.homeMenu5HoveredItem == data['text']
                    ? colors[controller.homeItem5ColorIndex]
                    : data['bg']),
          ).fadeInAndMoveFromBottom(),
          horizontalSpaceLarge,
          horizontalSpaceLarge,
          AnimatedSwitcher(
            duration: fastDuration,
            child: controller.homeMenu5HoveredItem == data['text']
                ? Text(data['side'],
                        style: poppins15wBold.copyWith(color: Colors.white))
                    .fadeInAndMoveFromBottom()
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
