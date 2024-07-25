using System.Text.Json;
using math_quiz_web_aspnet.Controllers;

namespace math_quiz_web_aspnet.Models;

public class QuizService
{
    public static readonly Dictionary<QuizType, Dictionary<int, Quiz>> QuizMap = [];
    
    static QuizService()
    {
        QuizMap[QuizType.Original] = loadClassicQuiz("quiz-questions/Original.json");
        QuizMap[QuizType.OriginalBinHex] = loadClassicBinryQuiz("quiz-questions/OriginalBinHex.json");
        QuizMap[QuizType.Summer] = loadQuiz("quiz-questions/Summer.json");
        QuizMap[QuizType.PlusSingleDigit] = loadQuiz("quiz-questions/PlusSingleDigit.json");
        QuizMap[QuizType.PlusDoubleDigit] = loadQuiz("quiz-questions/PlusDoubleDigit.json");
        QuizMap[QuizType.TimesTableFull] = loadQuiz("quiz-questions/TimesTableFull.json");
        QuizMap[QuizType.TimesTableUpToFive] = loadQuiz("quiz-questions/TimesTableUpToFive.json");
    }

    static Dictionary<int, Quiz> loadClassicQuiz(string filePath)
    {
        string json = System.IO.File.ReadAllText(filePath);
        JsonDocument jsonDoc = JsonDocument.Parse(json);
        int size = jsonDoc.RootElement.GetArrayLength();

        Dictionary<int, Quiz> idToQuizMap = [];
        for (int i = 0; i < size; i++) {
            JsonElement quizElement = jsonDoc.RootElement[i];
            int quizId = quizElement.GetProperty("id").GetInt32();
            
            // Ignore if we already have a quiz with this id. This could happen as when we generate the quiz
            // we just create random 6 digit integer.
            if (idToQuizMap.ContainsKey(quizId)) 
            {
                continue;
            }

            Quiz quiz = new(quizId);
            List<Question> questions = readQuestions(quizElement.GetProperty("questions"));
            quiz.AddSection("Multiplication & Division", questions.Take(30).ToList());
            quiz.AddSection("Plus & Minus", questions.Skip(30).ToList());
            idToQuizMap.Add(quizId, quiz);
        }

        return idToQuizMap;
    }

    static Dictionary<int, Quiz> loadClassicBinryQuiz(string filePath)
    {
        string json = System.IO.File.ReadAllText(filePath);
        JsonDocument jsonDoc = JsonDocument.Parse(json);
        int size = jsonDoc.RootElement.GetArrayLength();

        Dictionary<int, Quiz> idToQuizMap = [];
        for (int i = 0; i < size; i++) {
            JsonElement quizElement = jsonDoc.RootElement[i];
            int quizId = quizElement.GetProperty("id").GetInt32();
            
            // Ignore if we already have a quiz with this id. This could happen as when we generate the quiz
            // we just create random 6 digit integer.
            if (idToQuizMap.ContainsKey(quizId)) 
            {
                continue;
            }

            Quiz quiz = new(quizId);
            quiz.AddSection("Multiplication & Division", readQuestions(quizElement.GetProperty("times_division_questions")));
            quiz.AddSection("Plus & Minus", readQuestions(quizElement.GetProperty("plus_minus_questions")));
            quiz.AddSection("Binary", readQuestions(quizElement.GetProperty("binary_questions")));
            quiz.AddSection("Hex to binary", readQuestions(quizElement.GetProperty("hex_conversion_questions")));

            idToQuizMap.Add(quizId, quiz);
        }

        return idToQuizMap;
    }

    /// <summary>
    /// Load all questions into a single section
    /// </summary>
    static Dictionary<int, Quiz> loadQuiz(string filePath)
    {
        string json = System.IO.File.ReadAllText(filePath);
        JsonDocument jsonDoc = JsonDocument.Parse(json);
        int size = jsonDoc.RootElement.GetArrayLength();

        Dictionary<int, Quiz> idToQuizMap = [];
        for (int i = 0; i < size; i++) {
            JsonElement quizElement = jsonDoc.RootElement[i];
            int quizId = quizElement.GetProperty("id").GetInt32();
            
            // Ignore if we already have a quiz with this id. This could happen as when we generate the quiz
            // we just create random 6 digit integer.
            if (idToQuizMap.ContainsKey(quizId)) 
            {
                continue;
            }

            Quiz quiz = new(quizId);
            List<Question> questions = readQuestions(quizElement.GetProperty("questions"));
            quiz.AddSection("Questions", questions);
            idToQuizMap.Add(quizId, quiz);
        }

        return idToQuizMap;
    }

    static List<Question> readQuestions(JsonElement questionsElement)
    {
        int questionCount = questionsElement.GetArrayLength();
        List<Question> questionsList = new(questionCount);

        for (int i = 0; i < questionCount; i++) {
            JsonElement questionElement = questionsElement[i];
            string a = readFieldValue(questionElement[0]);
            string operation = readFieldValue(questionElement[1]);
            string b = readFieldValue(questionElement[2]);
            string answer = readFieldValue(questionElement[3]);
            questionsList.Add(new Question(a, operation, b, answer));
        }

        return questionsList;
    }

    static string readFieldValue(JsonElement jsonElement)
    {
        if (jsonElement.ValueKind == JsonValueKind.Number)
        {
            return jsonElement.GetInt32().ToString();
        }
        else
        {
           return jsonElement.GetString();
        }
    }
}
