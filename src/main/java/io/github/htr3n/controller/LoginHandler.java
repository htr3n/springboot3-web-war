package io.github.htr3n.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import io.github.htr3n.form.LoginForm;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class LoginHandler {

    private static final String LOGIN_VIEW = "login";
    private static final String LOGOUT_VIEW = "logout";

    @GetMapping("/login")
    public String showLoginView(Model model) {
        model.addAttribute("loginForm", new LoginForm());
        return LOGIN_VIEW;
    }

    @GetMapping("/error")
    public String showError() {
        return "error";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("loginForm") LoginForm form,
            BindingResult bindingResult,
            HttpSession session) {
        if (!bindingResult.hasErrors()) {
            final boolean authenticated = "abc@test.com".equals(form.getEmail());
            final String loginStatus = authenticated ? "OK" : "FAILED";
            session.setAttribute("loginStatus", loginStatus);
        }
        return LOGIN_VIEW;
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("loginStatus");
        return LOGOUT_VIEW;
    }
}
