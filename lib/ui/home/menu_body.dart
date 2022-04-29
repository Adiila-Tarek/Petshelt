import 'package:flutter/material.dart';
import 'package:graduation_projectt/ui/home/HomeScreen.dart';
import 'package:graduation_projectt/ui/home/profile.dart';
import 'menu_items.dart';

class menu extends StatefulWidget{
  const menu ({Key?key}) : super (key:key);
  static const String routeName = 'menu';

  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {



  bool value1 = true;
  bool value2 = false;

  void onChangedValue1(bool value){
    setState(() {
      value1=value;
    });
  }
  void onChangedValue2(bool value){
    setState(() {
      value2=value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
          child: Container(
            color: Color(0xffC5E1D0),

            padding: EdgeInsets.only(
              top: 30,
              //left: 10
            ) ,
            child: Column(
              children: [
                MyHeaderDrawer(),
                const Divider(thickness: 1,height: 20,color: Color(0xff76BDB2),),
                menuitems(
                  name: 'Settings',
                  icon: Icons.settings,
                  onPressed:()=> onItemPressed(context, index:0),
                ),
                /* FlatButton(
                onPressed: (){},
                child: Image.asset('assets/images/chat.png')),
*/

                menuitems(
                  name: 'Chat',
                  icon: Icons.chat,
                  onPressed:()=> onItemPressed(context, index:1),
                ),
                menuitems(
                  name: 'Saved',
                  icon: Icons.bookmark,
                  onPressed:()=> onItemPressed(context, index:2),
                ),
                menuitems(
                  name: 'Sheters',
                  icon: Icons.settings,
                  onPressed:()=> onItemPressed(context, index:3),
                ),
                /* menuitems(
              name: 'Notification',
              icon: Icons.notifications_outlined,
              onPressed:()=> onItemPressed(context, index:4),
            ),*/
                SwitchListTile(
                  value: value1,
                  selectedTileColor: Color(0xff76BDB2),
                  onChanged: onChangedValue1,
                  activeColor: Color(0xff76BDB2),
                  secondary: new Icon(
                    Icons.notifications_outlined, color: Colors.black,),
                  title: new Text (
                    'Notifications', style: new TextStyle(fontSize: 16),),
                  contentPadding: EdgeInsets.only(left: 25),
                ),
                menuitems(
                  name: 'Logout',
                  icon: Icons.logout,
                  onPressed:()=> onItemPressed(context, index:4),
                ),
                Spacer(),
                //const Divider(thickness: 1,height: 20,color: Color(0xff76BDB2),),
                ListTile(
                  title: Text('Pet\$helt',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      //fontWeight: ,
                      color: Color(0xff76BDB2),
                      fontFamily: 'Inter-Regular',
                      //height: 7,
                    ),
                  ),
                ),
                Spacer(),

              ],
            ),
          ),
        )
    );
  }

  void onItemPressed(BuildContext context, {required int index}){
    Navigator.pop(context);

    switch(index){
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  profile() ));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreen() ));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreen() ));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreen() ));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreen() ));
        break;



    /*default:
        Navigator.pop(context);
        break;*/
    }
  }
  Widget MyHeaderDrawer(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 10),
          height: 100,
          width: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/images/test.png"),
            ),
          ),
        ),
        Column(
          children: [
            Text('Menna_Zohair',
              style: TextStyle(fontSize: 18),)
          ],
        )
      ],
    );
  }
/* Widget FlatButton (){
    return Container(
       // onPressed: (){},
        child: Image.asset('assets/images/chat.png')
    );

  }*/

}