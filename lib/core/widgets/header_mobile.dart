import 'package:chill_movies/core/constant/app_plaform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_size.dart';
import 'constant.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: MaterialButton(
        onPressed: () {},
        child: Icon(
          CupertinoIcons.profile_circled,
          color: Colors.white,
        ),
      ),
    );
  }
}

class SearchMobileView extends StatelessWidget {
  const SearchMobileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: Colors.black,
      child: Center(
        child: Column(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      CupertinoIcons.search,
                      size: 20,
                      color: AppColor.primaryColor,
                    ),
                    width: 40,
                    height: 40,
                  ),
                  Container(
                    height: 40,
                    width: AppSize.width - 15 - 40 - 30,
                    child: Padding(
                      padding:
                          EdgeInsets.only(bottom: AppPlaform.isWeb ? 12 : 4),
                      child: TextField(
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        cursorColor: AppColor.primaryColor,
                        decoration: InputDecoration(
                          hintText: "Enter keyword...",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
