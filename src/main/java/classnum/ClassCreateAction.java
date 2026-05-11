package classnum;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class ClassCreateAction extends Action {

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("teacher") == null) {
            res.sendRedirect("../auth/Login.action");
            return;
        }

        req.getRequestDispatcher("class_create.jsp")
           .forward(req, res);
    }
}