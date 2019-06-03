package com.chengw.tiafs.controller;



import com.chengw.tiafs.common.UserInfo;
import com.chengw.tiafs.model.Teacher;
import com.chengw.tiafs.services.TeacherService;
import com.chengw.tiafs.util.RequestUtil;
import com.chengw.tiafs.util.VerifyCodeUtil;
import com.chengw.tiafs.vo.LoginEntity;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author chengw
 */
@Controller
@RequestMapping(value = "/api")
@Slf4j
public class LoginController {

    @Resource
    private TeacherService teacherService;

    @RequestMapping(value = "/signin")
    public void login(/*@RequestBody LoginEntity login,*/HttpServletRequest request,HttpServletResponse response){
        log.info("开始登录");

        RequestUtil.sendRedirect(response,"/signin.html");
    }

    @RequestMapping(value = "/checkCode",method = RequestMethod.GET)
    public void verifyCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setHeader("Progma","No-cache");
        response.setHeader("Cache-Control","no-cache");
        response.addDateHeader("Expires",0);
        response.setContentType("image/jpeg");

        //生成随机字符串
        String verifyCode = VerifyCodeUtil.generateVerifyCode(4);

        HttpSession session = request.getSession();

        session.removeAttribute("verCode");
        session.setAttribute("verCode",verifyCode.toLowerCase());

        VerifyCodeUtil.outputImage(100,30,response.getOutputStream(),verifyCode);


    }


}

