package com.imooc.project.controller;

import com.imooc.project.dto.LoginDTO;
import com.imooc.project.service.AccountService;
import com.imooc.project.service.ResourceService;
import com.imooc.project.vo.ResourceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.List;

@Controller
@RequestMapping("auth")
public class LoginController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private ResourceService resourceService;

    /**输入/**，然后按回车
     * 用户登录
     * @param username
     * @param password
     * @return
     */
    @PostMapping("login")
    public String login(String username, String password, HttpSession session,
                        RedirectAttributes redirectAttributes, Model model){

        LoginDTO loginDTO = accountService.login(username, password);
        String error=loginDTO.getError();
        if (error==null){//如果没有错误，就是登录成功，存到session里面
            session.setAttribute("account",loginDTO.getAccount());
            List<ResourceVO> resourceVOS = resourceService.listResourceByRoleId(loginDTO.getAccount().getRoleId());
            model.addAttribute("resources",resourceVOS);

            //将资源转换为代码模块名称的集合
            HashSet<String> module= resourceService.convert(resourceVOS);
            session.setAttribute("module",module);
        }
        else {
            redirectAttributes.addFlashAttribute("error",loginDTO.getError());
        }


        return loginDTO.getPath();
    }

    /**
     * 登出方法
     * @param session
     * @return
     */
    @GetMapping("logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }
}