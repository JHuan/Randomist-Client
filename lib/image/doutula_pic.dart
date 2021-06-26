import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:dio/dio.dart';

import 'package:randomist/image/pic_rand_gen.dart';

class DouTuLaPicRand extends PicRandGen{
  @override
  String getRandomPicUrl() {
     douban();
     return "http://img.doutula.com/production/uploads/image/2021/06/26/20210626674557_tRkLNp.jpg";
  }

  douban([page = 1]) async {
    try {
      Dio dio = new Dio();
      dio.options.headers["Access-Control-Allow-Origin"] = "*";
      dio.options.headers['User-Agent'] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4)"+
          " AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36";
      var res = await dio.get(
          'https://movie.douban.com/subject/3882715/reviews?start=${20 * page}',
          );
      if (res.statusCode == 200) {
        String body = res.data;
        dom.Document domObj = parse(body);
        var items = domObj.querySelectorAll('.main.review-item');
        items.forEach((v) {
          String name = v.querySelector('.name').text.trim();
          var eleItem = v.querySelector('.avator img');
          String? avator = eleItem.attributes['src'];
          String content = v.querySelector('.short-content').text.trim();
          String time = v.querySelector('.main-meta').text.trim();
          print(
              {'name': name, 'avatar': avator, 'content': content, 'time': time});
        });
      }
    } catch (e) {
      print(e);
    }
  }
}

