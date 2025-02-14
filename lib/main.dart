import 'package:flutter/material.dart';
import 'package:diacritic/diacritic.dart';

void main() {
  runApp(const MessiQuizApp());
}

class MessiQuizApp extends StatelessWidget {
  const MessiQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int step = 0;

  // Lista de mensajes con su respectiva imagen (si corresponde)
  final List<Map<String, dynamic>> messages = [
    {
      "text": "Hola Hermoso, felices 6 años!!!",
      "image": "assets/jani.jpg",
    },
    {
      "text": "Te amo mucho",
      "image": "assets/linda1.jpg",
    },
    {
      "text":
          "Se que estas esperando la camiseta....",
      "image": null,
    },
    {
      "text":
          "pero la vida no es facil, asi que te la vas a tener que ganar",
      "image": null,
    },
    {
      "text":
          "Para eso tenes que aprobar este examen",
      "image": null,
    },
    {
      "text":
          "Y el tema que te toco es: San lorenzo",
      "image": "assets/sl2.jpg",
    },
    {
      "text":
          "JAJA ya quisieras",
      "image": null,
    },
    {
      "text":
          "es sobre NOSOTROS :)",
      "image": null,
    },
    {
      "text": "Si messi pudo ganar el mundial vos podes ganar este juego!!!",
      "image": "assets/correct_answer.jpg",
    },
    {
      "text": "Si desaprobas tu camiseta sera vendida en Mercado Libre",
      "image": "assets/meli.jpg",
    },
    {
      "text": "Suerte, te amo!!!!",
      "image": "assets/linda2.jpg",
    },
  ];

