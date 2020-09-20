class Recipe {
  String item1, item2, item3, item4, item5, item6, item7, item8, item9, out;

  Recipe(this.item1, this.item2, this.item3, this.item4, this.item5, this.item6,
      this.item7, this.item8, this.item9, this.out);

  List<String> getRow(int x) {
    switch(x) {
      case 1:
        return [item1, item2, item3];
        break;
      case 2:
        return [item4, item5, item6];
        break;
      default:
        return [item7, item8, item9];
        break;
    }
  }

  String genKey() {
    String key = "";

    return key;
  }
}