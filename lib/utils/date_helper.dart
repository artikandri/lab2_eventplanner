extension DateHelper on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == this.day && now.month == this.month && now.year == this.year;
  }
}
