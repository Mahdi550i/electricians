import 'package:flutter/material.dart';
import 'service_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedType = 'Any';
  String? selectedProfession;
  String? selectedProviderName;

  List<String> professions = ['Plumber', 'Electrician', 'Carpenter'];


  List<ServiceProvider> getFilteredProviders() {
    return providers.where((provider) {
      bool matchesType = selectedType == 'Any' ||
          (selectedType == 'Individual' && provider.isIndividual) ||
          (selectedType == 'Company' && !provider.isIndividual);
      bool matchesProfession = selectedProfession == null || provider.profession == selectedProfession;
      return matchesType && matchesProfession;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<ServiceProvider> filteredProviders = getFilteredProviders();

    return Scaffold(
      appBar: AppBar(
        title: Text('Service Providers'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ['Individual', 'Company', 'Any'].map((type) {
                return Row(
                  children: [
                    Radio(
                      value: type,
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                          selectedProviderName = null;
                        });
                      },
                    ),
                    Text(type),
                  ],
                );
              }).toList(),
            ),

            SizedBox(height: 16),


            Container(
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButton<String>(
                value: selectedProfession,
                hint: Text('Select a Profession'),
                isExpanded: true,
                underline: SizedBox(),
                items: professions.map((profession) {
                  return DropdownMenuItem(
                    value: profession,
                    child: Text(profession),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedProfession = value;
                    selectedProviderName = null;
                  });
                },
              ),
            ),

            SizedBox(height: 16),


            Container(
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButton<String>(
                value: selectedProviderName,
                hint: Text('Select a Provider'),
                isExpanded: true,
                underline: SizedBox(),
                items: filteredProviders.map((provider) {
                  return DropdownMenuItem(
                    value: provider.name,
                    child: Text(provider.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedProviderName = value;
                  });
                },
              ),
            ),

            SizedBox(height: 16),


            if (selectedProviderName != null)
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedProviderName!,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      filteredProviders
                          .firstWhere((provider) => provider.name == selectedProviderName)
                          .phone,
                    ),
                    SizedBox(height: 8),
                    Text(
                      filteredProviders
                          .firstWhere((provider) => provider.name == selectedProviderName)
                          .description,
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
