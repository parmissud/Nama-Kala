class StringToList{
   String list;


  StringToList(this.list);

  List<String> stringToList(String list){
    List<String> res=[];
    String replace=list.replaceFirst("[","");
    list=replace;
    replace=list.replaceFirst("]","");
    list=replace;
    for (int i = 0; i < list.split(", ").length; i++) {
      res.add(list.split(", ")[i]);
    }
    return res;

  }
}