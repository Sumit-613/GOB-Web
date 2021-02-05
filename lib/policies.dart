import 'package:flutter/material.dart';
import 'BookCover.dart';
import 'package:gob_app/Model/Card_model.dart';


class policies extends StatefulWidget {
  @override
  _policiesState createState() => _policiesState();
}

class _policiesState extends State<policies> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0XFF5C161B), Color(0XFFC5351A)])),
        ),
        title: Text(
          'Charles Glass',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'bell-mt-grassetto',
          ),
        ),
        centerTitle: true,
        actions: [
          FlatButton(
              onPressed: null,
              child: Stack(
                children: [
                  Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ),
                  Positioned(
                      right: 5,
                      top: 5,
                      child: new Container(
                          padding: EdgeInsets.all(3),
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          )))
                ],
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(padding: EdgeInsets.symmetric(horizontal: 300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 350,
                    margin:
                    EdgeInsets.only(left: 15,  top: 10, bottom: 10),
                    child: Text(
                      'Privacy Policies',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'OpenSans'),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('SHIPPING/DELIVERY POLICY',
                          style: TextStyle(
                            color: Color(0XFFC5351A),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                          ))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                          "Items will be sent via email. Hotmail and Gmail users be mindful to check your spam folder.",
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontFamily: 'Poppins',
                              fontSize: 13))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('RETURN POLICY',
                          style: TextStyle(
                            color: Color(0XFFC5351A),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                          ))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                          "Items that are purchased in the wrong size can be exchanged.  Shipping will need to be paid for by the sender to exchange and the item will be sent back upon inspection. Keep all Items in their original package unworn & unwashed.",
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontFamily: 'Poppins',
                              fontSize: 13))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('REFUND POLICY',
                          style: TextStyle(
                            color: Color(0XFFC5351A),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                          ))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                          "Most sales are final.  Defective goods can be refunded.  Call customer service. Each issue will be handled on a case by case basis.  All purchases of the e-book or membership are final.",
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontFamily: 'Poppins',
                              fontSize: 13))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('DELIVERY POLICY',
                          style: TextStyle(
                            color: Color(0XFFC5351A),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                          ))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                          "Local USA orders are sent via USPS Priority Mail.  International Goods are sent via USPS First Class Mail.",
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontFamily: 'Poppins',
                              fontSize: 13))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('CANCELATION POLICY',
                          style: TextStyle(
                            color: Color(0XFFC5351A),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                          ))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                         "Subscriptions to the membership site may be cancelled at any time.",
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontFamily: 'Poppins',
                              fontSize: 13))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('COMMENTS, COMMUNICATIONS, AND OTHER CONTENT',
                          style: TextStyle(
                            color: Color(0XFFC5351A),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                          ))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                          "Visitors may submit reviews, suggestions, ideas, comments, questions, or other information, so long as the content is not illegal, obscene, threatening, defamatory, invasive of privacy, infringing of intellectual property rights, or otherwise injurious to third parties or objectionable and does not consist of or contain software viruses, political campaigning, commercial solicitation, chain letters, mass mailings, or any form of “spam.” You may not use a false e-mail address, impersonate any person or entity, or otherwise mislead to the origin of the content. We reserve the right (but not the obligation) to remove or edit such content.",
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontFamily: 'Poppins',
                              fontSize: 13))),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                         "If you do post content or submit material, and unless we indicate otherwise, you grant us a nonexclusive, royalty-free, perpetual, irrevocable, and fully sublicensable right to use, reproduce, modify, adapt, publish, translate, create derivative works from, distribute, and display such content throughout the world in any media. You grant us and our sublicensees the right to use the name that you submit in connection with such content, if they choose. You represent and warrant that you own or otherwise control all of the rights to the content that you post; that the content is accurate; that use of the content you supply does not violate this policy and will not cause injury to any person or entity; and that you will indemnify us and Amazon for all claims resulting from content you supply. We have the right but not the obligation to monitor and edit or remove any activity or content. We take no responsibility and assume no liability for any content posted by you or any third party.",
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontFamily: 'Poppins',
                              fontSize: 13))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('PRODUCT DESCRIPTIONS',
                          style: TextStyle(
                            color: Color(0XFFC5351A),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                          ))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                          "We attempt to be as accurate as possible. However, we do not warrant that product descriptions or other content of this site are accurate, complete, reliable, current, or error-free. If a product is not as described, your sole remedy is to return it in unused condition.",
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontFamily: 'Poppins',
                              fontSize: 13))),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('DISCLAIMER OF WARRANTIES AND LIMITATION OF LIABILITY',
                          style: TextStyle(
                            color: Color(0XFFC5351A),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                          ))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                          "THIS SITE AND ALL INFORMATION, CONTENT, MATERIALS, PRODUCTS AND SERVICES INCLUDED ON OR OTHERWISE MADE AVAILABLE TO YOU THROUGH THIS SITE ARE PROVIDED ON AN “AS IS” AND “AS AVAILABLE” BASIS, UNLESS OTHERWISE SPECIFIED IN WRITING. WE MAKE NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, AS TO THE OPERATION OF THIS SITE OR THE INFORMATION, CONTENT, MATERIALS, PRODUCTS OR SERVICES INCLUDED ON OR OTHERWISE MADE AVAILABLE TO YOU THROUGH THIS SITE, UNLESS OTHERWISE SPECIFIED IN WRITING. YOU EXPRESSLY AGREE THAT YOUR USE OF THIS SITE IS AT YOUR SOLE RISK.",
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontFamily: 'Poppins',
                              fontSize: 13))),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                          "TO THE FULL EXTENT PERMISSIBLE BY APPLICABLE LAW, WE DISCLAIM ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. WE DO NOT WARRANT THAT THIS SITE; INFORMATION, CONTENT, MATERIALS, PRODUCTS OR SERVICES INCLUDED ON OR OTHERWISE MADE AVAILABLE TO YOU THROUGH THIS SITE; THEIR SERVERS; OR E-MAIL SENT FROM US ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS. WE WILL NOT BE LIABLE FOR ANY DAMAGES OF ANY KIND ARISING FROM THE USE OF THIS SITE OR FROM ANY INFORMATION, CONTENT, MATERIALS, PRODUCTS (INCLUDING SOFTWARE) OR SERVICES INCLUDED ON OR OTHERWISE MADE AVAILABLE TO YOU THROUGH THIS SITE, INCLUDING, BUT NOT LIMITED TO DIRECT, INDIRECT, INCIDENTAL, PUNITIVE, AND CONSEQUENTIAL DAMAGES, UNLESS OTHERWISE SPECIFIED IN WRITING.",
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontFamily: 'Poppins',
                              fontSize: 13))),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                          "CERTAIN STATE LAWS DO NOT ALLOW LIMITATIONS ON IMPLIED WARRANTIES OR THE EXCLUSION OR LIMITATION OF CERTAIN DAMAGES. IF THESE LAWS APPLY TO YOU, SOME OR ALL OF THE ABOVE DISCLAIMERS, EXCLUSIONS, OR LIMITATIONS MAY NOT APPLY TO YOU, AND YOU MIGHT HAVE ADDITIONAL RIGHTS.",
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontFamily: 'Poppins',
                              fontSize: 13))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('APPLICABLE LAW',
                          style: TextStyle(
                            color: Color(0XFFC5351A),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                          ))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                          "By visiting our site, you agree that the laws of the state of Utah, without regard to principles of conflict of laws, will govern these Terms and any dispute of any sort that might arise between us.",
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontFamily: 'Poppins',
                              fontSize: 13))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('DISPUTES',
                          style: TextStyle(
                            color: Color(0XFFC5351A),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                          ))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                          "Any dispute relating in any way to your visit to our site or to products or services sold or distributed by us in which the aggregate total claim for relief sought on behalf of one or more parties exceeds \$7,500 shall be adjudicated in any state or federal court in Utah, and you consent to exclusive jurisdiction and venue in such courts.",
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontFamily: 'Poppins',
                              fontSize: 13))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('DISPUTES',
                          style: TextStyle(
                            color: Color(0XFFC5351A),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                          ))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                          "Any dispute relating in any way to your visit to our site or to products or services sold or distributed by us in which the aggregate total claim for relief sought on behalf of one or more parties exceeds \$7,500 shall be adjudicated in any state or federal court in Utah, and you consent to exclusive jurisdiction and venue in such courts.",
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontFamily: 'Poppins',
                              fontSize: 13))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('SITE POLICIES, MODIFICATION, AND SEVERABILITY',
                          style: TextStyle(
                            color: Color(0XFFC5351A),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                          ))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                          "Please review our other policies, such as our privacy policy, posted on this site. These policies also govern your visit to our site. We reserve the right to make changes to our site, policies, and these Terms at any time. If any of these conditions shall be deemed invalid, void, or for any reason unenforceable, that condition shall be deemed severable and shall not affect the validity and enforceability of any remaining condition.",
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontFamily: 'Poppins',
                              fontSize: 13))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),












                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget chapterSumm(
      BuildContext context, int index, List<Card_model> chapterText) {
    return Container(margin: EdgeInsets.only(left: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 5, ),
              child: Text(chapterText[index].title,
                  style: TextStyle(
                      color: Color(0XFFC5351A),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      fontSize: 15))),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(

              child: Text(chapterText[index].description,
                  style: TextStyle(
                      color: Color(0XFF303030),
                      fontFamily: 'Poppins',
                      fontSize: 15))),
        ],
      ),
    );
  }

  Widget descriptionBuilder(
      BuildContext context, int index, List<Card_model> description) {
    return Text(description[index].title,
        style: TextStyle(
            color: Color(0XFF303030), fontFamily: 'Poppins', fontSize: 13));
  }
}
