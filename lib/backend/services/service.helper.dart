import 'package:uuid/uuid.dart';

String getTag() {
  return Uuid().v4();
}
