package com.mori.servlet;

import com.mori.entity.Find;
import com.mori.entity.QueryInfo;
import com.mori.entity.UserInfo;
import com.mori.service.UserInfoService;
import com.mori.service_impl.UserInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

/**
 * 用户操作控制器
 * @author Mori
 *
 */
@WebServlet("/user/*")
public class UserServlet extends BaseServlet{

    /**
     * 查询所有用户，以列表形式展示
     * @author Mori
     *
     */
    public void userInfoList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        UserInfoService userInfoService = new UserInfoServiceImpl();
        List<UserInfo> list = userInfoService.userInfoList();  // 返回值是list形式
        // System.out.println(list.size());
        request.setAttribute("userInfoList", list);
        request.getRequestDispatcher("/user_info_list.jsp").forward(request, response);
    }



    /**
     * 新增用户控制器
     * 1.跳转至/user_info_save.jsp
     * @author Mori
     *
     */
    public void userInfoSave_jump(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.getRequestDispatcher("/user_info_save.jsp").forward(request, response);
    }
    /**
     * 新增用户控制器
     * 2.提交更新后的信息
     * @author Mori
     *
     */
    public void userInfoSave_submit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        // 接收参数
        UserInfo entity = new UserInfo();
        entity.setName(new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8"));
        entity.setPassword(new String(request.getParameter("password").getBytes("ISO-8859-1"),"UTF-8"));
        entity.setEmail(new String(request.getParameter("email").getBytes("ISO-8859-1"),"UTF-8"));
        entity.setAddress(new String(request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8"));
        entity.setTelephone(new String(request.getParameter("telephone").getBytes("ISO-8859-1"),"UTF-8"));
        entity.setType(new String(request.getParameter("type").getBytes("ISO-8859-1"),"UTF-8"));

//        UserInfoService userInfoService = new UserInfoServiceImpl();
//        userInfoService.saveUserInfo(entity);
//        req.getRequestDispatcher("userInfoList").forward(req, resp);

        // 根据用户名查询用户
        UserInfoService userInfoService1 = new UserInfoServiceImpl();
        UserInfo query = userInfoService1.getUserInfoByName(entity.getName());
        // 有重名的
        if (query != null)
        {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script type='text/javascript' charset='UTF-8'>alert('已经存在同名用户！');history.back();</script>");
        }
        else
        {
            UserInfoService userInfoService2 = new UserInfoServiceImpl();
            userInfoService2.saveUserInfo(entity);
            //request.getRequestDispatcher("/user/userInfoList").forward(request, response);
            // 用重定向而不是请求转发
            response.sendRedirect("userInfoList");
        }

    }


    /**
     * 更新、编辑用户控制器
     * 1.跳转至/user_info_update.jsp
     * @author Mori
     */
    public void userInfoUpdate_jump(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        // 查询需要编辑的信息，id是由doGet方式得到的
        UserInfoService userInfoService = new UserInfoServiceImpl();
        UserInfo entity = userInfoService.getUserInfoById(Integer.parseInt(request.getParameter("id")));  // 转成int类型
        request.setAttribute("entity", entity);
        request.getRequestDispatcher("/user_info_update.jsp").forward(request, response);
    }
    public void userInfoUpdate_submit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        UserInfo entity = new UserInfo();
        entity.setId(Integer.parseInt(request.getParameter("id")));
        entity.setName(new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8"));
        entity.setPassword(new String(request.getParameter("password").getBytes("ISO-8859-1"),"UTF-8"));
        entity.setEmail(new String(request.getParameter("email").getBytes("ISO-8859-1"),"UTF-8"));
        entity.setAddress(new String(request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8"));
        entity.setTelephone(new String(request.getParameter("telephone").getBytes("ISO-8859-1"),"UTF-8"));
        UserInfoService userInfoService = new UserInfoServiceImpl();
        userInfoService.updateUserInfoById(entity);

        //request.getRequestDispatcher("userInfoList").forward(request, response);
        // 用重定向而不是请求转发
        response.sendRedirect("userInfoList");
    }



    /**
     * 删除用户控制器
     *
     * @author Mori
     */
    public void userInfoDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        // 根据id删除
        UserInfoService userInfoService = new UserInfoServiceImpl();
        userInfoService.deleteUserInfoById(Integer.parseInt(request.getParameter("id")));
        //request.getRequestDispatcher("/user_info_list.jsp").forward(request, response);
        response.sendRedirect("userInfoList");
    }

    /**
     * 分页查询和条件查询控制器
     *
     * @author Mori
     */
    public void selectByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        UserInfoService userInfoService = new UserInfoServiceImpl();
        int currentPage = Integer.parseInt(request.getParameter("currentPage"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        // 因为是doGet方式获取，所以不用先以ISO-8859-1解码，直接获取参数即可
        String username = new String(request.getParameter("username"));
        String type = new String(request.getParameter("type"));

//        System.out.println("servlet中");
//        System.out.println(currentPage);
//        System.out.println(pageSize);
//        System.out.println(username);
//        System.out.println(type);

        QueryInfo queryinfo = new QueryInfo();
        queryinfo.setCurrentPage(currentPage);
        queryinfo.setPageSize(pageSize);
        queryinfo.setUsername(username);
        queryinfo.setType(type);

        Find find = userInfoService.selectByPage(queryinfo);

//        System.out.println(find.getTotalCount());
//        List<UserInfo> test = find.getRows();
//        for (int i = 0; i < test.size(); i++) {
//            UserInfo temp = test.get(i);
//            System.out.println(temp.getId());
//        }

        request.setAttribute("Find", find);
        getServletContext().setAttribute("Queryinfo", queryinfo);
        request.getRequestDispatcher("/user_info_list.jsp").forward(request, response);
    }








}
