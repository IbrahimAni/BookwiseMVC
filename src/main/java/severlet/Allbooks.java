package severlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.*;

/**
 * Servlet implementation class Allbooks
 */
@WebServlet("/allbooks")
public class Allbooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Allbooks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDAO dao = new BookDAO();
		
		try {
			int totalBooks = dao.getTotalBooks();
			int pageSize = 100;
			int totalPages = (int) Math.ceil((double) totalBooks/pageSize);
			String currentPage = request.getParameter("page");
			int offset = (1 - 1) * pageSize;
			
			if(currentPage != null && !currentPage.isEmpty()) {
				
				request.setAttribute("currentPage", Integer.parseInt(currentPage));
			}else {
				request.setAttribute("currentPage", 1);
			}
			request.setAttribute("books", dao.getAllBooks(offset, pageSize));
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("totalBooks", totalBooks);
			request.getRequestDispatcher("./html/all-books.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
