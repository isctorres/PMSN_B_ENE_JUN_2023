import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:pmsnb1/provider/theme_provider.dart';
import 'package:pmsnb1/settings/styles.dart';
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

    return Scaffold(
      appBar: AppBar(title: Text('TecBook :)'),),
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
            DayNightSwitcher(
              isDarkModeEnabled: isDarkThemEnable,
              onStateChanged: (isDarkModeEnabled) {
                isDarkModeEnabled 
                  ? theme.setthemeData(StylesApp.lightTheme())
                  : theme.setthemeData(StylesApp.darkTheme());

                setState(() {});
                isDarkThemEnable = isDarkModeEnabled;
              },
            ),
          ],
        ),
      ),
    );
  }
}