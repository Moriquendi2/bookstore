package com.mori.servlet;


//import com.fasterxml.jackson.core.JsonProcessingException;
//import com.fasterxml.jackson.databind.ObjectMapper;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * HttpServlet的子类,其他类的基类,根据请求的最后一段路径来进行方法分发
 */
public class BaseServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1.获取请求的路径
        String uri = req.getRequestURI(); // 例如路径为：/brand-case/brand/selectAll

        //2. 获取最后一段路径，方法名
        //从路径的后面找到第一个“/”所处位置，然后最后的路径截下来，不携带“/”字符，如“selectAll”
        int index = uri.lastIndexOf('/');
        //将index位置开始进行索引，返回字符串(方法名)
        String methodName = uri.substring(index + 1); //  获取到资源的二级路径  selectAll

        //3. 执行方法
        //3.1 获取BrandServlet /UserServlet 字节码对象 Class
        /*
        this为谁调用用它(this所在的方法，如service方法)，它(this)代表谁
        如：service方法被BrandServlet调用，this代表BrandServlet
         */
        //System.out.println(this);
        //下面是通过this获得字节码对象
        Class<? extends BaseServlet> cls =this.getClass();

        //使用反射来进行方法的执行
        //3.2 获取方法 Method对象
        try {
            //获取方法
            Method method = cls.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            //如果是私有方法,需要使用暴力反射
            //Method method = this.getClass().getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            //method.setAccessible(true);
            //3.3 执行方法
            method.invoke(this,req,resp);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }

//    //抽取方法,写回json
//    public void writeValue(HttpServletResponse response,Object object) throws IOException {
//        //创建jackson对象
//        ObjectMapper mapper = new ObjectMapper();
//        //设置写回字符串的格式
//        response.setContentType("application/json;charset=utf-8");
//        //写回数据
//        mapper.writeValue(response.getWriter(),object);
//    }
//    //抽取方法,获取json字符串
//    public String getJson(Object obj) throws JsonProcessingException {
//        ObjectMapper mapper = new ObjectMapper();
//        return mapper.writeValueAsString(obj);
//    }
}

