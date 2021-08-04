import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../data/models/profile_model.dart';
import '../profile_edit.dart';
import '../../sing_in_up/sign_in.dart';
import '../../../../constants/statics.dart';
import '../../../../utils/my_shared_preferences.dart';

class ProfileNotNull extends StatelessWidget {
  const ProfileNotNull({Key key, this.data}) : super(key: key);
  final ProfileModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 16),
          //photo, name, mail
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfileEdit(data: data)));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
              width: double.infinity,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(data.photeUrl),
                    radius: 34,
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 12),
                  //mail and name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.fullName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        data.email,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 28,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.heart,
              color: backgroundColor,
            ),
            title: Text('Sevimlilər'),
            trailing: Icon(
              Icons.chevron_right_rounded,
            ),
          ),

          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.language,
              color: backgroundColor,
            ),
            title: Text('Tətbiq dili'),
            trailing: Icon(
              Icons.chevron_right_rounded,
            ),
          ),

          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
              MySharedPreferences().removeSharedToken();
            },
            leading: FaIcon(
              FontAwesomeIcons.signOutAlt,
              color: backgroundColor,
            ),
            title: Text('Çıxış'),
            trailing: Icon(
              Icons.chevron_right_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
