import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/createprofile/bloc/create_profile_bloc.dart';
import 'package:login/createprofile/view/desktop/create_profile_desktop.dart';
import 'package:login/createprofile/view/mobile/create_profile_mobile.dart';

import 'package:responsive_framework/responsive_framework.dart';

class CreateProfilePage extends StatelessWidget {
  const CreateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateProfileBloc()..add(InitializeProfile()),
      child: ResponsiveValue<Widget>(
        context,
        defaultValue: const CreateProfileMobile(),
        conditionalValues: [
          const Condition.equals(
            name: DESKTOP,
            value:CreateProfileDesktop(),
          ),
          const Condition.smallerThan(
            name: DESKTOP,
            value: CreateProfileMobile(),
          ),
        ],
      ).value,
    );
  }
}
