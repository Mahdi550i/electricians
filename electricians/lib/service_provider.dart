class ServiceProvider {
  String name;
  String profession;
  String description;
  String phone;
  bool isIndividual;


  ServiceProvider({
    required this.name,
    required this.profession,
    required this.description,
    required this.phone,
    required this.isIndividual,
  });


  String get getName => name;
  String get getProfession => profession;
  String get getDescription => description;
  String get getPhone => phone;
  bool get getIsIndividual => isIndividual;


  @override
  String toString() {
    return '''
 $name
 $profession 
 $phone
 $description
''';
  }
}


List<ServiceProvider> providers = [
  ServiceProvider(
    name: 'Ahmad',
    profession: 'Plumber',
    description: 'Expert in pipe fitting and repair.',
    phone: '78888999',
    isIndividual: true,
  ),
  ServiceProvider(
    name: 'peter',
    profession: 'Electrician',
    description: 'Experienced company for electrical services.',
    phone: '79999666',
    isIndividual: false,
  ),
  ServiceProvider(
    name: 'Eli',
    profession: 'Carpenter',
    description: 'Skilled in woodwork and furniture making.',
    phone: '71123456',
    isIndividual: true,
  ),
  ServiceProvider(
    name: 'Nour',
    profession: 'Plumber',
    description: 'Trusted plumbing services.',
    phone: '03030306',
    isIndividual: false,
  ),
  ServiceProvider(
    name: 'Housain',
    profession: 'Electrician',
    description: 'Specializes in residential and commercial lighting.',
    phone: '70123321',
    isIndividual: false,
  ),
  ServiceProvider(
    name: 'Emad',
    profession: 'Carpenter',
    description: 'Custom cabinetry and wood repair.',
    phone: '81125874',
    isIndividual: true,
  ),
  ServiceProvider(
    name: 'charbel',
    profession: 'Electrician',
    description: 'Eco-friendly electrical solutions.',
    phone: '79809147',
    isIndividual: false,
  ),
  ServiceProvider(
    name: 'Khalil',
    profession: 'Plumber',
    description: 'Leak detection and bathroom fitting.',
    phone: '03369963',
    isIndividual: true,
  ),
  ServiceProvider(
    name: 'gorge',
    profession: 'Carpenter',
    description: 'High-quality woodwork.',
    phone: '76693321',
    isIndividual: false,
  ),
  ServiceProvider(
    name: 'Mousa',
    profession: 'Electrician',
    description: 'Fast and reliable electrical repairs.',
    phone: '03030201',
    isIndividual: false,
  ),
];
