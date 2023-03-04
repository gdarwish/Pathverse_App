extension ListPagination<T> on List<T> {
  int numOfPages(int numOfItems) => (length / numOfItems).ceil();
  List<T> paginate({int numOfItems = 10, int page = 0}) {
    if (this.length < numOfItems) {
      return this;
    }

    int start = numOfItems * page;
    if (start >= this.length) {
      start = 0;
    }

    int? end = start + numOfItems;

    if (end >= this.length) {
      end = null;
    }

    return this.sublist(start, end);
  }
}
