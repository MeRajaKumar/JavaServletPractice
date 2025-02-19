import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/NewServlet1"})
public class NewServlet1 extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Corrected: Use 'request' instead of 'req'
        int i = Integer.parseInt(request.getParameter("firstnum"));
        int j = Integer.parseInt(request.getParameter("secondnum"));
        
        int sum = i + j;

        // Storing the sum in the request scope
        request.setAttribute("sum", sum);

        // Forwarding request to Servlet2
        RequestDispatcher dispatcher = request.getRequestDispatcher("NewServlet2");
        dispatcher.forward(request, response);
    }
}
