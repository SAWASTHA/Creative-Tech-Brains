import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_image_view.dart';
import '../../doctorsData/doctorsDataa.dart';

class doctorsearch extends StatefulWidget {
  const doctorsearch({Key? key}) : super(key: key);

  @override
  State<doctorsearch> createState() => _doctorsearchState();
}

class _doctorsearchState extends State<doctorsearch> {
  String name = "";
  // List<Map<String, dynamic>> data = [
  //   {
  //     "name": "DR. AJIT BHAGWAT",
  //     "qualification": "MD., DM. (Cardiology)",
  //     "speciality": " Cardiologist",
  //     "experience":
  //         "More than 18 years of clinical experience out of which 5 years in USA.",
  //     "image": "http://bajajhospital.com/Images/DrAjitBhagwat.png",
  //     "workplace": "Kamalnayan Bajaj Hospital",
  //     "career":
  //         " Presented & Published more than 50 papers in various sub-specialties in Cardiology Performed more than 11000 Cath Lab procedures.The only American Board Certified Interventional Cardiologist in Maharashtra.",
  //     "rating": "⭐⭐⭐⭐",
  //     "exp": "18",
  //     "patients": "223",
  //     "language": "Eng/Hindi",
  //     "hospAdd":
  //         "Gut No 43 Bajaj Marg,Beed Bypass Rd,Satara Deolai Parisar,Aurangabad,Maharashtra 431010"
  //   },
  //   {
  //     "name": " DR. PRERANA DEODHAR",
  //     "qualification": " MBBS, MD.",
  //     "speciality": "Obstetrics and Gynaecologist",
  //     "experience":
  //         "17 years of experience after MD in the specialty, out of which 6 years abroad (United Kingdom). Since August 2003 working as Critical care Obstetrician & Gynecologist at Kamalnayan Bajaj Hospital. Expertise in complicated pregnancies, bad obstetric history, prenatal diagnosis, menopausal problems",
  //     "image": "http://bajajhospital.com/Images/DrPreranaDeodhar.png",
  //     "workplace": "Kamalnayan Bajaj Hospital , Aurangabad, Maharasthra",
  //     "career":
  //         "MD in 1994 with gold medal from Government medical college, Aurangabad. In UK, worked as Specialist Registrar at sophisticated tertiary Centers at Liverpool & Manchester. Gained tremendous experience in the sub-specialties like - Genetics & Fetal Medicine, Critical Care Obstetrics, Genetic Counseling, Menopause.Attended & presented papers at various European conferences & meetings.",
  //     "rating": "⭐⭐⭐⭐⭐",
  //     "exp": "23",
  //     "patients": "353",
  //     "language": "Eng",
  //     "hospAdd":
  //         "Gut No 43 Bajaj Marg,Beed Bypass Rd,Satara Deolai Parisar,Aurangabad,Maharashtra 431010"
  //   },
  //   {
  //     "name": 'DR. AMOL SULAKHE',
  //     "qualification": " M.S. (ENT), D.N.B. (ENT)",
  //     "speciality": " ENT Surgeon ",
  //     "experience":
  //         " More than17 years of clinical experience at various hospitals. Delivered lectures & attended many conferences & Seminars on ENT at National level ",
  //     "image":
  //         'https://img.freepik.com/free-photo/doctor-with-his-arms-crossed-white-background_1368-5790.jpg?size=626&ext=jpg&ga=GA1.2.1159008489.1659462743&semt=sph',
  //     "workplace": " MGM Hospital, Aurangabad, Maharashtra",
  //     "career":
  //         " Attended workshops & trainings in more than 20 various specializations in ENT. Member of Indian Association of Otorhinolaryngologist of India. Member of Indian Society of Otology. Member of Indian Association of Bronchology. Member of IMA Aurangabad & Jt. Secretary of Association of Otorhinolaryngologist of Aurangabad.",
  //     "rating": "⭐⭐⭐⭐",
  //     "exp": "17 years",
  //     "patients": "350",
  //     "language": "Hindi",
  //     "hospAdd":
  //         " Gate No. 2, MGM Campus, N-6, CIDCO., Aurangabad, Maharashtra. 431 003"
  //   },
  //   {
  //     "name": 'DR. REKHA JAWALE',
  //     "qualification": "MBBS, DGO",
  //     "speciality": " Gynaecologist",
  //     "experience":
  //         'working in Carewell Multispeciality Hospital in Aurangabad since 2014. She has huge experience in obstetrics and gynaecology. Dr. Rekha Jawale treats a wide range of pregnancy care and general gynaecology.',
  //     "image":
  //         'https://img.freepik.com/premium-photo/confident-pretty-middle-aged-female-doctor_1262-10444.jpg?size=626&ext=jpg&ga=GA1.2.1159008489.1659462743&semt=sph',
  //     "workplace": " Carewell Hospital, Aurangabad, Maharashtra",
  //     "career":
  //         " Dr. Rekha Jawale obtained her MBBS degree and DGO from the Government Medical College in Miraj. ",
  //     "rating": "⭐⭐⭐",
  //     "exp": "12 years",
  //     "patients": "324",
  //     "language": "Hindi",
  //     "hospAdd":
  //         'Plot No.11, Jalna Road, Opp. S.F.S. School, Venkatesh Nagar, Mondha, Aurangabad, Maharashtra 431001'
  //   },
  //   {
  //     "name": 'DR. AJAY OSWAL',
  //     "qualification": "MBBS, MS (Surgery), DNB, M. Ch (Urology), ",
  //     "speciality": "Urologist & Kidney Transplant Surgeon ",
  //     "experience":
  //         " Dr. Ajay Oswal has been working as a Sr. Consultant Urologist & Kidney Transplant Surgeon in Dhoot hospital since 2017.",
  //     "image":
  //         'https://img.freepik.com/premium-photo/portrait-confident-young-medical-doctor-white-background-holding-tablet-his-hands_168410-2338.jpg?size=626&ext=jpg&ga=GA1.2.1159008489.1659462743&semt=ais',
  //     "workplace": " Dhoot Hospital, Aurangabad, Maharashtra ",
  //     "career":
  //         " Dr. Oswal has led the teams which have a cumulative experience of over 1200 renal transplants; of which he has performed over 1100 transplant surgeries (recipient) independently, with excellent surgical results. Treasurer during the Organization of the 26th West Zone USICON at Aurangabad, September 2016.",
  //     "rating": "⭐⭐⭐⭐⭐",
  //     "exp": "22 years",
  //     "patients": "1200",
  //     "language": "Hindi/English",
  //     "hospAdd":
  //         'MIDC, A-1, Jalna Road, near Airport, MIDC Industrial Area, Chilkalthana, Aurangabad, Maharashtra 431210'
  //   },
  //   {
  //     "name": 'DR. ANTARA DESHMUKH',
  //     "qualification":
  //         " B.P.Th, MPTh (Cardiorespiratory, Pulmonary and fitness)",
  //     "speciality": " Physiotherapist ",
  //     "experience":
  //         " Worked for 1 year as a Junior Physiotherapist (H/O) at Hedgewar Rugnalay, Aurangabad. Clinical Experience of 4 years. Skilled in treating Neurological, orthopaedic, cardiovascular, sports injuries etc.",
  //     "image":
  //         'https://img.freepik.com/free-photo/portrait-doctor_144627-39390.jpg?size=626&ext=jpg&ga=GA1.2.1159008489.1659462743&semt=sph',
  //     "workplace": "Ciigma Hospital, Aurangabad, Maharashtra ",
  //     "career":
  //         " Worked for 1.5 years as an Assistant Lecturer in Aurangabad College of physiotherapy, Shiva Trusts, Aurangabad. Certified Fitness trainer, pre and post-natal Instructor trainer, Pilates Instructor Trainer, MATT therapist.  currently working as A Sub-Coordinator of the Indian Association of Physiotherapists Women Cell (IAPWC) Aurangabad District.",
  //     "rating": "⭐⭐⭐",
  //     "exp": "7 years",
  //     "patients": "157",
  //     "language": "English",
  //     "hospAdd":
  //         'Plot no 6, 7, Ciigma Hospital, Dargah Rd, Shahnoorwadi, Aurangabad, Maharashtra 431005'
  //   },
  //   {
  //     "name": 'DR. AJEET SINGH',
  //     "qualification": " MBBS, MD - Dermatology",
  //     "speciality": "Dermatologist",
  //     "experience": 'More than 16 years of clinical experience ',
  //     "image":
  //         'https://img.freepik.com/free-photo/doctor-smiling-with-stethoscope_1154-36.jpg?size=626&ext=jpg&ga=GA1.1.1159008489.1659462743&semt=ais',
  //     "workplace": " Clinic - Skin solutions, Aurangabad, Maharashtra ",
  //     "career":
  //         " MBBS, MD. Services - Dandruff Treatment, MesoGlow, Line and Wrinkle Smoothing, Dermoscopy, Hair Restoration, Skin Rejuvenation, Fractional Laser, Medical Vitiligo Treatment, Laser therapy, Skin Hydration, Skin Rash Treatment, Hyper Pigmentation Treatment, Anti Aging Treatment, Hydra Facial, Skin Biopsy, Skin Pulse Treatment.",
  //     "rating": "⭐⭐⭐⭐⭐",
  //     "exp": "16 years",
  //     "patients": "800",
  //     "language": "English/Hindi",
  //     "hospAdd":
  //         'Opp. Rama International, CIDCO N3, Aurangabad, Maharashtra 431001'
  //   },
  //   {
  //     "name": 'DR. AJAY TAMMEWAR',
  //     "qualification": " M.S. (Ophthalmology)",
  //     "speciality": " Ophthalmology - Retina ",
  //     "experience":
  //         'More than 18 years of clinical experience in Ophthalmology and Vitreo-retinal diseases. Visiting Professor in Ophthalmology at PVPM Medical College, Ahmednagar. ',
  //     "image":
  //         'https://img.freepik.com/free-photo/smiling-touching-arms-crossed-room-hospital_1134-799.jpg?size=626&ext=jpg&ga=GA1.2.1159008489.1659462743&semt=ais',
  //     "workplace": " Bajaj Hospital, Aurangabad, Maharashtra ",
  //     "career":
  //         "Two years Clinical Fellowship in vitreo-retinal surgery and diseases of Uvea, under Dr. Freeman, at University of California, USA, and under Dr. P.N. Nagpal, Ahmedabad. Been Associate Professor in Ophthalmology, MGM's medical college, Aurangabad, from 1993 - 2010. More than 10 research publications in peer reviewed national and international journals. Delivered more than 20 invited lectures and talks in national, state and regional conferences and CMEs. Research fellowship (1990-92) by Council for Scientific and Industrial Research (CSIR), New Delhi",
  //     "rating": "⭐⭐⭐⭐⭐",
  //     "exp": "18 years",
  //     "patients": "1100",
  //     "language": "English/Hindi",
  //     "hospAdd":
  //         'Gut No 43 Bajaj Marg, Beed Bypass Rd, Satara Deolai Parisar, Aurangabad, Maharashtra 431010'
  //   },
  //   {
  //     "name": 'DR. THOMAS GEORGE',
  //     "qualification": " M.D. (Radiology)",
  //     "speciality": " Radiologist ",
  //     "experience":
  //         '15 years of post MD experience in various top Corporate Hospitals in India and abroad. He has been associated with Kamalnayan Dr. Hedgewar Hospital for last 7 years ',
  //     "image":
  //         'https://img.freepik.com/free-photo/healthcare-workers-medicine-covid-19-pandemic-self-quarantine-concept-cheerful-smiling-hispanic-male-nurse-doctor-er-wearing-scrubs-glasses-talking-patient-clinic_1258-58757.jpg?size=626&ext=jpg&ga=GA1.2.1159008489.1659462743&semt=ais',
  //     "workplace": " Dr. Hedgewar Hospital, Aurangabad, Maharashtra ",
  //     "career":
  //         " Well versed and vastly experienced in all the specialty areas of Radiology, namely - Conventional Radiology, Ultrasound, Colour Doppler, CT scan, MRI, Mammography and Imaging guided diagnostic and Therapeutic procedures.",
  //     "rating": "⭐⭐⭐⭐",
  //     "exp": "15 years",
  //     "patients": "670",
  //     "language": "English/Hindi",
  //     "hospAdd":
  //         'Near Gajanand Maharaj Mandir, Road, Jawahar Colony, Garkheda, Aurangabad, Maharashtra 431005'
  //   },
  //   {
  //     "name": 'DR. R. B. SHARMA',
  //     "qualification": " MD (Medicine)",
  //     "speciality": " Consultant Physician and Diabetologist ",
  //     "experience":
  //         '25 years of Clinical experience in medicine & diabetes. Since 1991 working with Kamalnayan Ikon Hospital. ',
  //     "image":
  //         'https://img.freepik.com/free-photo/doctor-examines-patient-medicine-health-care-concept_1328-3146.jpg?size=626&ext=jpg&ga=GA1.2.1159008489.1659462743&semt=ais',
  //     "workplace": " Ikon Hospital, Aurangabad, Maharashtra ",
  //     "career":
  //         " MD (Medicine in 1986 from University of Rajasthan. Post MD, trained & worked in Bombay Hospital, Mumbai from 1987 to 1991 in Dept. Head - Dept. of Health check ups. Vice President - State level conference of diabetes - 'Maharashtra Chapter of RSSDI 2009",
  //     "rating": "⭐⭐⭐⭐",
  //     "exp": "25 years",
  //     "patients": "1250",
  //     "language": "English/Hindi",
  //     "hospAdd":
  //         'Rose Park, Majnu Hill Rd, opp. Ganesh Colony, TV Centre Rd, Cidco, Aurangabad, Maharashtra 431001'
  //   }
  // ];
  // addData() async {
  //   for (var element in data) {
  //     FirebaseFirestore.instance.collection("doctors").add(element);
  //   }
  //   print("all data added");
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   addData();
  // }

