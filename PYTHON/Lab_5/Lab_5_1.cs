using System.Collections;

public class Lab_5_1
{
    public void abc()
    {
        ArrayList studentNames = new ArrayList();

        // Add students
        studentNames.Add("John");
        studentNames.Add("Alice");
        Console.WriteLine("After Adding: " + string.Join(", ", studentNames.ToArray()));

        // Remove a student by index
        studentNames.RemoveAt(1);
        Console.WriteLine("After Removing: " + string.Join(", ", studentNames.ToArray()));

        // Remove range
        studentNames.AddRange(new string[] { "Alice", "Bob", "Charlie" });
        studentNames.RemoveRange(0, 2);
        Console.WriteLine("After Removing Range: " + string.Join(", ", studentNames.ToArray()));

        // Clear all students
        studentNames.Clear();
        Console.WriteLine("After Clearing: Count = " + studentNames.Count);
    }
}