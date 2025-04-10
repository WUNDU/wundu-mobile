// import 'package:flutter/widgets.dart';

// class TelaNotificaEsScreen extends StatelessWidget {
// const TelaNotificaEsScreen({Key? key})
// : super(
// key: key,
// );

// static Widget builder(BuildContext context) {
// return BlocProvider<TelaNotificaEsBloc>(
// create: (context) => TelaNotificaEsBloc(TelaNotificaEsState(
// telaNotificaEsModelObj: TelaNotificaEsModel(),

// .. add(TelaNotificaEsInitialEvent()),
// child: TelaNotificaEsScreen(),

// Main4xisSize.max.

// @override
// Widget build(BuildContext context) {
// return Scaffold(
// backgroundColor: appTheme.blueGray50,
// appBar: _buildAppbar(context),
// body: SafeArea(
// top: false,
// child: Container(
// width: double.maxFinite,
// padding: EdgeInsets.only(
// left: 14.h,
// top: 18.h,
// right: 14.h,

// child: Column(
// mainAxisSize: MainAxisSize.max,
// children: [
// Expanded(
// child: Container(
// width: double.maxFinite,
// padding: EdgeInsets.all(10.h),
// decoration: AppDecoration.outlineGray.copyWith(
// borderRadius: BorderRadiusStyle.roundedBorder16,

// child: Column(
// spacing: 24,
// mainAxisSize: MainAxisSize.max
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// "1bl_notifica_es".tr,
// style: CustomTextStyles.headlineSmallBluegray900,

// SizedBox(
// width: double.maxFinite,
// child: Divider(
// indent: 8.h,
// endIndent: 8.h,

// _buildTelanotificae(context)

// SizedBox(height: 32.h)

// /// Section Widget
// PreferredSizeWidget _buildAppbar(BuildContext context) {
// return CustomAppBar(
// height: 56.h,
// leadingWidth: 57.h,
// leading: Container(
// height: 14.h,
// width: 22.h,
// margin: EdgeInsets.only(left: 35.h),
// child: Stack(
// children: [
// CustomImageView(
// imagePath: ImageConstant.imgVector,
// height: 1.h,
// width: double.maxFinite,
// ),
// CustomImageView(
// imagePath: ImageConstant.imgVectorGray90002,
// height: 14.h,
// width: 8.h,
// alignment: Alignment.centerLeft,
// margin: EdgeInsets.only(right: 16.h),
// ),
// title: AppbarSubtitleOne(
// text: "1bl_voltar".tr,
// margin: EdgeInsets.only(left: 14.h),

// /// Section Widget
// Widget buildTelanotificae(BuildContext context) {
// return Expanded (
// child: BlocSelector<TelaNotificaEsBloc, TelaNotificaEsState,
// TelaNotificaEsModel?>(
// selector: (state) => state.telaNotificaEsModelObj,
// builder: (context, telaNotificaEsModelobj) {
// return ListView.separated(
// padding: EdgeInsets.zero,
// physics: BouncingScrollPhysics(),
// shrinkWrap: true,
// separatorBuilder: (context, index) {
// return Padding(
// padding: EdgeInsets.symmetric(vertical: 15.0.h),
// child: Divider(
// height: 1.h,
// thickness: 1.h,
// color: appTheme.gray30003.withValues(
// alpha: 0.4,

// );

// itemCount:
// telaNotificaEsModelbj ?. telanotificaEItemList.length ?? 0,
// itemBuilder: (context, index) {
// TelanotificaEItemModel model =
// telaNotificaEsModelObj ?. telanotificaEItemList[index] ??
// TelanotificaEItemModel();
// return TelanotificaEItemWidget(
// model,

// }