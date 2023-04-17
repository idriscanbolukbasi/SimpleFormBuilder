part of 'question_widget.dart';

class _SimpleDropdown extends StatelessWidget {
  _SimpleDropdown({
    Key? key,
    required this.questions,
    required this.showIndex,
    required this.index,
    required this.showIcon,
    this.remarkImage,
    this.checklistModel,
    this.dropdownImage,
    this.descriptionTextDecoration,
    this.dropdownDecoration,
  }) : super(key: key);

  final Questions questions;
  final ChecklistModel? checklistModel;
  final bool showIndex;
  final String? dropdownImage;
  final String? remarkImage;
  final int index;
  final bool showIcon;
  final TextStyle? descriptionTextDecoration;
  final DropdownDecoration? dropdownDecoration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: (dropdownDecoration!
              .showInRow) // if the showInRow property from the dropdownDecoration is true then render the form in row
          ? [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildForm(context))
            ]
          : _buildForm(context), // else render the form in column
    );
  }

  List<Widget> _buildForm(BuildContext context) {
    // extract this method for easy render in row or column
    return <Widget>[
      dropdownDecoration!
              .showInRow // if the showInRow property from the dropdownDecoration is true
          ? Flexible(
              child: _buildTitle(
                  context)) // then render the title in Flexible widget to prevent overflow
          : _buildTitle(context), // else render the title in normal widget
      dropdownDecoration!
              .showInRow // if the showInRow property from the dropdownDecoration is true
          ? Flexible(
              child: _buildDropdown(
                  context)) // then render the dropdown in Flexible widget to prevent overflow
          : _buildDropdown(
              context), // else render the dropdown in normal widget
      _buildRemarkWidget(context) // render the remark widget
    ];
  }

  Widget _buildRemarkWidget(BuildContext context) {
    // render the remark widget
    return Consumer<FormBuilderProvider>(
      builder: (context, value, child) {
        return _RemarkWidget(
          questions: questions,
          remark: showIcon,
          icon: remarkImage,
          onChanged: (input) {
            value.setRemark(questions, input, index);
          },
        );
      },
    );
  }

  Widget _buildDropdown(BuildContext context) {
    // render the dropdown widget
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24,
      ),
      child: Container(
        width: screenWidth(context: context, mulBy: dropdownDecoration?.width),
        height: 50,
        decoration: dropdownDecoration
                ?.decoration ?? // set the decoration property from the dropdownDecoration
            BoxDecoration(
              // else set the default decoration
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: questions.answer != null ? Colors.blue : Colors.grey,
              ),
            ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<FormBuilderProvider>(
            builder: ((context, value, child) {
              return DropdownButton(
                itemHeight: dropdownDecoration?.itemHeight?.toDouble() ??
                    50.0, // set the itemHeight property from the dropdownDecoration
                icon: Icon(
                  dropdownDecoration?.icon ??
                      Icons
                          .arrow_drop_down, // set the icon property from the dropdownDecoration
                  color: dropdownDecoration?.iconColor ??
                      Colors
                          .grey, // set the iconColor property from the dropdownDecoration
                ),
                underline: dropdownDecoration?.underline ??
                    Container(
                      height: 0,
                      color: Colors.transparent,
                    ),
                hint: (dropdownDecoration!
                        .showHint) // if the showHint property from the dropdownDecoration is true
                    ? Text(dropdownDecoration?.hintText ?? "Select",
                        style: dropdownDecoration
                            ?.hintStyle) // print the hintText property from the dropdownDecoration
                    : Text(
                        questions.fields!
                            .first, // else print the first item from the fields list
                        style: TextStyle(
                          color: questions.answer != null
                              ? Colors.black
                              : dropdownDecoration?.textColor,
                        ),
                      ),
                isExpanded: true,
                iconSize: 30.0,
                style: TextStyle(color: Colors.grey),
                items: questions.fields!.map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (input) {
                  value.setAnswer(
                    questions: questions,
                    value: input,
                    index: index,
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showIcon ? IconContainer(icon: dropdownImage) : Container(),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
                "${showIndex ? "${checklistModel!.data![index].questions!.indexOf(questions) + 1}. " : ""}${questions.title}"),
          ),
          dropdownDecoration!
                  .showDescription // if the showDescription property from the dropdownDecoration is true
              ? DescriptionWidget(
                  // then render the description widget
                  questions: questions,
                  textStyle: descriptionTextDecoration,
                )
              : Container(), // else render an empty container
        ],
      ),
    );
  }
}
