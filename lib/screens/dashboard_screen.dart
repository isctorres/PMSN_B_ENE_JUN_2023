import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:pmsnb1/provider/flags_provider.dart';
import 'package:pmsnb1/provider/theme_provider.dart';
import 'package:pmsnb1/screens/list_post_cloud_screen.dart';
import 'package:pmsnb1/screens/list_post_screen.dart';
import 'package:pmsnb1/settings/styles.dart';
import 'package:pmsnb1/widgets/futures_modal.dart';
import 'package:pmsnb1/widgets/modal_add_post.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isDarkThemEnable = false;

  @override
  Widget build(BuildContext context) {

    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    FlagsProvider flags = Provider.of<FlagsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('TecBook :)'),),
      /*body: flags.getupdatePosts() == true 
        ? const ListPostScreen() 
        : const ListPostScreen(),*/
      body: ListPostCloudScreen(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => openCustomeDialog(context,null),
        icon: const Icon(Icons.add_comment),
        label: Text('Post it!')
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://previews.123rf.com/images/dclipart/dclipart1611/dclipart161100025/68284221-logotipo-de-la-mascota-del-lince-jefe-de-lince-aislado-ilustraci%C3%B3n-vectorial-.jpg'),
              ),
              accountName: Text('Rubensin Torres Frias'), 
              accountEmail: Text('ruben.torres@itcelaya.edu.mx')
            ),
            ListTile(
              onTap: ()=>Navigator.pushNamed(context, '/popular'),
              title: const Text('API Movies'),
              leading: const Icon(Icons.movie),
              trailing: const Icon(Icons.chevron_right),
            ),
            DayNightSwitcher(
              isDarkModeEnabled: isDarkThemEnable,
              onStateChanged: (isDarkModeEnabled) {
                isDarkModeEnabled 
                  ? theme.setthemeData(StylesApp.darkTheme(context))
                  : theme.setthemeData(StylesApp.lightTheme(context));

                isDarkThemEnable = isDarkModeEnabled;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}