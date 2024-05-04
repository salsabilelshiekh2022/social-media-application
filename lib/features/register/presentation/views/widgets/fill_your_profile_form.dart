import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/validator.dart';
import '../../cubit/register_cubit.dart';

import '../../../../../core/utils/snack_bar.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/congratulation_alert.dart';
import 'pick_image_widget.dart';
import 'skip_button_and_continue_button.dart';

class FillYourProfileForm extends StatelessWidget {
  const FillYourProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is UpdateProfileFailureState) {
          showSnackBar(state.message, Colors.red);
        } else if (state is UpdateProfileSuccessState) {
          showSnackBar('Success', Colors.green);
        } else if (state is UpdateProfileLoadingState) {
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => const CongratulationAlart());
        }
      },
      builder: (context, state) {
        return Form(
          child: Column(children: [
            const PickImageWidget(),
            verticalSpace(24),
            AppTextFormField(
              hintText: 'Full Name',
              prefixIcon: Icons.person,
              validator: (value) {
                return Validator.validateName(value);
              },
              onChange: (value) {
                context.read<RegisterCubit>().fullName = value;
              },
            ),
            verticalSpace(24),
            AppTextFormField(
              hintText: 'Nick Name',
              prefixIcon: Icons.person,
              onChange: (value) {
                context.read<RegisterCubit>().nickName = value;
              },
              validator: (value) {
                return Validator.validateName(value);
              },
            ),
            verticalSpace(24),
            AppTextFormField(
              onChange: (value) {
                context.read<RegisterCubit>().phoneNumber = value;
              },
              hintText: 'Phone',
              prefixIcon: Icons.phone,
              validator: (value) {
                return Validator.validatePhone(value);
              },
            ),
            verticalSpace(24),
            AppTextFormField(
              onChange: (value) {
                context.read<RegisterCubit>().address = value;
              },
              validator: (value) {
                return Validator.validateAnotherField(value);
              },
              initialValue: context.read<RegisterCubit>().address,
              hintText: 'Address',
              prefixIcon: Icons.location_on_rounded,
            ),
            verticalSpace(185),
            SkipButtonAndContinueButton(
              continueMethod: () {
                context.read<RegisterCubit>().updateProfile();
                // showDialog<String>(
                //     context: context,
                //     builder: (BuildContext context) =>
                //         const CongratulationAlart());
              },
              skipMethod: () {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>
                        const CongratulationAlart());
              },
            )
          ]),
        );
      },
    );
  }
}
