import 'package:shared_preferences/shared_preferences.dart';

main(){
  String mameGame ='qq';
  saveData('qq', 'dima');
  print(loadData(mameGame));
}

Future<Null> saveData(String nameGame, String data) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(nameGame, data);

  /*  SharedPreferences _prefs;
  SharedPreferences.getInstance()..then((prefs) => _prefs = prefs);
  await _prefs.setString(nameGame, data);*/
  print('saved data: nameGame: $nameGame data: $data');

}

Future<String> loadData(String nameGame) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  String s = _prefs.getString(nameGame);
  if (s == null) s='not available';
  print('loaded: ${_prefs.getString(nameGame)}');

  return s;
}