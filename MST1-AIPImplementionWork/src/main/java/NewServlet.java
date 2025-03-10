import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LibraryServlet")  // Maps the servlet to /LibraryServlet
public class NewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static List<Book> bookList = new ArrayList<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentUid = request.getParameter("studentUid");
        String studentName = request.getParameter("studentName");
        String bookNumber = request.getParameter("bookNumber");
        String bookName = request.getParameter("bookName");
        String issueDate = request.getParameter("issueDate");
        String action = request.getParameter("action");

        if ("Add Book".equals(action)) {
            bookList.add(new Book(studentUid, studentName, bookNumber, bookName, issueDate));
        } else if ("Update Book".equals(action)) {
            for (Book book : bookList) {
                if (book.getBookNumber().equals(bookNumber)) {
                    book.setStudentUid(studentUid);
                    book.setStudentName(studentName);
                    book.setBookName(bookName);
                    book.setIssueDate(issueDate);
                    break;
                }
            }
        }

        response.sendRedirect("index.html");
    }

    @Override
    protected void doGet (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("view".equals(action)) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Issued Books</title></head><body>");
            out.println("<h2>Issued Books</h2>");
            out.println("<table border='1'><tr><th>Student UID</th><th>Student Name</th><th>Book Number</th><th>Book Name</th><th>Date of Issue</th></tr>");

            for (Book book : bookList) {
                out.println("<tr><td>" + book.getStudentUid() + "</td><td>" + book.getStudentName() +
                        "</td><td>" + book.getBookNumber() + "</td><td>" + book.getBookName() + 
                        "</td><td>" + book.getIssueDate() + "</td></tr>");
            }

            out.println("</table>");
            out.println("<br><a href='index.html'>Back to Home</a>");
            out.println("</body></html>");
        }
    }
}

// Book class to store book details
class Book {
    private String studentUid, studentName, bookNumber, bookName, issueDate;

    public Book(String studentUid, String studentName, String bookNumber, String bookName, String issueDate) {
        this.studentUid = studentUid;
        this.studentName = studentName;
        this.bookNumber = bookNumber;
        this.bookName = bookName;
        this.issueDate = issueDate;
    }

    public String getStudentUid() { return studentUid; }
    public void setStudentUid(String studentUid) { this.studentUid = studentUid; }

    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }

    public String getBookNumber() { return bookNumber; }
    public void setBookNumber(String bookNumber) { this.bookNumber = bookNumber; }

    public String getBookName() { return bookName; }
    public void setBookName(String bookName) { this.bookName = bookName; }

    public String getIssueDate() { return issueDate; }
    public void setIssueDate(String issueDate) { this.issueDate = issueDate; }
}
