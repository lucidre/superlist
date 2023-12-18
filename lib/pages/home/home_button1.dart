import 'package:superlist/common_libs.dart';

class HomeButton1 extends StatelessWidget {
  const HomeButton1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildItem('Teamwork', blue1, controller),
          horizontalSpacer24,
          buildItem('Personal projects', primaryColor, controller),
          horizontalSpacer24,
          buildItem('Everything in between', green1, controller),
        ],
      );
    });
  }

  buildItem(String text, Color color, HomeController controller) {
    final selected = text == controller.selectedHomeMenu1;
    final hovered = text == controller.homeMenu1HoveredItem;

    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        controller.setSelectedHomeMenu1(text);
      },
      onHover: (value) {
        if (value) {
          controller.setHomeMenu1HoveredItem(text);
        } else {
          controller.setHomeMenu1HoveredItem('');
        }
      },
      child: AnimatedContainer(
        duration: fastDuration,
        decoration: BoxDecoration(
            border:
                Border.all(color: selected ? color : inactiveColor1, width: 2),
            borderRadius: BorderRadius.circular(cornersLarge)),
        padding: const EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding / 2),
        child: Text(
          text,
          style: poppins15wBold.copyWith(
              color: selected || hovered ? color : inactiveColor2),
        ),
      ).fadeInAndMoveFromBottom(),
    );
  }
}
