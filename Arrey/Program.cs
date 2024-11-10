namespace Arrey
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int[] myArr = { 0, 0, 0, 0, 0 };
            myArr[0] = 100;
            myArr[^1] = 1000;
            
            Console.WriteLine(myArr[0]);
            Console.WriteLine(myArr[^1]);
            Console.WriteLine(myArr[2]);
        }
    }
}
