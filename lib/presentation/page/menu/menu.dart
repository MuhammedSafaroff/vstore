import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:vstore_appl/data/models/profile_model.dart';
import 'package:vstore_appl/core/constants/statics.dart';
import '../../../presentation/bloc/profile_bloc/profile_cubit.dart';
import '../../../presentation/bloc/profile_bloc/profile_state.dart';

import '../../../presentation/bloc/menu_selected_cubit/menu_selected_cubit.dart';

class Menu extends StatelessWidget {
  final Animation<double>? menuScaleAnimation;
  final Animation<Offset>? slideAnimation;
  final Function? menuOpen;
  Menu({Key? key, this.menuScaleAnimation, this.slideAnimation, this.menuOpen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth, screenHeight;
    var bloc = BlocProvider.of<MenuSelectedCubit>(context);
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return SlideTransition(
      position: slideAnimation!,
      child: ScaleTransition(
        scale: menuScaleAnimation!,
        child: BlocProvider(
          create: (context) => ProfileCubit(ProfileLoadingState())..pullToken(),
          child: Container(
            padding: EdgeInsets.only(
                top: screenHeight * 0.1,
                left: screenWidth * 0.02,
                bottom: screenHeight * 0.08),
            child: Column(
              children: [
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoadingState) {
                      return UserAccountTop(
                        data: ProfileModel(fullName: 'Loading'),
                      );
                    } else if (state is ProfileErrorState) {
                      return UserAccountTop(
                        data: ProfileModel(fullName: "Error " + state.message),
                      );
                    } else if (state is ProfileLoadedState) {
                      return state.token != ''
                          ? UserAccountTop(
                              data: state.model!,
                              isImage: true,
                            )
                          : UserAccountTop(
                              data: ProfileModel(),
                            );
                    }
                    return SizedBox.shrink();
                  },
                ),
                ListTile(
                  minLeadingWidth: 15,
                  leading: FaIcon(
                    FontAwesomeIcons.home,
                    color: Colors.white,
                    size: 20,
                  ),
                  title: Text(
                    "Əsas Səhifə",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    bloc.setNavItemIndexName(0, 'homepage');

                    menuOpen!();
                  },
                ),
                //store menu
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoadingState) {
                      return ListTile(
                          minLeadingWidth: 15,
                          leading: FaIcon(
                            FontAwesomeIcons.storeAlt,
                            color: Colors.white,
                            size: 20,
                          ),
                          title: Text(
                            "Loading...",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          onTap: null);
                    } else if (state is ProfileErrorState) {
                      return ListTile(
                          minLeadingWidth: 15,
                          leading: FaIcon(
                            FontAwesomeIcons.storeAlt,
                            color: Colors.white,
                            size: 20,
                          ),
                          title: Text(
                            "Xəta baş verdi!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          onTap: null);
                    } else if (state is ProfileLoadedState) {
                      return state.token != ''
                          ? ListTile(
                              minLeadingWidth: 15,
                              leading: Icon(
                                Icons.add_business_rounded,
                                color: Colors.white,
                                size: 28,
                              ),
                              title: Text(
                                state.model!.doYouHaveAStore
                                    ? "Mağazanız"
                                    : "Mağazan yoxdur?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              onTap: () {
                                bloc.setNavItemIndexName(
                                    0, 'do_u_have_a_market');
                                // bloc.addValue(state.model.doYouHaveAStore);
                                menuOpen!();
                              },
                            )
                          : ListTile(
                              minLeadingWidth: 15,
                              leading: Icon(
                                Icons.add_business_rounded,
                                color: Colors.white,
                                size: 28,
                              ),
                              title: Text(
                                "Mağazan yoxdur?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              onTap: null);
                    }
                    return SizedBox.shrink();
                  },
                ),
                ListTile(
                  minLeadingWidth: 15,
                  leading: FaIcon(
                    FontAwesomeIcons.storeAlt,
                    color: Colors.white,
                    size: 20,
                  ),
                  title: Text(
                    "Mağazalar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    bloc.setNavItemIndexName(0, 'markets');

                    menuOpen!();
                  },
                ),
                ListTile(
                  minLeadingWidth: 15,
                  leading: FaIcon(
                    FontAwesomeIcons.gem,
                    color: Colors.white,
                    size: 20,
                  ),
                  title: Text(
                    "Vip ol",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserAccountTop extends StatelessWidget {
  final ProfileModel? data;
  final bool isImage;
  const UserAccountTop({Key? key, this.data, this.isImage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      accountName: Text(data!.fullName),
      accountEmail: Text(data!.email),
      currentAccountPicture: isImage
          ? CircleAvatar(
              backgroundColor: backgroundColor,
              radius: 30,
              backgroundImage: NetworkImage(data!.photeUrl),
            )
          : null,
    );
  }
}
