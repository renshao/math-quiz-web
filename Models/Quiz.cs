namespace math_quiz_web_aspnet.Models;

public class Quiz
{
    public Quiz(int id)
    {
        Id = id;
        Sections = [];
    }

    public int Id { get; }

    public List<Section> Sections { get; set; }

    public void AddSection(string title, List<Question> questions)
    {
        Sections.Add(new Section(title, questions));
    }
}
