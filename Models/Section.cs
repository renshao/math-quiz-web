namespace math_quiz_web_aspnet.Models;

public class Section
{
    public string Title { get; set; }
    public List<Question> Questions { get; set; }

    public Section(string title, List<Question> questions)
    {
        Title = title;
        Questions = questions;
    }

    public void AddQuestion(string a, string operation, string b, string answer)
    {
        Question q = new Question(a, operation, b, answer);
        Questions.Add(q);
    }
}
