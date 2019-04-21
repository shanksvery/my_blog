package controllers.reports;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class ReportsUploadServlet
 */
@WebServlet("/report/upload")
@MultipartConfig(location="/tmp",maxFileSize=1048576)
public class ReportsUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportsUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    Part part = request.getPart("file");
        //part(主にjsp)から送られてきたファイル名を取得
        String name = this.getFileName(part);

        part.write(getServletContext().getRealPath("/WEB-INF/lib/upload")+ "/" + name);
        response.sendRedirect("jsp/upload.jsp");
    }
      private String getFileName(Part part){
          String name = null;
          for(String dispotion : part.getHeader("Content-Disposition").split(";")){
              if(dispotion.trim().startsWith("filename")){
                  name = dispotion.substring(dispotion.indexOf("=") + 1).replace("\"","").trim();
                  name = name.substring(name.lastIndexOf("\\") + 1 );
                  break;
              }
          }
          return name;
    }

}
