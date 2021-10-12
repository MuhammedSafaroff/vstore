import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vstore_appl/presentation/bloc/profile_bloc/profile_cubit.dart';
import 'package:vstore_appl/data/services/my_firebase_store.dart';
import 'package:vstore_appl/core/constants/statics.dart';
import 'package:vstore_appl/presentation/page/have_a_market/widgets/dropdown_field.dart';
import 'package:vstore_appl/presentation/widgets/widget.dart';

class StoreCreatePage extends StatelessWidget {
  StoreCreatePage({Key? key, this.buildContext}) : super(key: key);
  final List<String> items =
      'Elektronika,Şəxsi əşyalar,Nəqliyyat,Heyvanlar,idman və əyləncə,Uşaq dünyası,Ev və bağ,Təhsil və ofis ləvazimatları,Alətlər və xırdavat'
          .split(',');
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<String> unitController = ValueNotifier<String>('');
  final TextEditingController nameController = TextEditingController();
  final BuildContext? buildContext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mağaza yarat'),
        ),
        body: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 22, bottom: 40),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginTextField(
                    name: 'Store Name',
                    keyType: TextInputType.name,
                    icons: CupertinoIcons.doc_text,
                    valueController: nameController,
                    validator: (value) {
                      if (value!.trim().isEmpty || value.trim() == "") {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 22),
                  NewProductDropDown(
                    items: items,
                    controller: unitController,
                    labelText: 'Category',
                    icons: Icon(Icons.category_outlined),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'field required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 22),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate())
                        MyFireBaseStore.addStore(
                            nameController.text, unitController.value, context);
                      context.read<ProfileCubit>().pullToken();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: backgroundColor,
                      minimumSize: Size(double.infinity, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                    ),
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
