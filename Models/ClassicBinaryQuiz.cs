namespace math_quiz_web_aspnet.Models;

public class ClassicBinaryQuiz : Quiz
{
    public ClassicBinaryQuiz(int id) : base(id)
    {
        
    }

    public List<Question> timesDivisionQuestions { get; set; }
    public List<Question> plusMinusQuestions { get; set; }
    public List<Question> binaryQuestions { get; set; }
    public List<Question> hexQuestions { get; set; }
}