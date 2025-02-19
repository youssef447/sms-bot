part of '../../pages/sms_page.dart';

class SmsCard extends StatelessWidget {
  final SmsMessage model;
  const SmsCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Theme.of(context).colorScheme.surfaceContainer,
        ),
        padding: EdgeInsets.all(
          16.h,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.address!,
                    style: AppTextStyle.font16BoldText,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    model.body!,
                    style: AppTextStyle.font12BoldText
                        .copyWith(color: Colors.grey),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: 6.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormatHelper.formatDate(
                      DateTime.fromMillisecondsSinceEpoch(model.date!)),
                  style: AppTextStyle.font12BoldText.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  DateFormatHelper.formatTime(
                      DateTime.fromMillisecondsSinceEpoch(model.date!)),
                  style: AppTextStyle.font12BoldText.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  model.read ?? false ? 'Seen' : 'Unseen',
                  textAlign: TextAlign.end,
                  style: AppTextStyle.font10BoldText.copyWith(
                    fontWeight: FontWeight.w300,
                    color: model.seen ?? false ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
