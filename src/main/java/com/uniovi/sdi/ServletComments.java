package com.uniovi.sdi;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletComments", value = "/comment")
public class ServletComments extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CommentService cs = new CommentService();
        List<Comment> comments = cs.getComments();
        for (Comment c :
                comments) {
            System.out.println(c.getComment());
        }
        request.setAttribute("theComments", comments);
        getServletContext()
                .getRequestDispatcher("/comment.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}