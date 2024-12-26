using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_5
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Press 1 for Lab_5_1 : ");
            Console.WriteLine("Press 2 for Lab_5_2 : ");
            Console.WriteLine("Press 3 for Lab_5_3 : ");
            Console.WriteLine("Press 4 for Lab_5_4 : ");
            Console.WriteLine("Press 5 for Lab_5_5 : ");
            Console.WriteLine("Press 6 for Lab_5_6 : ");
            int choice = int.Parse(Console.ReadLine());

            switch (choice)
            {
                case 1:
                    Lab_5_1 l1 = new Lab_5_1();
                    l1.abc();
                    break;
                case 2:
                    Lab_5_2 l2 = new Lab_5_2();
                    l2.abc();
                    break;
                case 3:
                    Lab_5_3 l3 = new Lab_5_3();
                    l3.abc();
                    break;
                case 4:
                    Lab_5_4 l4 = new Lab_5_4();
                    l4.abc();
                    break;
                case 5:
                    Lab_5_5 l5 = new Lab_5_5();
                    l5.abc();
                    break;
                case 6:
                    Lab_5_6 l6 = new Lab_5_6();
                    l6.abc();
                    break;
            }
        }
    }
}


