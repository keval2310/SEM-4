
public class Lab_5_5
{
    public void abc()
    {

        Dictionary<int, string> students = new Dictionary<int, string>();

        // Add key-value pairs
        students.Add(1, "John");
        students.Add(2, "Alice");
        Console.WriteLine("After Adding: " + string.Join(", ", students.Select(kv => kv.Key + "=" + kv.Value)));

        // Remove a key-value pair
        students.Remove(1);
        Console.WriteLine("After Removing: " + string.Join(", ", students.Select(kv => kv.Key + "=" + kv.Value)));

        // Check key and value existence
        Console.WriteLine("Contains Key 2: " + students.ContainsKey(2));
        Console.WriteLine("Contains Value 'Alice': " + students.ContainsValue("Alice"));

        // Clear dictionary
        students.Clear();
        Console.WriteLine("After Clearing: Count = " + students.Count);
    }
}