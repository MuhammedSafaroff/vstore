import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vstore_appl/presentation/bloc/profile_bloc/profile_cubit.dart';
import 'package:vstore_appl/presentation/bloc/profile_bloc/profile_state.dart';
import 'package:vstore_appl/presentation/dialogs/dialog_platform.dart';
import 'package:vstore_appl/presentation/page/have_a_market/widgets/no_store.dart';
import 'package:vstore_appl/presentation/page/have_a_market/widgets/there_is_store.dart';

class HaveAMaket extends StatelessWidget {
  HaveAMaket({Key? key}) : super(key: key);

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
            } else if (state is ProfileLoadedState) {
              return Expanded(
                child: !state.model!.doYouHaveAStore
                    ? NoStore()
                    : ThereIsStore(token: state.model!.token),
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
            }
            return SizedBox.fromSize();
          },
        );
      }),
    );
  }
}
