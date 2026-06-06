package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/convert")
public class ConvertServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            double usd = Double.parseDouble(
                    request.getParameter("usd"));

            double rate = 26000;

            double vnd = usd * rate;

            request.setAttribute("usd", usd);
            request.setAttribute("vnd", vnd);

        } catch (Exception e) {

            request.setAttribute(
                    "error",
                    "Vui lòng nhập số hợp lệ!"
            );
        }

        request.getRequestDispatcher(
                "doitiente.jsp")
                .forward(request, response);
    }
}