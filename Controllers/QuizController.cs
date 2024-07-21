using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using math_quiz_web_aspnet.Models;

namespace math_quiz_web_aspnet.Controllers;

public class QuizController : Controller
{
    private readonly ILogger<QuizController> _logger;
    private readonly Random random = new();

    public QuizController(ILogger<QuizController> logger)
    {
        _logger = logger;
    }

    private static string[] emojis = [
        "😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "🥲", "🥹", "☺️", "😊", "😇", "🙂", "🙃", "😉",
        "😌", "😍", "🥰", "😘", "😗"
    ];

    public static string GenerateEmojis() {
        int remainingCount = 4;
        int remainingPool = emojis.Length;
        List<string> selected = [];
        Random random = new Random();
        foreach (string e in emojis) {
            float probability = ((float)remainingCount) / remainingPool;
            if (random.NextDouble() < probability) {
                selected.Add(e);
                remainingCount--;
            }
            if (remainingCount == 0) {
                break;
            }
            remainingPool--;
        }

        return String.Join(" • ", selected);
    }

    public IActionResult Show(string quizType, int id, [FromQuery(Name = "a")] string? showAnswer)
    {
        QuizType quizTypeEnum = (QuizType) Enum.Parse(typeof(QuizType), quizType, true);
        if (showAnswer != null)
        {
            ViewData["showAnswer"] = "true";             
        }
        return View(QuizService.QuizMap[quizTypeEnum][id]);
    }

    public IActionResult Random(string quizType)
    {
        QuizType quizTypeEnum = (QuizType) Enum.Parse(typeof(QuizType), quizType, true);
        Dictionary<int, Quiz> idToQuizMap = QuizService.QuizMap[quizTypeEnum];
        int idIndex = random.Next(idToQuizMap.Keys.Count);
        int i = 0;
        foreach (int quizId in idToQuizMap.Keys) 
        {
            if (i == idIndex) {
                return RedirectToAction("Show", new { quizType = quizTypeEnum, id = quizId });                
            }

            i++;
        }

        return Problem("Failed to generate random quiz");
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
