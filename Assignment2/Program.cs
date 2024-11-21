namespace Assignment2
{
    internal class Program
    {

        static void Main(string[] args)
        {
            List<int> list = new List<int>() { };
            string P = "Print numbers";
            string A = "Add a number";
            string M = "Display mean of the numbers";
            string S = "Display the smallest number";
            string L = "Display the largest number";
            string F = "Find a number";
            string C = "Clear";
            string Q = "Quit";
            char choice = ' ';
            do
            {
                Console.ForegroundColor = ConsoleColor.Green; //Stack overflow
                Console.WriteLine("---------------------------------------------");
                Console.WriteLine("Main Menu");
                Console.WriteLine($"P - {P}");
                Console.WriteLine($"A - {A}");
                Console.WriteLine($"M - {M}");
                Console.WriteLine($"S - {S}");
                Console.WriteLine($"L - {L}");
                Console.WriteLine($"F - {F}");
                Console.WriteLine($"C - {C}");
                Console.WriteLine($"Q - {Q}");
                Console.WriteLine("---------------------------------------------");
                Console.Write("Enter you Choice :==> ");
                choice = char.ToUpper(char.Parse(Console.ReadLine()));

                switch (choice)
                {
                    case 'P':
                        if (list.Count == 0)
                        {
                            Console.ForegroundColor = ConsoleColor.Red;
                            Console.WriteLine("[ ] - this list is empty");
                        }
                        else
                        {
                            //for (int i = 0; i < list.Count; i++)
                            //    Console.WriteLine(list[i]);
                            Console.ForegroundColor = ConsoleColor.White;
                            Console.WriteLine("[" + string.Join("  ", list) + "]");
                        } 
                        break;
                    case 'A':
                        Console.Write("Enter the number to add :==> ");
                            //list.Add(int.Parse(Console.ReadLine()));
                        int Added = int.Parse(Console.ReadLine());
                        if (list.Contains(Added))//Stack overflow
                        {
                            Console.ForegroundColor = ConsoleColor.DarkRed;
                            Console.WriteLine($"The number {Added} already exists in the list.");
                        }
                        else
                        {
                            list.Add(Added);
                            Console.ForegroundColor = ConsoleColor.White;
                            Console.WriteLine($"Output :==> {list[list.Count - 1]} added");
                        }
                        
                        break;
                    case 'M':
                        if (list.Count == 0)
                        {
                            Console.ForegroundColor = ConsoleColor.Red;
                            Console.WriteLine("Unable to calculate the mean - no data");
                        }
                        else
                        {
                            double sum = default;
                            foreach (int num in list)
                            {
                                sum += num;
                            }
                            double mean = sum / list.Count;
                            Console.ForegroundColor = ConsoleColor.White;
                            Console.WriteLine($"The mean is: {mean}");
                        }
                        break;
                    case 'S':
                        if (list.Count == 0)
                        {
                            Console.ForegroundColor = ConsoleColor.Red;
                            Console.WriteLine("Unable to determine the small number - list is empty");
                        }
                        else
                        {
                            int small = list[0];
                            foreach (int num in list)
                            {
                                if (num < small)
                                {
                                    small = num;
                                }
                            }
                            Console.ForegroundColor = ConsoleColor.White;
                            Console.WriteLine($"The small number is: {small}");
                        }
                        break;
                    case 'L':
                        if (list.Count == 0)
                        {
                            Console.ForegroundColor = ConsoleColor.Red;
                            Console.WriteLine("Unable to determine the large number - list is empty");
                        }
                        else
                        {
                            int larg = list[0];
                            foreach (int num in list)
                            {
                                if (num > larg)
                                {
                                    larg = num;
                                }
                            }
                            Console.ForegroundColor = ConsoleColor.White;
                            Console.WriteLine($"The larg number is: {larg}");
                        }
                        break;
                    case 'F':
                        if (list.Count == 0)
                        {
                            Console.ForegroundColor = ConsoleColor.Red;
                            Console.WriteLine("[] - this list is empty");
                        }
                        else
                        {
                            Console.Write("Enter the number to search :==>");
                            int target = int.Parse(Console.ReadLine());
                            int index = -1;
                            for (int i = 0; i < list.Count; i++)
                            {
                                if (list[i] == target)
                                {
                                    index = i;
                                    break;
                                }
                            }
                            if (index != -1)
                            {
                                Console.ForegroundColor = ConsoleColor.White;
                                Console.WriteLine($"The number {target} is found at index {index}.");
                            }
                            else
                            {
                                Console.ForegroundColor = ConsoleColor.Red;
                                Console.WriteLine($"The number {target} is not found in the list.");
                            }
                        }
                        break;
                    case 'C':
                        if (list.Count != 0)
                        {
                            list.Clear();
                            Console.ForegroundColor = ConsoleColor.White;
                            Console.WriteLine("[ ] - Done List is Empty");
                        }
                        else
                        {
                            Console.ForegroundColor = ConsoleColor.Red;
                            Console.WriteLine("[ ] - This List is Empty");
                        }
                        break;
                    case 'Q':
                        Console.ForegroundColor = ConsoleColor.Blue;
                        Console.WriteLine("GoodBay.......");
                        break;
                    default:
                        Console.ForegroundColor = ConsoleColor.DarkRed;
                        Console.WriteLine("Unknown selection, please try again");
                        break;
                }
            }
            while (choice != 'Q');
            
            
        }
    }
}