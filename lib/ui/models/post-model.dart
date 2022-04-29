import 'package:graduation_projectt/ui/models/users-models.dart';
import 'package:graduation_projectt/ui/models/models.dart';

class Post{
  final User user;
  final String caption;
  final String imageurl;
  final String saved;
  final String msg;

  const Post({
    required this.user,required this.caption,required this.imageurl,required this.saved,required this.msg
});
}