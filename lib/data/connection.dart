import "package:flutter_dotenv/flutter_dotenv.dart";

String conn = "${dotenv.env['BASE_URL']}";
