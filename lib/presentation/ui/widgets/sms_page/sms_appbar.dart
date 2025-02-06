part of '../../pages/sms_page.dart';

class SmsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SmsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: true,
      shadowColor: Colors.transparent,
      toolbarHeight: 60.h,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SMS Bot',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(width: 6.w),
          SvgPicture.asset(
            AppAssets.message,
            color: Colors.yellow,
            width: 24.w,
            height: 24.h,
          )
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: 15.w),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.of(context).push(
                RouteNavigationHelper.buildPageRoute(
                    const SettingsPage(), PageTransitionType.slideFromRight),
              );
            },
            child: SvgPicture.asset(
              AppAssets.settings,
              width: 24.w,
              height: 24.h,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
