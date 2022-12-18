package com.mori.servlet;

import com.mori.entity.*;
import com.mori.service.GoodsInfoService;
import com.mori.service.UserInfoService;
import com.mori.service_impl.GoodsInfoServiceImpl;
import com.mori.service_impl.UserInfoServiceImpl;
import com.mori.utils.MysqlUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

/**
 * 商品操作控制器
 * @author Mori
 *
 */
@WebServlet("/goods/*")
public class GoodsServlet extends BaseServlet{

    /**
     * 查询所有商品，以列表形式展示；
     * @author Mori
     * 分页查询和条件查询控制器
     */
    public void selectByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GoodsInfoService goodsInfoService = new GoodsInfoServiceImpl();
        int currentPage = Integer.parseInt(request.getParameter("currentPage"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        // 因为是doGet方式获取，所以不用先以ISO-8859-1解码，直接获取参数即可
        String goodsname = request.getParameter("goodsname");
        String type = request.getParameter("type");

//        System.out.println("servlet中");
//        System.out.println(currentPage);
//        System.out.println(pageSize);
//        System.out.println(goodsname);
//        System.out.println(type);

        QueryInfo queryinfo = new QueryInfo();
        queryinfo.setCurrentPage(currentPage);
        queryinfo.setPageSize(pageSize);
        queryinfo.setUsername(goodsname);
        queryinfo.setType(type);

        Find find = goodsInfoService.selectByPage(queryinfo);

//        System.out.println(find.getTotalCount());
//        List<UserInfo> test = find.getRows();
//        for (int i = 0; i < test.size(); i++) {
//            UserInfo temp = test.get(i);
//            System.out.println(temp.getId());
//        }

        request.setAttribute("Find1", find);
        getServletContext().setAttribute("Queryinfo1", queryinfo);
        request.getRequestDispatcher("/goods_info_list.jsp").forward(request, response);
    }

    /**
     * 加入商品到购物车
     * @author Mori
     *
     */
    public void addCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GoodsInfoService goodsInfoService = new GoodsInfoServiceImpl();
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        int goods_id = Integer.parseInt(request.getParameter("goods_id"));
        int num = Integer.parseInt(request.getParameter("num"));

        goodsInfoService.addCart(user_id, goods_id, num);
        //response.sendRedirect("selectByPage?currentPage=1&pageSize=6&goodsname=0&type=0");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script type='text/javascript' charset='UTF-8'>alert('已成功加入购物车！');history.back();</script>");
    }

    /**
     * 显示购物车
     * @author Mori
     *
     */
    public void order_list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GoodsInfoService goodsInfoService = new GoodsInfoServiceImpl();
        int user_id = Integer.parseInt(request.getParameter("user_id"));

