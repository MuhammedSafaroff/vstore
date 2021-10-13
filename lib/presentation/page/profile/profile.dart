import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vstore_appl/presentation/dialogs/dialog_platform.dart';
import '../../../presentation/bloc/profile_bloc/profile_state.dart';
import '../../../presentation/bloc/profile_bloc/profile_cubit.dart';

import '../../widgets/widget.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(ProfileLoadingState())..pullToken(),
      child: LayoutBuilder(builder: (context, constraint) {
        return BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoadingState) {
              return Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is ProfileErrorState) {
              DialogPlatformCtrl(
                title: 'Error',
                myContent: Text(state.message),
                context: context,
                yesButton: 'OK',
                yesButtonFun: () {
                  Navigator.of(context).pop();
                },
              ).platformCtrlDialog();
              return Expanded(child: Container());
            } else if (state is ProfileLoadedState) {
              return Expanded(
                  child: state.token == ''
                      ? ProfileNull()
                      : ProfileNotNull(data: state.model!));
            }
            return SizedBox.shrink();
          },
        );
      }),
    );
  }
}
