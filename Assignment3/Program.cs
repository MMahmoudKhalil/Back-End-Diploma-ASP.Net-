namespace Assignment3
{
    class Book
    {
        public string Title { get; set; }
        public string Author { get; set; }
        public string ISBN { get; set; }
        public bool Availability { get; set; }

        public Book(string title, string author, string isbn)
        {
            Title = title;
            Author = author;
            ISBN = isbn;
            Availability = true;
        }
    }

    class Library
    {
        private List<Book> books = new List<Book>();

        // Add a new book
        public void AddBook(Book book)
        {
            Console.ForegroundColor = ConsoleColor.Cyan;
            books.Add(book);
            Console.WriteLine($"Book ['{book.Title},{book.Author},{book.ISBN}'] added to the library.");
            Console.ForegroundColor = ConsoleColor.Gray;
        }

        // Search a book by title or author
        public Book SearchBook(string text)
        {
            foreach (Book book in books)
            {
                if (book.Title.Contains(text) || book.Author.Contains(text))
                {
                    return book;
                }
            }
            return null;
        }

        // Borrow a book
        public void BorrowBook(string title)
        {
            Book book = SearchBook(title);
            if (book == null)
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine($"The book '{title}' is not available in the library.");
                Console.ForegroundColor = ConsoleColor.Gray;
            }
            else if (!book.Availability)
            {
                Console.ForegroundColor = ConsoleColor.DarkBlue;
                Console.WriteLine($"The book '{book.Title}' is currently borrowed.");
                Console.ForegroundColor = ConsoleColor.Gray;
            }
            else
            {
                book.Availability = false;
                Console.WriteLine($"You have borrowed the book '{book.Title}'.");
            }
        }

        // Return a book
        public void ReturnBook(string title)
        {
            Book book = SearchBook(title);
            if (book == null)
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine($"The book '{title}' is not in the library.");
                Console.ForegroundColor = ConsoleColor.Gray;
            }
            else if (book.Availability)
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine($"The book '{book.Title}' was not borrowed.");
                Console.ForegroundColor = ConsoleColor.Gray;
            }
            else
            {
                book.Availability = true;
                Console.ForegroundColor = ConsoleColor.Gray;
                Console.WriteLine($"You have returned the book '{book.Title}'.");
            }
        }
    }

    internal class Program
    {
        static void Main(string[] args)
        {
            Library library = new Library();

            library.AddBook(new Book("The Great Gatsby", "F. Scott Fitzgerald", "9780743273565"));
            library.AddBook(new Book("To Kill a Mockingbird", "Harper Lee", "9780061120084"));
            library.AddBook(new Book("1984", "George Orwell", "9780451524935"));
            library.AddBook(new Book("Clean Code: A Handbook of Agile Software Craftsmanship", "Robert C. Martin", "9780132350884"));
            library.AddBook(new Book("The Pragmatic Programmer: Your Journey to Mastery", "Andrew Hunt, David Thomas", "9780201616224"));
            library.AddBook(new Book("Python Crash Course:A Hands-On,Project-Based Introduction to Programming","Eric Matthes","9781593279288"));
            library.AddBook(new Book("You Don't Know JS: Scope & Closures", "Kyle Simpson", "9781449335588"));
            library.AddBook(new Book("JavaScript: The Good Parts", "Douglas Crockford", "9780596517748"));
            Console.ForegroundColor = ConsoleColor.DarkGreen;
            Console.WriteLine("=========================================================================");
            Console.ForegroundColor = ConsoleColor.Gray;
            Console.WriteLine("Searching and borrowing books...");
            library.BorrowBook("Gatsby");
            library.BorrowBook("1984");
            library.BorrowBook("C#"); // This book is not in library
            library.BorrowBook("Flutter"); // This book is not in library
            library.BorrowBook("Robert C. Martin");
            library.BorrowBook("Code Complete"); // This book is not in library
            Console.ForegroundColor = ConsoleColor.DarkGreen;
            Console.WriteLine("=========================================================================");
            Console.ForegroundColor = ConsoleColor.Gray;
            Console.WriteLine("Returning books...");
            library.ReturnBook("Gatsby");
            library.ReturnBook("Harry Potter"); // This book is not borrowed
            library.ReturnBook("Robert C. Martin");
            library.ReturnBook("Python Crash Course"); // This book is not borrowed
            Console.ForegroundColor = ConsoleColor.DarkYellow;



        }
    }
}