        List<Order> list = goodsInfoService.orderInfoList(user_id);  // 返回值是list形式
//        for (Iterator<Order> it = list.iterator(); it.hasNext();) {
//            System.out.println(it.next().getTotal_price());
//        }
        double unpay = goodsInfoService.calculateUnpay(user_id);
        request.setAttribute("Unpay", unpay);
        request.setAttribute("Order", list);
        request.getRequestDispatcher("/order_info_list.jsp").forward(request, response);
    }

    /**
     * 从购物车删除订单
     * @author Mori
     *
     */
    public void orderInfoDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GoodsInfoService goodsInfoService = new GoodsInfoServiceImpl();
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        int goods_id = Integer.parseInt(request.getParameter("goods_id"));

        goodsInfoService.orderInfoDelete(user_id, goods_id);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script type='text/javascript' charset='UTF-8'>alert('已成功删除！记得刷新一下购物车！');history.back();</script>");
        //request.getRequestDispatcher("/order_list&user_id" + user_id).forward(request, response);
    }

    /**
     * 结算订单
     * @author Mori
     *
     */
    public void orderSettlement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GoodsInfoService goodsInfoService = new GoodsInfoServiceImpl();
        int user_id = Integer.parseInt(request.getParameter("user_id"));

        goodsInfoService.orderSettlement(user_id);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script type='text/javascript' charset='UTF-8'>alert('已成功结算订单！记得刷新一下购物车！');history.back();</script>");
    }

    /**
     * 商户的——查询所有自家店铺的商品，并以列表形式展示；
     * @author Mori
     * 分页查询和条件查询控制器
     */
    public void selectByPage_shop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GoodsInfoService goodsInfoService = new GoodsInfoServiceImpl();
        int currentPage = Integer.parseInt(request.getParameter("currentPage"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        // 因为是doGet方式获取，所以不用先以ISO-8859-1解码，直接获取参数即可
        String goodsname = request.getParameter("goodsname");
        String type = request.getParameter("type");
        int shop_id = Integer.parseInt(request.getParameter("shop_id"));

        QueryInfo queryinfo = new QueryInfo();
        queryinfo.setCurrentPage(currentPage);
        queryinfo.setPageSize(pageSize);
        queryinfo.setUsername(goodsname);
        queryinfo.setType(type);

        Find find = goodsInfoService.selectByPage_shop(queryinfo, shop_id);

        request.setAttribute("Find1", find);
        request.setAttribute("Shop_id", shop_id);
        getServletContext().setAttribute("Queryinfo1", queryinfo);
        request.getRequestDispatcher("/manager_goods_info_list.jsp").forward(request, response);
    }

    /**
     * 添加商品控制器，跳转
     * @author Mori
     *
     */
    public void goodsInfoSave_jump(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int shop_id = Integer.parseInt(request.getParameter("shop_id"));
        request.setAttribute("shop_id", shop_id);
        request.getRequestDispatcher("/manager_goods_info_add.jsp").forward(request, response);
    }
    /**
     * 新增商品控制器
     * 提交信息
     * @author Mori
     *
     */
    public void goodsInfoSave_submit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int shop_id = Integer.parseInt(request.getParameter("shop_id"));

        GoodsInfo entity = new GoodsInfo();
//        entity.setName(new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8"));
//        entity.setDescription(new String(request.getParameter("description").getBytes("ISO-8859-1"),"UTF-8"));
//        entity.setPrice(Double.parseDouble(request.getParameter("price")));
//        entity.setAuthor(new String(request.getParameter("author").getBytes("ISO-8859-1"),"UTF-8"));
//        entity.setScore(Double.parseDouble(request.getParameter("score")));
//        entity.setType(new String(request.getParameter("type").getBytes("ISO-8859-1"),"UTF-8"));


        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("utf-8");

        String project_path = System.getProperty("user.dir");   // 注意，路径应为文件在工程中的相对路径

        // 表单
        String myFile = project_path + "/src/main/webapp/static/images";
        // 核心Api
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload fileUpload = new ServletFileUpload(factory);
        // 判断是否是muitipart/form-data类型
        if(!ServletFileUpload.isMultipartContent(request)) {
            //resp.getWriter().println("表单的enctype属性不是multipart/form-data类型");
            System.out.println("表单的enctype属性不是multipart/form-data类型");
            return;
        }
        // 设置单个文件上传大小 8M
        fileUpload.setFileSizeMax(8*1024*1024);
        // 设置总上传文件大小(有时候一次性上传多个文件，需要有一个上限, 此处为60M)
        fileUpload.setSizeMax(60*1024*1024);
        // 设置上传监听器[参数为自定义的监听器]
        // fileUpload.setProgressListener(new ListenerUploadProgress());
        // 解析请求
        try {
            List<FileItem> parseRequest = fileUpload.parseRequest(request);
            //System.out.println(parseRequest);
            // 获取数据
            for (FileItem fileItem : parseRequest) {
                // 判断数据类型是不是普通的form表单字段
                if(!fileItem.isFormField()) {
                    // 上传文件
                    String fileName = fileItem.getName();
                    InputStream fileStream = fileItem.getInputStream();
                    // 定义保存的父路径（服务器部署相对的绝对路径）
                    String parentDir = this.getServletContext().getRealPath("/static/images");  // 保存到了tomcat下的编译后的项目文件中
                    //String parentDir = System.getProperty("user.dir") + "/src/main/webapp/static/images";
                    // 使用UUID+文件名的方式，避免文件重名
                    String realFileName = UUID.randomUUID().toString()+"-"+fileName;

                    // 创建要保存的文件
                    File file = new File(parentDir, realFileName);
                    // 判断文件夹是否存在
                    if(!file.getParentFile().exists()) {
                        // 创建文件夹[多级文件夹]file.madir是创建单一文件夹
                        file.getParentFile().mkdirs();
                    }
                    // 创建输出流
                    OutputStream out = new FileOutputStream(file);
                    // 创建字节缓存
                    byte[] buffer = new byte[1024];
                    int len = -1;
                    // 一次读取1kb(1024byte),返回-1表明读取完毕
                    while((len = fileStream.read(buffer))!=-1) {
                        // 一次写入1kb(1024byte)
                        out.write(buffer,0, len);
                    }
                    //System.out.println(parentDir);  // D:/Tomcat/apache-tomcat-8.5.83/webapps/Mail_war/upload
                    //System.out.println(realFileName);  // 53e1d257-4164-4235-b03e-71bb73ddf6f0-dog.png 即文件名

                    myFile = realFileName;
                    // 冲刷流资源
                    out.flush();
                    // 关闭流
                    out.close();
                    fileStream.close();

                    // 没有上传文件的情况下，要删除该文件
                    if (!realFileName.contains(".")) {
                        file.delete();
                    }
                }else {
                    //普通字段与字段名
                    String fieldName = fileItem.getFieldName();
                    if(fieldName.equals("name")) {
                        entity.setName(fileItem.getString("UTF-8"));   // 防止字段值中文乱码
                    }
                    if(fieldName.equals("description")) {
                        entity.setDescription(fileItem.getString("UTF-8"));   // 防止字段值中文乱码
                    }
                    if(fieldName.equals("price")) {
                        entity.setPrice(Double.parseDouble(fileItem.getString("UTF-8")));   // 防止字段值中文乱码
                    }
                    if(fieldName.equals("score")) {
                        entity.setScore(Double.parseDouble(fileItem.getString("UTF-8")));   // 防止字段值中文乱码
                    }
                    if(fieldName.equals("author")) {
                        entity.setAuthor(fileItem.getString("UTF-8"));   // 防止字段值中文乱码
                    }
                    if(fieldName.equals("type")) {
                        entity.setType(fileItem.getString("UTF-8"));   // 防止字段值中文乱码
                    }

                    //String fieldValue = fileItem.getString("UTF-8");
                    //System.out.println(fieldName+":"+fieldValue);
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        response.getWriter().print(myFile);
//        if(!myFile.substring(myFile.length()-4).equals(".")) {
        if(myFile.contains(".")) {
            entity.setImage_path(myFile);
        }
        else {
            entity.setImage_path("default.png");
        }
        //将商品信息存储到数据库
//        System.out.println(entity.getName());
//        System.out.println(entity.getDescription());
//        System.out.println(entity.getPrice());
//        System.out.println(entity.getAuthor());
//        System.out.println(entity.getScore());
//        System.out.println(entity.getType());
//        System.out.println(entity.getImage_path());
//        System.out.println(entity.getImage_path().isEmpty());

        GoodsInfoService goodsInfoService = new GoodsInfoServiceImpl();
        goodsInfoService.goodsInfoSave(entity, shop_id);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script type='text/javascript' charset='UTF-8'>alert('已成功添加商品！');history.back();</script>");
    }

    /**
     * 删除商品控制器
     *
     * @author Mori
     */
    public void goodsInfoDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        // 根据goods_id和shop_id删除
        GoodsInfoService goodsInfoService = new GoodsInfoServiceImpl();
        int shop_id = Integer.parseInt(request.getParameter("shop_id"));
        int goods_id = Integer.parseInt(request.getParameter("goods_id"));
        String image_path = request.getParameter("image_path");

        // 删除商品的图片
        // 创建要保存的文件
        String parentDir = this.getServletContext().getRealPath("/static/images");  // 保存到了tomcat下的编译后的项目文件中
        //System.out.println(parentDir);   // D:\Tomcat\apache-tomcat-8.5.83\webapps\Mail_war\static\images
        //System.out.println(image_path);
        File file = new File(parentDir, image_path);
        // 判断文件夹是否存在
        if(file.getParentFile().exists() && (!image_path.equals("default.png"))) {
            file.delete();
        }

        goodsInfoService.goodsInfoDelete(shop_id, goods_id);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script type='text/javascript' charset='UTF-8'>alert('已成功删除！记得刷新一下！');history.back();</script>");
    }

    /**
     * 更新、编辑商品控制器
     * 1.跳转至/manager_goods_info_update.jsp
     * @author Mori
     */
    public void goodsInfoUpdate_jump(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        // 查询需要编辑的信息，id是由doGet方式得到的
        GoodsInfoService goodsInfoService = new GoodsInfoServiceImpl();
        GoodsInfo entity = goodsInfoService.getGoodsInfoById(Integer.parseInt(request.getParameter("goods_id")));  // 转成int类型
        //System.out.println(entity.toString());
        request.setAttribute("entity", entity);
        request.getRequestDispatcher("/manager_goods_info_update.jsp").forward(request, response);
    }
    public void goodsInfoUpdate_submit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //int shop_id = Integer.parseInt(request.getParameter("shop_id"));
        int id = Integer.parseInt(request.getParameter("id"));  // 是更改不是新增
        String image_path = request.getParameter("image_path");

        // 删除商品原来的图片
        // 创建要保存的文件
        String _parentDir = this.getServletContext().getRealPath("/static/images");  // 保存到了tomcat下的编译后的项目文件中
        //System.out.println(parentDir);   // D:\Tomcat\apache-tomcat-8.5.83\webapps\Mail_war\static\images
        //System.out.println(image_path);
        File _file = new File(_parentDir, image_path);
        // 判断文件夹是否存在
        if(_file.getParentFile().exists() && (!image_path.equals("default.png"))) {
            _file.delete();
        }

        GoodsInfo entity = new GoodsInfo();
        entity.setId(id);

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("utf-8");

        String project_path = System.getProperty("user.dir");   // 注意，路径应为文件在工程中的相对路径

        // 表单
        String myFile = project_path + "/src/main/webapp/static/images";
        // 核心Api
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload fileUpload = new ServletFileUpload(factory);
        // 判断是否是muitipart/form-data类型
        if(!ServletFileUpload.isMultipartContent(request)) {
            //resp.getWriter().println("表单的enctype属性不是multipart/form-data类型");
            System.out.println("表单的enctype属性不是multipart/form-data类型");
            return;
        }
        // 设置单个文件上传大小 8M
        fileUpload.setFileSizeMax(8*1024*1024);
        // 设置总上传文件大小(有时候一次性上传多个文件，需要有一个上限, 此处为60M)
        fileUpload.setSizeMax(60*1024*1024);
        // 设置上传监听器[参数为自定义的监听器]
        // fileUpload.setProgressListener(new ListenerUploadProgress());
        // 解析请求
        try {
            List<FileItem> parseRequest = fileUpload.parseRequest(request);
            //System.out.println(parseRequest);
            // 获取数据
            for (FileItem fileItem : parseRequest) {
                // 判断数据类型是不是普通的form表单字段
                if(!fileItem.isFormField()) {
                    // 上传文件
                    String fileName = fileItem.getName();
                    InputStream fileStream = fileItem.getInputStream();
                    // 定义保存的父路径（服务器部署相对的绝对路径）
                    String parentDir = this.getServletContext().getRealPath("/static/images");  // 保存到了tomcat下的编译后的项目文件中
                    //String parentDir = System.getProperty("user.dir") + "/src/main/webapp/static/images";
                    // 使用UUID+文件名的方式，避免文件重名
                    String realFileName = UUID.randomUUID().toString()+"-"+fileName;

                    // 创建要保存的文件
                    File file = new File(parentDir, realFileName);
                    // 判断文件夹是否存在
                    if(!file.getParentFile().exists()) {
                        // 创建文件夹[多级文件夹]file.madir是创建单一文件夹
                        file.getParentFile().mkdirs();
                    }
                    // 创建输出流
                    OutputStream out = new FileOutputStream(file);
                    // 创建字节缓存
                    byte[] buffer = new byte[1024];
                    int len = -1;
                    // 一次读取1kb(1024byte),返回-1表明读取完毕
                    while((len = fileStream.read(buffer))!=-1) {
                        // 一次写入1kb(1024byte)
                        out.write(buffer,0, len);
                    }
                    //System.out.println(parentDir);  // D:/Tomcat/apache-tomcat-8.5.83/webapps/Mail_war/upload
                    //System.out.println(realFileName);  // 53e1d257-4164-4235-b03e-71bb73ddf6f0-dog.png 即文件名

                    myFile = realFileName;
                    // 冲刷流资源
                    out.flush();
                    // 关闭流
                    out.close();
                    fileStream.close();

                    // 没有上传文件的情况下，要删除该文件
                    if (!realFileName.contains(".")) {
                        file.delete();
                    }
                }else {
                    //普通字段与字段名
                    String fieldName = fileItem.getFieldName();
                    if(fieldName.equals("name")) {
                        entity.setName(fileItem.getString("UTF-8"));   // 防止字段值中文乱码
                    }
                    if(fieldName.equals("description")) {
                        entity.setDescription(fileItem.getString("UTF-8"));   // 防止字段值中文乱码
                    }
                    if(fieldName.equals("price")) {
                        entity.setPrice(Double.parseDouble(fileItem.getString("UTF-8")));   // 防止字段值中文乱码
                    }
                    if(fieldName.equals("score")) {
                        entity.setScore(Double.parseDouble(fileItem.getString("UTF-8")));   // 防止字段值中文乱码
                    }
                    if(fieldName.equals("author")) {
                        entity.setAuthor(fileItem.getString("UTF-8"));   // 防止字段值中文乱码
                    }
                    if(fieldName.equals("type")) {
                        entity.setType(fileItem.getString("UTF-8"));   // 防止字段值中文乱码
                    }

                    //String fieldValue = fileItem.getString("UTF-8");
                    //System.out.println(fieldName+":"+fieldValue);
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        response.getWriter().print(myFile);
//        if(!myFile.substring(myFile.length()-4).equals(".")) {
        if(myFile.contains(".")) {
            entity.setImage_path(myFile);
        }
        else {
            entity.setImage_path("default.png");
        }
        //将商品信息存储到数据库
        GoodsInfoService goodsInfoService = new GoodsInfoServiceImpl();
        goodsInfoService.goodsInfoUpdate(entity);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script type='text/javascript' charset='UTF-8'>alert('已成功修改商品信息！');history.back();</script>");
    }

    /**
     * 用户购买日志记录控制器
     * 跳转至/manager_goods_log_info.jsp
     * @author Mori
     */
    public void goodsLogInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GoodsInfoService goodsInfoService = new GoodsInfoServiceImpl();
        int shop_id = Integer.parseInt(request.getParameter("shop_id"));

        List<Order> list = goodsInfoService.goodsLogInfo(shop_id);  // 返回值是list形式
        request.setAttribute("Order", list);
        request.getRequestDispatcher("/manager_goods_log_info.jsp").forward(request, response);
    }



    }