  // {
  //   "name": "DR. AMOL SULAKHE",
  //   "qualification": "M.S. (ENT), D.N.B. (ENT)",
  //   "speciality": "ENT Surgeon (Otorhinolaryngologist)",
  //   "experience":
  //       "More than17 years of clinical experience at various hospitals. Delivered lectures & attended many conferences & Seminars on ENT at National level.",
  //   "image": "http://bajajhospital.com/Images/DrAmolSulakhe.png",
  //   "workplace": "Kamalnayan Bajaj Hospital , Aurangabad, Maharasthra",
  //   "career":
  //       "Attended workshops & trainings in more than 20 various specializations in ENT. Member of Indian Association of Otorhinolaryngologist of India. Member of Indian Society of Otology. Member of Indian Association of Bronchology. Member of IMA Aurangabad & Jt.Secretary of Association of Otorhinolaryngologist of Aurangabad."
  // },
  // {
  //   "name": "DR. R. B. SHARMA",
  //   "qualification": "MD (Medicine)",
  //   "speciality": "Consultant Physician and Diabetologist",
  //   "experience":
  //       "25 years of Clinical experience in medicine & diabestes. Since 1991 working with Kamalnayan Bajaj Hospital.",
  //   "image": "http://bajajhospital.com/Images/DrRBSharma.png",
  //   "workplace": "Kamalnayan Bajaj Hospital , Aurangabad, Maharasthra",
  //   "career":
  //       "MD (Medicine in 1986 from University of Rajasthan. Post MD, trained & worked in Bombay Hospital, Mumbai from 1987 to 1991 in Dept. Head - Dept. of Health check ups. Vice President - State level conference of diabetes - 'Maharashtra Chapter of RSSDI 2009'"
  // },
  // {
  //   "name": "DR. THOMAS GEORGE",
  //   "qualification": " M.D. (Radiology)",
  //   "speciality": "Radiologist",
  //   "experience":
  //       "15 years of post MD experience in various top Corporate Hospitals in India and abroad. He has been associated with Kamalnayan Bajaj Hospital for last 7 years.",
  //   "image": "http://bajajhospital.com/Images/DrThomasGeorge.png",
  //   "workplace": "Kamalnayan Bajaj Hospital , Aurangabad, Maharasthra",
  //   "career":
  //       "Well versed and vastly experienced in all the specialty areas of Radiology, namely - Conventional Radiology, Ultrasound, Colour Doppler, CT Scan, MRI, Mammography and Imaging guided diagnostic and Therapeutic procedures."
  // },
  // {
  //   "name": "DR. AJAY TAMMEWAR",
  //   "qualification": "M.S. (Ophthalmology)",
  //   "speciality": "Ophthalmology - Retina",
  //   "experience":
  //       "More than 18 years of clinical experience in Ophthalmology and Vitreo-retinal diseases. Visiting Professor in Ophthalmology at PVPM Medical College, Ahmednagar.",
  //   "image": "http://bajajhospital.com/Images/DrAjayTammewar.png",
  //   "workplace": "Kamalnayan Bajaj Hospital , Aurangabad, Maharasthra",
  //   "career":
  //       "Two years Clinical Fellowship in vitreo-retinal surgery and diseases of Uvea, under Dr. Freeman, at University of California, USA, and under Dr. P.N. Nagpal, Ahmedabad. Been Associate Professor in Ophthalmology, MGM's medical college, Aurangabad, from 1993 - 2010. More than 10 research publications in peer reviewed national and international journals. Delivered more than 20 invited lectures and talks in national, state and regional conferences and CMEs. Research fellowship (1990-92) by Council for Scientific and Industrial Research (CSIR), New Delhi"
  // },
  // {
  //   "name": "Dr. Ajeet Singh",
  //   "qualification": "MBBS, MD - Dermatology , Venereology & Leprosy",
  //   "speciality": "Trichologist, Cosmetologist, Dermatologist",
  //   "experience": "More than 16 years of clinical experience",
  //   "image":
  //       "https://s3-ap-southeast-1.amazonaws.com/practo-fabric/dr-ajeet-singh-1465795336-575e43084b281.jpg",
  //   "workplace": "Clinic - Skin solutions, Aurangabad, Maharashtra",
  //   "career":
  //       "MBBS, MD. Services - Dandruff Treatment, MesoGlow, Line and Wrinkle Smoothing, Dermoscopy, Hair Restoration, Skin Rejuvenation, Fractional Laser, Medical Vitiligo Treatment, Laser therapy, Skin Hydration, Skin Rash Treatment, Hyper Pigmentation Treatment, Anti Aging Treatment, Hydra Facial, Skin Biopsy, Skin Pulse Treatment, "
  // },
  // {
  //   "name": "DR. REKHA JAWALE",
  //   "qualification": "MBBS, DGO",
  //   "speciality":
  //       "Infertility, Labour, Uterus, Fallopian Tubes, Cervix, Vagina, and Ovaries, Delivery, Pregnancy, Menstruation, Laparoscopy, Reproductive Endocrinology & General Gynaecology",
  //   "experience":
  //       "working in Carewell Multispeciality Hospital in Aurangabad since 2014. She has huge experience in obstetrics and gynaecology. Dr. Rekha Jawale treats a wide range of pregnancy care and general gynaecology.",
  //   "image":
  //       "https://threebestrated.in/images/DrRekhaJawaleMBBSDGO-Aurangabad-MH.jpeg",
  //   "workplace": "Carewell Multispeciality Hospital, Aurangabad, Maharashtra",
  //   "career":
  //       "Dr. Rekha Jawale obtained her MBBS degree and DGO from the Government Medical College in Miraj. "
  // },
  // {
  //   "name": "DR. ANTARA DESHMUKH",
  //   "qualification":
  //       "B.P.Th, MPTh (Cardiorespiratory, Pulmonary and fitness), MIAFT (Fitness trainer)",
  //   "speciality": "Consultant Physiotherapist",
  //   "experience":
  //       "Worked for 1 year as a Junior Physiotherapist (H/O) at Hedgewar Rugnalay, Aurangabad. Clinical Experience of 4 years. Skilled in treating Neurological, orthopaedic, cardiovascular, sports injuries etc.",
  //   "image": "http://bajajhospital.com/Images/Dr%20Antara%20Deshmukh.jpg",
  //   "workplace": "Kamalnayan Bajaj Hospital, Aurangabad, Maharashtra",
  //   "career":
  //       "Worked for 1.5 years as an Assistant Lecturer in Aurangabad College of physiotherapy, Shiva Trusts, Aurangabad. Certified Fitness trainer, Pre and post natal Instructor trainer, Pilates Instructor Trainer, MATT therapist.  currently working as A Sub-Coordinator of the Indian Association of Physiotherapists Women Cell (IAPWC) Aurangabad District."
  // },
  // {
  //   "name": "Dr. Ajay Oswal",
  //   "qualification": "MBBS, MS (Surgery), DNB, M.Ch (Urology), MNAMS.",
  //   "speciality": "Sr. Consultant Urologist & Kidney Transplant Surgeon",
  //   "experience":
  //       "Dr. Ajay Oswal has been working as a  Sr. Consultant Urologist & Kidney Transplant Surgeon in Dhoot hospital since 2017.",
  //   "image":
  //       "https://dhoothospitals.com/wp-content/uploads/2018/10/Dr.-Ajay-Oswal-final-670x446.jpg",
  //   "workplace": "Dhoot Hospital, Aurangabad, Maharashtra",
  //   "career":
  //       "Dr. Oswal has led the teams which have a cumulative  experience of over 1200 renal transplants; of which he has performed over 1100 transplant surgeries (recipient) independently, with excellent surgical results. Treasurer during the Organization of the 26th West Zone USICON at Aurangabad, September 2016."
  // },

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: null,
        child: SafeArea(
            top: false,
            child: Scaffold(
              backgroundColor: ColorConstant.whiteA700,
              appBar: AppBar(
                backgroundColor: ColorConstant.lightBlue900,
                toolbarHeight: 150,
                automaticallyImplyLeading: false,
                title: Column(
                  children: [
                    Text(
                      "Search Doctors",
                      style: AppStyle.searchAnything,
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0)),
                          hintText: "Search Doctors",
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 30,
                          )),
                      onChanged: (val) {
                        setState(() {
                          var dr = "dr. ";
                          name = dr + val;
                        });
                      },
                    )
                  ],
                ),
              ),
              body: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("doctors")
                    .snapshots(),
                builder: (context, snapshot) {
                  return (snapshot.connectionState == ConnectionState.waiting)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          padding: EdgeInsets.all(10),
                          child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                var data = snapshot.data!.docs[index].data()
                                    as Map<String, dynamic>;
                                if (name.isEmpty) {
                                  return Container(
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: ColorConstant.docb),
                                    child: ListTile(
                                      title: TextScroll(
                                        data['name'],
                                        style: AppStyle.txtPoppinsExtraBold29,
                                        numberOfReps: 1,
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: Colors.white,
                                        weight: 10,
                                      ),
                                      contentPadding: EdgeInsets.all(15),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => doctorData(
                                                  email: data['name']),
                                            ));
                                      },
                                      textColor: Colors.white,
                                    ),
                                  );
                                }
                                if (data['name']
                                    .toString()
                                    .toLowerCase()
                                    .startsWith(name.toLowerCase())) {
                                  return Container(
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: ColorConstant.docb),
                                    child: ListTile(
                                      title: TextScroll(
                                        data['name'],
                                        style: AppStyle.txtPoppinsExtraBold29,
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: Colors.white,
                                        weight: 10,
                                      ),
                                      contentPadding: EdgeInsets.all(15),
                                      textColor: Colors.white,
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => doctorData(
                                                  email: data['name']),
                                            ));
                                      },
                                    ),
                                  );
                                }
                                return Container();
                              }),
                        );
                },
              ),
              bottomNavigationBar: Container(
                  height: getVerticalSize(190),
                  width: MediaQuery.of(context).size.width,
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            height: getVerticalSize(82),
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: ColorConstant.lightBlue900,
                                borderRadius: BorderRadius.circular(
                                    getHorizontalSize(28))))),
                    CustomImageView(
                        svgPath: ImageConstant.doctorssearch,
                        height: getVerticalSize(88),
                        width: getHorizontalSize(114),
                        alignment: Alignment.center,
                        margin: getMargin(top: 20)),
                    Align(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: getPadding(left: 34, top: 100),
                            child: Row(children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgHome,
                                  height: getSize(35),
                                  width: getSize(35),
                                  onTap: () {
                                    onTapImgHome();
                                  }),
                              CustomImageView(
                                  svgPath: ImageConstant.imgLocation,
                                  height: getVerticalSize(34),
                                  width: getHorizontalSize(27),
                                  margin: getMargin(left: 52),
                                  onTap: () {
                                    onTapImgLocation();
                                  })
                            ]))),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: getPadding(top: 100, right: 46),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgCalendar,
                                      height: getVerticalSize(32),
                                      width: getHorizontalSize(34),
                                      margin: getMargin(top: 2),
                                      onTap: () {
                                        onTapImgCalendar();
                                      }),
                                  CustomImageView(
                                      svgPath: ImageConstant.imgUser,
                                      height: getVerticalSize(35),
                                      width: getHorizontalSize(30),
                                      margin: getMargin(left: 48),
                                      onTap: () {
                                        onTapImgUser();
                                      })
                                ]))),
                    CustomImageView(
                        svgPath: ImageConstant.imgSearch,
                        height: getVerticalSize(32),
                        width: getHorizontalSize(34),
                        alignment: Alignment.topCenter,
                        margin: getMargin(top: 77))
                  ])),
            )));
    ;
  }

  onTapImgHome() {
    Get.toNamed(AppRoutes.homeScreen);
  }

  onTapImgLocation() {
    Get.toNamed(AppRoutes.mapsScreen);
  }

  onTapImgCalendar() {
    Get.toNamed(AppRoutes.calanderScreen);
  }

  onTapImgUser() {
    Get.toNamed(AppRoutes.profileScreen);
  }
}
