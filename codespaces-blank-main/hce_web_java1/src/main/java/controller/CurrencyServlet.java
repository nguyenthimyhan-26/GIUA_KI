
package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/currency")
public class CurrencyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        double vnd = Double.parseDouble(request.getParameter("vnd"));

        // Tỷ giá mẫu
        double rate = 26000;

        double usd = vnd / rate;

        request.setAttribute("usd", usd);
        request.setAttribute("vnd", vnd);

        request.getRequestDispatcher("doitien.jsp")
               .forward(request, response);
    }
}