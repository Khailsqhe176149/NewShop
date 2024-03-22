/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.PostController;

import DBContext.BlogDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.nio.file.Files;
import java.nio.file.Path;
import Model.Blog;

/**
 *
 * @author pc
 */
public class PostEditController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("id"));
        BlogDBContext db = new BlogDBContext();
        Blog b = db.getAllBlogDetail(postId);
        request.setAttribute("post", b);
        request.setAttribute("postId", postId);
        request.getRequestDispatcher("editPost.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("postId"));
            String title = request.getParameter("title");
            String shortDescription = request.getParameter("shortDescription");
            String content = request.getParameter("content");
            String image = request.getParameter("image");
            Blog b = new Blog();
            b.setTitle(title);
            b.setShortDescription(shortDescription);
            b.setContent(content);
            b.setImageUrl(image);
            BlogDBContext db = new BlogDBContext();
            db.editPost(b, id);
            // Sau khi tạo bài đăng thành công
            response.sendRedirect("editPost.jsp?success=true");
        } catch (Exception e) {

        }

    }

}
