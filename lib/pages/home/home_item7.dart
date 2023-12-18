import 'package:superlist/common_libs.dart';

class HomeItem7 extends StatefulWidget {
  const HomeItem7({super.key});

  @override
  State<HomeItem7> createState() => _HomeItem7State();
}

class _HomeItem7State extends State<HomeItem7> {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      const padding = kDefaultPadding * 4;
      const padding2 = kDefaultPadding * 2;
      return Container(
        alignment: Alignment.center,
        color: blue6,
        padding: const EdgeInsets.only(top: padding, bottom: padding),
        child: Container(
          width: context.screenWidth * .7,
          padding: const EdgeInsets.only(
              left: padding2, right: padding2, top: padding2, bottom: padding2),
          decoration: BoxDecoration(
              color: blue7, borderRadius: BorderRadius.circular(cornersLarge)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: buildItem(
                      'Superlist',
                      red2,
                      [
                        'Home',
                        'Updates',
                        'Careers',
                        'Suggestions',
                        'Help Center'
                      ],
                      controller),
                ),
                Expanded(
                  child: buildItem(
                      '',
                      Colors.transparent,
                      ['Open Source', 'Cookies', 'Privacy', 'Terms', 'Contact'],
                      controller),
                ),
                Expanded(
                  child: buildItem('App', blue1,
                      ['Mac', 'Web', 'iOS', 'Android'], controller),
                ),
                Expanded(
                  child: buildItem('Social', green1,
                      ['GitHub', 'Linkedln', 'Instagram', 'X'], controller),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Updates',
                                style: poppins15wBold.copyWith(color: purple2))
                            .fadeInAndMoveFromBottom(),
                        verticalSpaceLarge,
                        InkWell(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () {},
                          onHover: (value) {
                            if (value) {
                              controller.setHomeItem7HoveredItem('update');
                            } else {
                              controller.setHomeItem7HoveredItem('');
                            }
                          },
                          child: Transform.scale(
                            scale: controller.homeItem7HoveredItem == 'update'
                                ? 1.1
                                : 1,
                            child: Container(
                              padding: const EdgeInsets.all(kDefaultMargin),
                              decoration: BoxDecoration(
                                color: grey2,
                                borderRadius:
                                    BorderRadius.circular(cornersMedium),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'More \nimprovements \n& bug fixes \n🐛',
                                    style: poppins30wBold.copyWith(color: red2),
                                  ).fadeInAndMoveFromBottom(),
                                  verticalSpaceMedium,
                                  Container(
                                    padding: const EdgeInsets.only(
                                      top: kDefaultPadding / 2,
                                      bottom: kDefaultPadding / 2,
                                      left: kDefaultPadding,
                                      right: kDefaultPadding,
                                    ),
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(
                                            cornersLarge * 2)),
                                    child: Text(
                                      'v 0.32.0',
                                      style: poppins12w600.copyWith(
                                          color: Colors.white),
                                    ).fadeInAndMoveFromBottom(),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
        ),
      );
    });
  }

  Widget buildItem(String title, Color color, List<String> items,
      HomeController controller) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: poppins15wBold.copyWith(color: color))
              .fadeInAndMoveFromBottom(),
          verticalSpaceLarge,
          ...items
              .map((text) => InkWell(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {},
                    onHover: (value) {
                      if (value) {
                        controller.setHomeItem7HoveredItem(text);
                      } else {
                        controller.setHomeItem7HoveredItem('');
                      }
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(bottom: kDefaultMargin * 1.5),
                      child: Text(text,
                              style: poppins12w600.copyWith(
                                  color: controller.homeItem7HoveredItem == text
                                      ? grey3
                                      : white3,
                                  fontWeight: FontWeight.w500))
                          .fadeInAndMoveFromBottom(),
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
