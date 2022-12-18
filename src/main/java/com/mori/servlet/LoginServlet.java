package com.mori.servlet;

import com.mori.entity.UserInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.mori.entity.UserInfo;
import com.mori.service.UserInfoService;
import com.mori.service_impl.UserInfoServiceImpl;

/**
 * 用户登录控制器
 * @author Mori
 *
 */

@WebServlet("/userLogin")
@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 接收用户名和密码
        String username = new String(req.getParameter("username").getBytes("ISO-8859-1"),"UTF-8");
        String password = new String(req.getParameter("password").getBytes("ISO-8859-1"),"UTF-8");
//        System.out.println(username);
//        System.out.println(password);
        // 根据用户名查询用户
        UserInfoService userInfoService = new UserInfoServiceImpl();
        UserInfo entity = userInfoService.getUserInfoByName(username);
        if (entity == null) {
            //System.out.println("this is null");
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script type='text/javascript' charset='UTF-8'>alert('没有找到该用户！');history.back();</script>");
            //req.setAttribute("entity", null);
        }
        else {
            //if (password.equals(entity.getPassword()) && entity.getType().equals("管理员"))
            if (password.equals(entity.getPassword()))
            {
                String path = req.getContextPath();
                //req.setAttribute("entity", entity);
                //将数据存储到ServletContext中
                getServletContext().setAttribute("current_user", entity);
                req.getRequestDispatcher("/user_index.jsp").forward(req, resp);
                //req.getRequestDispatcher("userInfoList");
            }
//            else if (password.equals(entity.getPassword()) && entity.getType().equals("商家"))
//            {
//                getServletContext().setAttribute("current_user", entity);
//                //req.getRequestDispatcher("/user_index.jsp").forward(req, resp);
//            }
//            else if (password.equals(entity.getPassword()) && entity.getType().equals("用户"))
//            {
//                getServletContext().setAttribute("current_user", entity);
//                //req.getRequestDispatcher("/user_index.jsp").forward(req, resp);
//            }
            else
            {
                resp.setContentType("text/html;charset=UTF-8");
                PrintWriter out = resp.getWriter();
                out.println("<script type='text/javascript' charset='UTF-8'>alert('密码错误,请重新输入！');history.back();</script>");
                // req.setAttribute("entity", null);
            }
        }



    }
}