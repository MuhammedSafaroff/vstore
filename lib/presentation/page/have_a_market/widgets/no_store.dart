import 'package:flutter/material.dart';
import 'package:vstore_appl/presentation/bloc/profile_bloc/profile_cubit.dart';
import 'package:vstore_appl/presentation/page/have_a_market/store_create_page.dart';
import 'package:vstore_appl/core/constants/statics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoStore extends StatelessWidget {
  const NoStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Mağazan Yoxdur?",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: backgroundColor),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: context.read<ProfileCubit>(),
                          child: StoreCreatePage(),
                        ),
                      ));
                },
                child: Text(
                  "Mağaza Yarat",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
