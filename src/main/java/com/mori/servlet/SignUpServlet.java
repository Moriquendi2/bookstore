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
 * 用户注册控制器
 * @author Mori
 *
 */

@WebServlet("/userSignUp")
@SuppressWarnings("serial")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 接收参数
        UserInfo entity = new UserInfo();
        entity.setName(new String(req.getParameter("name").getBytes("ISO-8859-1"),"UTF-8"));
        entity.setPassword(new String(req.getParameter("password").getBytes("ISO-8859-1"),"UTF-8"));
        entity.setEmail(new String(req.getParameter("email").getBytes("ISO-8859-1"),"UTF-8"));
        entity.setAddress(new String(req.getParameter("address").getBytes("ISO-8859-1"),"UTF-8"));
        entity.setTelephone(new String(req.getParameter("telephone").getBytes("ISO-8859-1"),"UTF-8"));
        entity.setType(new String(req.getParameter("type").getBytes("ISO-8859-1"),"UTF-8"));

//        System.out.println(entity.getName());
//        System.out.println(entity.getPassword());
//        System.out.println(entity.getEmail());
//        System.out.println(entity.getAddress());
//        System.out.println(entity.getTelephone());
//        System.out.println(entity.getType());

        // 根据用户名查询用户
        UserInfoService userInfoService1 = new UserInfoServiceImpl();
        UserInfo query = userInfoService1.getUserInfoByName(entity.getName());
        // 有重名的
        if (query != null)
        {
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script type='text/javascript' charset='UTF-8'>alert('已经存在同名用户！');history.back();</script>");
        }
        else
        {
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script type='text/javascript' charset='UTF-8'>alert('注册成功！');history.back();</script>");

            UserInfoService userInfoService2 = new UserInfoServiceImpl();
            userInfoService2.saveUserInfo(entity);
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }


    }
}