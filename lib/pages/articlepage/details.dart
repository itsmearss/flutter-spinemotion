import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

import 'article_list.dart';

class DetailsScreen extends StatelessWidget {
  final String tag;
  final ListItem item;

  DetailsScreen({Key? key, required this.tag, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                      tag: '${item.newsTitle}',
                      child: Image.network(item.imgUrl)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                      children: [
                        Text(
                          item.newsTitle,
                          style: TextStyle(
                              fontSize: 22.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              size: 15.sp,
                            ),
                            Text(
                              item.date,
                              style: TextStyle(fontSize: 10.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Kifosis merupakan kondisi kelainan di lengkungan tulang belakang. '
                          'Seseorang yang mengidap kondisi tersebut akan memiliki punggung bagian atas '
                          'terlihat bengkok tidak normal. Biasanya terjadi akibat kebiasaan duduk yang salah. '
                          'Alhasil, bentuk tubuh pengidap kifosis akan terlihat membungkuk.Nah, terdapat beberapa faktor yang dapat menyebabkan seseorang terkena kifosis. '
                          'Salah satunya adalah kebiasaan duduk dengan posisi yang tidak tepat. Namun, benarkah demikian? Yuk, simak penjelasannya di sini! ',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'Kebiasaan Duduk yang Asal dapat Menyebabkan Kifosis Postural ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'Banyak orang yang mengira bahwa bentuk tubuh yang bungkuk atau kifosis merupakan efek pertambahan usia semata. Faktanya, bentuk tubuh bungkuk dapat disebabkan oleh kebiasaan duduk, berjalan, atau berdiri dalam posisi yang kurang tepat. Nah, salah satu jenis kifosis yang dapat terjadi akibat hal tersebut adalah postural kifosis.Perlu diketahui bahwa penyebab utama dari postural kifosis adalah postur tubuh yang buruk di masa kanak-kanak, seperti membungkuk, bersandar di kursi dan membawa tas sekolah yang berat. Kebiasaan tersebut dapat menyebabkan ligamen dan otot yang menopang tulang belakang meregang. Peregangan tersebut dapat menarik vertebra toraks keluar dari posisi normalnya, sehingga menyebabkan kifosis.Jenis kifosis ini sering terjadi dan terlihat saat masa pertumbuhan, terutama masa remaja. Pengidap kifosis postural biasanya mengalami kondisi tulang belakang yang melengkung hingga 50 derajat atau lebih. Menurut American Academy of Orthopaedic Surgeons, jenis kifosis postural lebih sering terjadi pada anak perempuan daripada anak laki-laki. Selain itu, kondisi tersebut jarang menimbulkan nyeri, sehingga tidak menghambat aktivitas pengidapnya.Maka, dapat disimpulkan bahwa kebiasaan duduk dengan posisi yang salah memang benar dapat menyebabkan kifosis. Terutama jika kebiasaan tersebut dilakukan sedari usia kanak-kanak hingga remaja. ',
                          style: TextStyle(fontSize: 18.sp),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
