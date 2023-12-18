import 'package:superlist/common_libs.dart';

class HomeItem1 extends StatelessWidget {
  const HomeItem1({super.key});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> texts = [
      {'icon': '💥', 'text': 'App Launch', 'clicker': 'Teamwork'},
      {'icon': '🏡', 'text': 'Kitchen Reno', 'clicker': 'Personal projects'},
      {
        'icon': '🧘',
        'text': 'Daily Habits',
        'clicker': 'Everything in between'
      },
      {'icon': '🍔', 'text': 'Recipes', 'clicker': ''},
      {'icon': '✏️', 'text': 'Design Work', 'clicker': ''},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildItem1(),
        verticalSpaceLarge,
        Padding(
          padding: const EdgeInsets.only(
              left: kDefaultMargin,
              right: kDefaultMargin,
              top: kDefaultMargin,
              bottom: kDefaultMargin / 2),
          child: Text('Lists',
                  style: poppins15wBold.copyWith(color: inactiveColor1))
              .fadeIn(),
        ),
        Expanded(
          child: GetX<HomeController>(builder: (controller) {
            controller.selectedHomeMenu1 == '';
            controller.homeMenu2HoveredItem == '';
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0),
              itemCount: texts.length,
              itemBuilder: (ctx, index) {
                final data = texts[index];

                return buildItem(controller, data);
              },
            );
          }),
        ),
        verticalSpaceLarge,
        Container(
          padding: const EdgeInsets.only(
              left: kDefaultPadding, right: kDefaultPadding),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: inactiveColor4,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              horizontalSpaceSmall,
              Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: inactiveColor4),
                    shape: BoxShape.circle),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: inactiveColor4,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  InkWell buildItem(HomeController controller, data) {
    final selected = controller.selectedHomeMenu1 == data['clicker'];
    final hover = controller.homeMenu2HoveredItem == data['text'];
    return InkWell(
      onTap: () {
        controller.setSelectedHomeMenu1(data['clicker']);
      },
      onHover: (value) {
        if (value) {
          controller.setHomeMenu2HoveredItem(data['text']);
        } else {
          controller.setHomeMenu2HoveredItem('');
        }
      },
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        decoration: BoxDecoration(
            color: selected || hover ? inactiveColor5 : Colors.transparent,
            border: Border(
              right: BorderSide(
                  color: selected ? primaryColor : Colors.transparent,
                  width: 3),
            )),
        child: Row(
          children: [
            Text(data['icon'], style: poppins15wBold).fadeIn(),
            horizontalSpacer8,
            Text(data['text'], style: poppins15wBold).fadeIn(),
          ],
        ),
      ),
    );
  }

  Padding buildItem1() {
    return Padding(
      padding:
          const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                    decoration: BoxDecoration(
                        color: inactiveColor4,
                        borderRadius: BorderRadius.circular(20)),
                  ).fadeInAndMoveFromBottom(),
                ),
              ),
              horizontalSpaceSmall,
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                    decoration: BoxDecoration(
                        color: inactiveColor4,
                        borderRadius: BorderRadius.circular(20)),
                  ).fadeInAndMoveFromBottom(),
                ),
              ),
            ],
          ),
          verticalSpaceSmall,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                    decoration: BoxDecoration(
                        color: inactiveColor4,
                        borderRadius: BorderRadius.circular(20)),
                  ).fadeInAndMoveFromBottom(),
                ),
              ),
              horizontalSpaceSmall,
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                    decoration: BoxDecoration(
                        color: inactiveColor4,
                        borderRadius: BorderRadius.circular(20)),
                  ).fadeInAndMoveFromBottom(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
