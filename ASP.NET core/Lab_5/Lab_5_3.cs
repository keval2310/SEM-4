public class Lab_5_3
{
    public void abc()
    {
        Stack<int> stack = new Stack<int>();

        // Push items
        stack.Push(10);
        stack.Push(20);
        Console.WriteLine("After Pushing: " + string.Join(", ", stack));

        // Pop item
        Console.WriteLine("Popped: " + stack.Pop());

        // Peek item
        Console.WriteLine("Peek: " + stack.Peek());

        // Check contains
        Console.WriteLine("Contains 20: " + stack.Contains(20));

        // Clear items
        stack.Clear();
        Console.WriteLine("After Clearing: Count = " + stack.Count);
    }
}