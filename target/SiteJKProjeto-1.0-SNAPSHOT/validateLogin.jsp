<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    // Verifica se o usuário e a senha estão corretos
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username.equals("admin") && password.equals("admin")) {
        // Se o login for bem-sucedido, cria uma sessão e redireciona para a página listarOrcamento.jsp
        session.setAttribute("loggedIn", true);
        response.sendRedirect("listarOrcamento.jsp");
    } else {
        // Se o login falhar, redireciona de volta para a página de login com uma mensagem de erro
        response.sendRedirect("login.jsp?error=true");
    }
%>
