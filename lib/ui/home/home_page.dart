import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/ui/home/widgets/home)bottom_sheet.dart';

//test
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    // TextEditingController 사용시에는 반드시 dipose 호출해줘야 메모리에서 스캔됨
    textEditingController.dispose();
    super.dispose();
  }

  void onSearch(String Text) {
    //
    print('onSearch 호출됨');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                onSearch(textEditingController.text);
              },
              //버튼의 터치영역은 44 디바이스 픽셀 이상으로 해줘야함!!
              child: Container(
                width: 50,
                height: 50,
                // 컨테이너 배경색이 없으면 자녀위젯에만 터치 이벤트가 적용됨
                color: Colors.transparent,
                child: Icon(Icons.search),
              ),
            ),
          ],
          title: TextField(
            maxLines: 1,
            onSubmitted: onSearch,
            controller: textEditingController,
            decoration: InputDecoration(
                hintText: '검색어를 입력해 주세요',
                border: MaterialStateOutlineInputBorder.resolveWith(
                  (states) {
                    print(states);
                    if (states.contains(WidgetState.focused)) {
                      //
                      return OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      );
                    }
                    return OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    );
                  },
                )),
          ),
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(20),
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return HomeBottomsheet();
                    },
                  );
                },
                child: Image.network('https://picsum.photos/200/300'));
          },
        ),
      ),
    );
  }
}
