extension RouteUtil on String {
  String changeIdtoValue({required int id}) {
    return this.replaceFirst(':id', id.toString());
  }
}