  // Función para pasar al siguiente mensaje
  void nextStep() {
    if (step < messages.length - 1) {
      setState(() {
        step++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const QuizScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: GestureDetector(
        onTap: nextStep, // Detectar clic en cualquier parte de la pantalla
        child: Container(
          // Usar un Container que ocupe toda la pantalla
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromARGB(255, 133, 158,
              202), // Asegurarse de que el fondo cubra toda la pantalla
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Mostrar el texto del mensaje actual
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      messages[step]['text'],
                      key: ValueKey(step),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Mostrar la imagen si está presente
                  if (messages[step]['image'] != null)
                    Image.asset(
                      messages[step]['image']!,
                      width: 400,
                      height: 400,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionIndex = 0;
  int correctAnswers = 0;

  // Controlador para el campo de texto en preguntas de completar
  final TextEditingController _completarController = TextEditingController();

  final List<Map<String, dynamic>> questions = [
    {
      "question": "Donde fue nuestra primera cita?",
      "options": ["El club de la milanesa", "La muzza", "Mc Donalds", "Barley"],
      "answer": "Mc Donalds",
      "type": "opcionesMultiples",
      "questionImage": null,
      "image": "assets/linda2021.jpg",
      "correctMessage":
          "¡Correcto! Todo empezo en el mc de guemes. Vos no te terminaste la hamburguesa",
      "incorrectMessage": "Incorrecto... fuimos al mc. Arrancamos mal",
    },
    {
      "question": "En que año viajamos a Chile?",
      "options": ["2020", "2021", "2022", "2023"],
      "answer": "2022",
      "type": "opcionesMultiples",
      "questionImage": null,
      "image": "assets/chile-nieve.jpg",
      "correctMessage": "¡Correcto! Fuimos en 2022. Sos bueno para los años",
      "incorrectMessage": "Incorrecto... La respuesta correcta es: 2022.",
    },
    {
      "question": "En que cerro de Chile comimos el mote con huesillo?",
      "options": [
        "Cerro Santa Lucía",
        "Cerro San Cristóbal",
        "Cerro Manquehue",
        "Cerro Leonera"
      ],
      "answer": "Cerro San Cristóbal",
      "type": "opcionesMultiples",
      "questionImage": "assets/chile-comida.jpg",
      "image": "assets/san-cristobal.jpg",
      "correctMessage": "¡Correctoooo! Esa pense que le errabas",
      "incorrectMessage": "Incorrecto... era el San Cristobal. No me putees",
    },
    {
      "question":
          "Como se llama la cancion de Camilo que arranca con 'tu debes ser ingeniera...'?",
      "options": ["Vida de rico", "La boda", "La mitad", "Millones"],
      "answer": "Millones",
      "type": "opcionesMultiples",
      "questionImage": null,
      "image": "assets/camilo.jpg",
      "correctMessage": "¡Bieeeen! Cantame un poquito...",
      "incorrectMessage": "Nooooo... hay que practicar para el concierto",
    },
    {
      "question": "En que lugar sacamos esta foto?",
      "answer": "Cordoba",
      "type": "completar",
      "questionImage": "assets/cordoba2.jpg", // Imagen para la pregunta
      "image": "assets/cordoba1.jpg", // Imagen para la respuesta
      "correctMessage": "¡Bieeeeen!",
      "incorrectMessage": "Incorrecto... Cordoba 2021 con tu familia!!",
    },
    {
      "question": "Y esta foto donde es?",
      "answer": "Miramar",
      "type": "completar",
      "questionImage": "assets/miramar.jpg", // Imagen para la pregunta
      "image": "assets/miramar2.jpg", // Imagen para la respuesta
      "correctMessage": "¡Siiiiii!",
      "incorrectMessage": "Incorrecto... Miramar en marzo 2022!!",
    },
        {
      "question": "Y esta donde es?",
      "answer": "Carilo",
      "type": "completar",
      "questionImage": "assets/carilo2021-2.jpg", // Imagen para la pregunta
      "image": "assets/carilo2021.jpg", // Imagen para la respuesta
      "correctMessage": "Siii Carilo con tu familia en 2021",
      "incorrectMessage": "Incorrecto... Carilo con tu familia en 2021",
    },
    {
      "question":
          "Ahora preguntas del viaje a disney.. En que parque comimos esto?",
      "options": [
        "Magic Kingdom",
        "EPCOT",
        "Hollywood Studios",
        "Animal Kingdom"
      ],
      "answer": "Hollywood Studios",
      "type": "opcionesMultiples",
      "questionImage": "assets/holly1.jpg",
      "image": "assets/holly2.jpg",
      "correctMessage":
          "¡Bieeen! En Docking Bay 7, el restaurante de Star Wars",
      "incorrectMessage":
          "nop, fue en Docking Bay 7, el restaurante de Star Wars en Hollywood Studios",
    },
    {
      "question": "Cuantas veces nos subimos a la montaña de Everest?",
      "options": ["1", "2", "3", "4"],
      "answer": "4",
      "type": "opcionesMultiples",
      "questionImage": "assets/everest1.jpg",
      "image": "assets/everest2.jpg",
      "correctMessage": "Un monton, re sacados",
      "incorrectMessage": "nooo fue la unica que nos subimos 4 veces",
    },
    {
      "question": "En que parque comimos esto??",
      "options": [
        "Magic Kingdom",
        "EPCOT",
        "Hollywood Studios",
        "Animal Kingdom"
      ],
      "answer": "EPCOT",
      "type": "opcionesMultiples",
      "questionImage": "assets/ep1.jpg",
      "image": "assets/ep2.jpg",
      "correctMessage": "Si, mi comida favorita",
      "incorrectMessage": "No te acordas del show de Epcot???",
    },
    {
      "question": "En que parque me compre el licuado de frutilla??",
      "options": [
        "Magic Kingdom",
        "EPCOT",
        "Hollywood Studios",
        "Animal Kingdom"
      ],
      "answer": "Magic Kingdom",
      "type": "opcionesMultiples",
      "questionImage": "assets/mk1.jpg",
      "image": "assets/mk2.jpg",
      "correctMessage": "Obvio que siiii",
      "incorrectMessage":
          "Me sacaste 80 fotos con el licuadito en Magic Kingdom!!",
    },
    {
      "question": "Cuantos messi tenia el mural de miami?",
      "answer": "4",
      "type": "completar",
      "questionImage": "assets/mural1.jpg", // Imagen para la pregunta
      "image": "assets/mural2.jpg", // Imagen para la respuesta
      "correctMessage": "Eso si te acordas flaco??",
      "incorrectMessage": "Noooo 4, que poco sabes de Messi",
    },
    {
      "question": "Con cuantas valijas volvimos de Miami los 4?",
      "answer": "11",
      "type": "completar",
      "questionImage": "assets/val1.jpg", // Imagen para la pregunta
      "image": "assets/val2.jpg", // Imagen para la respuesta
      "correctMessage": "Siiii un monton",
      "incorrectMessage":
          "Noooo 11: yo 3 + carry on (4), vos 2 + carry on (7), papa 1 (8) y mama 2 + carry on (11)",
    },
    {
      "question": "¿A quién preferís: a Messi o a mí?",
      "options": ["Messi", "Cami"],
      "answer": "Cami",
      "type": "eleccionUnica",
      "questionImage": null,
      "image": "assets/jani2022.jpg",
      "correctMessage": "¡Respuesta correcta! :)",
      "incorrectMessage": "", // 🔹 Agregar esto evita el error
    },
  ];

  void checkAnswer(BuildContext context, dynamic selectedAnswer) {
    final correct = questions[questionIndex]['answer'];
    bool isCorrect;

    if (questions[questionIndex]['type'] == 'completar') {
      // Normalizamos eliminando acentos y convirtiendo a minúsculas
      String normalizedUserAnswer =
          removeDiacritics(selectedAnswer.trim().toLowerCase());
      String normalizedCorrectAnswer =
          removeDiacritics(correct.trim().toLowerCase());

      isCorrect = normalizedUserAnswer == normalizedCorrectAnswer;
    } else {
      isCorrect = selectedAnswer == correct;
    }

    if (isCorrect) correctAnswers++;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnswerScreen(
          isCorrect: isCorrect,
          onNext: () {
            if (questionIndex < questions.length - 1) {
              setState(() {
                questionIndex++;
              });
              Navigator.pop(context);
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultScreen(correctAnswers,
                        totalAnswers: questions.length)),
              );
            }
          },
          correctAnswer: correct,
          imagePath: questions[questionIndex]['image'],
          correctMessage: questions[questionIndex]['correctMessage'],
          incorrectMessage: questions[questionIndex]['incorrectMessage'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 152, 120),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "${questionIndex + 1} : ${currentQuestion["question"]}", // currentQuestion["question"],
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            // Mostrar imagen de la pregunta
            if (currentQuestion["questionImage"] != null)
              Image.asset(
                currentQuestion["questionImage"],
                width: 300,
                height: 300,
              ),
            const SizedBox(height: 20),
            if (currentQuestion["type"] == "opcionesMultiples")
              ...currentQuestion["options"].map<Widget>((option) => Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ElevatedButton(
                      onPressed: () => checkAnswer(context, option),
                      child: Text(option),
                    ),
                  )),
            if (currentQuestion["type"] == "completar")
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: _completarController, // Usamos el controlador
                      decoration: const InputDecoration(
                        hintText: "Escribí tu respuesta",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (value) => checkAnswer(context, value),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Obtenemos el valor ingresado en el TextField
                      String userAnswer = _completarController.text;
                      checkAnswer(context, userAnswer);
                      _completarController.text = "";
                    },
                    child: const Text("Enviar respuesta"),
                  ),
                ],
              ),
            if (currentQuestion["type"] == "eleccionUnica")
              ...currentQuestion["options"].map<Widget>((option) => Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (option == currentQuestion["answer"]) {
                          checkAnswer(context,
                              option); // Solo avanza si es la respuesta correcta
                        }
                      },
                      child: Text(option),
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}

class AnswerScreen extends StatelessWidget {
  final bool isCorrect;
  final VoidCallback onNext;
  final dynamic correctAnswer;
  final String imagePath;
  final String correctMessage;
  final String incorrectMessage;

  const AnswerScreen({
    super.key,
    required this.isCorrect,
    required this.onNext,
    required this.correctAnswer,
    required this.imagePath,
    required this.correctMessage,
    required this.incorrectMessage,
  });

  @override
  Widget build(BuildContext context) {
    String message = isCorrect ? correctMessage : incorrectMessage;

    return Scaffold(
      backgroundColor: isCorrect ? Colors.green : Colors.red,
      body: GestureDetector(
        onTap: onNext,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: isCorrect ? Colors.green : Colors.red,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    message,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(imagePath, width: 300, height: 300),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int correctAnswers;
  final int totalAnswers;

  const ResultScreen(this.correctAnswers,
      {super.key, required this.totalAnswers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.favorite, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            Text(
              "Respondiste $correctAnswers de $totalAnswers preguntas correctamente.",
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 40),
            const Text(
              "Tu nota es dudosa",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Te recomiendo comunicarte con la catedra para negociar el aprobado",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),            
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  Navigator.popUntil(context, (route) => route.isFirst),
              child: const Text("Jugar de nuevo"),
            ),
          ],
        ),
      ),
    );
  }
}
