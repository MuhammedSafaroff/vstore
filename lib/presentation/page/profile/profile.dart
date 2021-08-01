import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vstore_appl/presentation/dialogs/dialog_platform.dart';
import '../../../blocs/profile_bloc/profile_state.dart';
import '../../../blocs/profile_bloc/profile_cubit.dart';

import '../../widgets/widget.dart';

class Profile extends StatelessWidget {
  final bool isCollapsed;
  final Duration duration;
  final Animation<double> scaleAnimation;
  final Function menuOpen;
  const Profile(
      {Key key,
      this.isCollapsed,
      this.duration,
      this.scaleAnimation,
      this.menuOpen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth;

    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.45 * screenWidth,
      right: isCollapsed ? 0 : -0.55 * screenWidth,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: isCollapsed ? null : BorderRadius.circular(20),
          elevation: 8,
          color: Color(0xffF6F6F9),
          child: BlocProvider(
            create: (context) =>
                ProfileCubit(ProfileLoadingState())..pullToken(),
            child: Container(
              child: Column(
                children: [
                  MyAppBar(
                    isCollapsed: isCollapsed,
                    menuOpen: menuOpen,
                  ),
                  BlocBuilder<ProfileCubit, ProfileState>(
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
                              : ProfileNotNull(data: state.model));
                    }
                  }),
                  HomeBottomNavBar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
