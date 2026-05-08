package subject;

import dao.SubjectDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class SubjectDeleteExecuteAction extends Action {

    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // ===== セッションチェック =====
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("teacher") == null) {
            response.sendRedirect("../auth/Login.action");
            return;
        }

        request.setCharacterEncoding("UTF-8");

        // ===== パラメータ取得 =====
        String cd = request.getParameter("cd");
        SubjectDAO dao = new SubjectDAO();
        
        if (dao.findByCd(cd) == null) {
        	request.setAttribute("errorMessage", "科目が存在していません");
        	
        	request.getRequestDispatcher("/subject/subject_delete.jsp")
        		.forward(request,response);
        	return;
        }
        
        // == 削除 ==
        dao.delete(cd);
        
        // == 削除完了画面 == 
        request.getRequestDispatcher("/subject/subject_delete_done.jsp")
        	.forward(request,response);
    }
}