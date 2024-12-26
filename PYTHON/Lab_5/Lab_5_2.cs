using System.Collections.Generic;

public class Lab_5_2
{
    public void abc()
    {


        List<string> studentNames = new List<string>();

        // Add students
        studentNames.Add("John");
        studentNames.Add("Alice");
        Console.WriteLine("After Adding: " + string.Join(", ", studentNames));

        // Remove a student by index
        studentNames.RemoveAt(1);
        Console.WriteLine("After Removing: " + string.Join(", ", studentNames));

        // Remove range
        studentNames.AddRange(new List<string> { "Alice", "Bob", "Charlie" });
        studentNames.RemoveRange(0, 2);
        Console.WriteLine("After Removing Range: " + string.Join(", ", studentNames));

        // Clear all students
        studentNames.Clear();
        Console.WriteLine("After Clearing: Count = " + studentNames.Count);
    }
}