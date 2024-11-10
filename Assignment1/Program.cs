namespace Assignment1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to the Laundrey");
            //int small = 25;
            //int large = 35;
            double rate = 0.06 ;
            Console.Write("Enter the Number of small : " );
            int number1 = int.Parse(Console.ReadLine());
            Console.Write("Enter the Number of large : ");
            int number2 = int.Parse(Console.ReadLine());
            double a = number1*25 + number2*35;
            double b = a * rate;
            double Cost = a + b;    
            Console.WriteLine("Price per small room : $25");
            Console.WriteLine("Price per large room : $35");
            Console.WriteLine($"Cost : ${number1*25 + number2*35}");
            Console.WriteLine("========================================");
            Console.WriteLine($"Total estimate : {Cost}");
            Console.WriteLine("This estimate is valid for 30 days");
        }
    }
}
