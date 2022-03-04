
/*类型 IndexPath*/
class IndexPath {
  final int section;
  final int row;

  IndexPath(this.section, this.row);
}

/*类型 tableview样式，默认是plain*/
enum TableViewStyle {
  plain, //regular table view
  group //sections are grouped together
}

