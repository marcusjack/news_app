//NOTE ----------Get Date Formated For Task -----------------------------
String getDateFormated(String date) {
  List<String> listdate = date.split("T");
  List<String> list1date = listdate[1].split(":");

  return list1date[0] + ":" + list1date[1] + "   " + listdate[0];
}
