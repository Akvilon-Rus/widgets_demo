import 'package:flutter/material.dart';

class SwitchesDemoScreen extends StatefulWidget {
  const SwitchesDemoScreen({Key? key}) : super(key: key);

  @override
  _SwitchesDemoScreenState createState() => _SwitchesDemoScreenState();
}

enum SkillLevel {junior,middle,senior}

class _SwitchesDemoScreenState extends State<SwitchesDemoScreen> {
  bool _checked = false;
  bool _ConfirmAgreement = true;
  SkillLevel? _skillLevel= SkillLevel.junior;

  void _OnCheckedChange(bool? val){
    setState(() {
      _checked= !_checked;
    });

  }
  void _onSkillLevelChanged (SkillLevel? value) {
  setState(() {
  _skillLevel = value;
  });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(),
            body: Center(
                child: Column(children: [
              Row(
                children: [
                  Checkbox(value:_checked, onChanged:_OnCheckedChange),
                  Text('Выбор'),
                ],
              ),
                  CheckboxListTile(
                    title: Text('Принять условия соглашения'),
                      value: _ConfirmAgreement, onChanged: (val) {
                      setState(() {
                        _ConfirmAgreement=!_ConfirmAgreement;
                      });
                  }),
                  Row(
                    children: [
                      Switch(value: _checked, onChanged:_OnCheckedChange),
                      const Text("Включить"),
                    ],
                  ),
                  SwitchListTile(
                      title: Text('Включить'),
                      value: _checked,
                      onChanged:_OnCheckedChange),
                  const Text('Уровень навыков:'),
                  RadioListTile<SkillLevel>(
                    title: const Text('Junior'),
                    value: SkillLevel.junior,
                    groupValue: _skillLevel,
                    onChanged: _onSkillLevelChanged,
                  ),
                  RadioListTile<SkillLevel>(
                    title: const Text('Middle'),
                    value: SkillLevel.middle,
                    groupValue: _skillLevel,
                    onChanged: _onSkillLevelChanged,
                  ),
                  RadioListTile<SkillLevel>(
                    title: const Text('Senior'),
                    value: SkillLevel.senior,
                    groupValue: _skillLevel,
                    onChanged:_onSkillLevelChanged,
                  ),
            ]))));
  }
}
