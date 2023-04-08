package severlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.BookDAO;
import models.Book;

/**
 * Servlet implementation class AddBook
 */
@WebServlet("/add-book")
public class AddBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		int id = 0;
		if(idStr == null || idStr.trim().isEmpty()) {
			id = new Random().nextInt(Integer.MAX_VALUE);
		}else {
			id = Integer.parseInt(idStr);
		}
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String date = request.getParameter("date");
		String genres = request.getParameter("genres");
		String characters = request.getParameter("characters");
		String synopsis = request.getParameter("synopsis");
		
		Book book = new Book(id, title, author, date, genres, characters, synopsis);
		BookDAO dao = new BookDAO();
		boolean bookAdded = false;
		
		try {
			dao.insertBook(book);
			bookAdded = true;
			request.setAttribute("bookAdded", bookAdded);
			request.setAttribute("books", dao.getAllBooks(0, 100));
			request.setAttribute("dbook", dao.getBook(id));
			request.getRequestDispatcher("./html/book-view.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
