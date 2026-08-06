String formatDate(String? date) {
  try {

    if (date == null) return "";

    final dateTime = DateTime.parse(date);

    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";

  } catch (e) {

    return "";

  }
}