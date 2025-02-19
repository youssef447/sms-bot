part of '../../pages/settings_page.dart';

class InputsForm extends GetView<SmsSettingsController> {
  const InputsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.email,
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(width: 6.w),
              Text(
                'Enter Email Address',
                style: AppTextStyle.font16BoldText,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          AppTextFormField(
            controller: controller.emailController,
            keyboardType: TextInputType.text,
            showBorder: true,
            hintText: 'Email Address',
            validator: ValidationHelper.email,
          ),
          SizedBox(height: 30.h),
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.telegram,
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(width: 6.w),
              Text(
                'Enter Telegram user ID',
                style: AppTextStyle.font16BoldText,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          AppTextFormField(
            controller: controller.telegramController,
            keyboardType: TextInputType.text,
            showBorder: true,
            hintText: 'Telegram User ID',
            validator: ValidationHelper.empty,
          ),
        ],
      ),
    );
  }
}
