import '../models/data.dart';

bool sort;

onSortValue(List<Data> data, int value, bool ascending) {
  if (ascending) {
    data.sort((a, b) => a.deaths.compareTo(b.deaths));
  } else {
    data.sort((a, b) => b.deaths.compareTo(a.deaths));
  }
}

