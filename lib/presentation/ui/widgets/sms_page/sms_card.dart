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
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    model.body!,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
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
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                ),
                SizedBox(height: 4.h),
                Text(
                  DateFormatHelper.formatTime(
                      DateTime.fromMillisecondsSinceEpoch(model.date!)),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                ),
                SizedBox(height: 10.h),
                Text(
                  model.seen ?? false ? 'Seen' : 'Unseen',
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
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
