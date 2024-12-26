﻿public class Lab_5_4
{
    public void abc()
    {

        Queue<int> queue = new Queue<int>();

        // Enqueue items
        queue.Enqueue(10);
        queue.Enqueue(20);
        Console.WriteLine("After Enqueuing: " + string.Join(", ", queue));

        // Dequeue item
        Console.WriteLine("Dequeued: " + queue.Dequeue());

        // Peek item
        Console.WriteLine("Peek: " + queue.Peek());

        // Check contains
        Console.WriteLine("Contains 20: " + queue.Contains(20));

        // Clear items
        queue.Clear();
        Console.WriteLine("After Clearing: Count = " + queue.Count);
    }
}