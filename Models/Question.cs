namespace math_quiz_web_aspnet.Models;

public struct Question
{
    public Question(string a, string operation, string b, string answer)
    {
        A = a;
        Operation = operation;
        B = b;
        Answer = answer;
    }
    
    public string A { get; }
    public string B { get; }
    public string Operation { get; }
    public string Answer { get; }

    public override string ToString ()
    {
        return $"{A} {Operation} {B} = {Answer}";
    }
}
