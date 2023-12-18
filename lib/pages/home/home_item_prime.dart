import 'package:superlist/common_libs.dart';
import 'package:superlist/pages/home/home_change_animation.dart';
import 'package:superlist/pages/home/home_button1.dart';

import 'home_change_animation2.dart';
import 'home_item1.dart';

class HomeItemPrime extends StatelessWidget {
  const HomeItemPrime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: 20, color: primaryColor, width: double.infinity),
          Container(height: 20, color: backgroundColor, width: double.infinity),
          buildAppBar(),
          verticalSpacer32,
          Text('Superlist', style: poppins30wBold).fadeInAndMoveFromBottom(),
          Image.asset(image1, height: kDefaultMargin + (kDefaultMargin / 2)),
          verticalSpacer8,
          Text('Home to', style: poppins90wBold).fadeInAndMoveFromBottom(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('all your', style: poppins90wBold),
              horizontalSpacer16,
              buildCheckbox(),
              horizontalSpacer16,
              Text('lists',
                  style: poppins90wBold.copyWith(color: primaryColor)),
            ],
          ).fadeInAndMoveFromBottom(),
          verticalSpacer16,
          const HomeButton1(),
          verticalSpacer32 * 2,
          Container(
            height: 700,
            width: 1300,
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            decoration: BoxDecoration(
                border: Border.all(color: inactiveColor3),
                borderRadius: BorderRadius.circular(cornersLarge)),
            child: Row(
              children: [
                homeItem1(),
                horizontalSpaceMedium,
                Expanded(child: homeChangeAnimation2()),
                horizontalSpaceMedium,
                homeChangeAnimation(),
              ],
            ),
          ),
          verticalSpaceLarge,
        ],
      ),
    );
  }

  Widget buildCheckbox() {
    return GetX<HomeController>(builder: (controller) {
      return InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () {},
        onHover: (value) {
          controller.setHomeCheckHovered(value);
        },
        child: AnimatedContainer(
          duration: fastDuration,
          width: 70 + (controller.homeCheckHovered ? 5 : 0),
          height: 70 + (controller.homeCheckHovered ? 5 : 0),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(cornersMedium),
          ),
          child: Icon(Icons.check_rounded, color: backgroundColor, size: 50),
        ),
      );
    });
  }

  Container homeChangeAnimation() {
    return Container(
        width: 340,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(cornersLarge)),
        child: const HomeChangeAnimation());
  }

  Container homeChangeAnimation2() {
    return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(cornersLarge)),
        child: const HomeChangeAnimation2());
  }

  Container homeItem1() {
    return Container(
        width: 230,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding:
            const EdgeInsets.only(top: kDefaultMargin, bottom: kDefaultMargin),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(cornersLarge),
        ),
        child: const HomeItem1());
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: null,
      actions: [buildSignInButton(), horizontalSpacer24],
    );
  }

  Widget buildSignInButton() {
    return GetX<HomeController>(builder: (controller) {
      return AnimatedContainer(
        duration: fastDuration,
        padding: const EdgeInsets.only(
            left: kDefaultPadding, right: kDefaultPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: controller.signInHovered ? activeColor1 : Colors.transparent,
          borderRadius: BorderRadius.circular(cornersLarge),
        ),
        child: InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {},
          onHover: (value) {
            controller.setSignInHover(value);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign in',
                style: poppins12w600,
              ),
              horizontalSpacer8,
              Icon(Icons.arrow_outward_rounded, color: textColor, size: 15),
            ],
          ),
        ),
      ).fadeIn();
    });
  }
}
