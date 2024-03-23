<%@page import="java.util.ArrayList"%> <!-- Importa a classe ArrayList -->
<%@page import="br.com.DAO.OrcamentoDAO"%>
<%@page import="br.com.DTO.OrcamentoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        .static-content {
            color: black; /* Estilo para as strings estáticas */
        }
        
        .dynamic-content {
            color: #999999; /* Estilo para os valores dinâmicos */
        }
        
        .orcamento-item {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<%
// Verifica se o usuário está logado
Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
if (loggedIn == null || !loggedIn) {
    response.sendRedirect("login.jsp"); // Redireciona para a página de login se o usuário não estiver logado
} else {
    try {
        OrcamentoDAO objOrcamentoDAO = new OrcamentoDAO();
        ArrayList<OrcamentoDTO> lista  = objOrcamentoDAO.PesquisarOrcamento();
        
        for(int num = 0; num<lista.size(); num ++){
%>
            <div class="orcamento-item">
                <p class="static-content">Numero Orcamento: </p><p class="dynamic-content"><%= lista.get(num).getId_orc() %></p>
                <p class="static-content">Nome do Cliente: </p><p class="dynamic-content"><%= lista.get(num).getNome() %></p>
                <p class="static-content">Numero para Contato: </p><p class="dynamic-content"><%= lista.get(num).getNum() %></p>
                <p class="static-content">Email: </p><p class="dynamic-content"><%= lista.get(num).getEmail() %></p>
                <p class="static-content">Menssagem: </p><p class="dynamic-content"><%= lista.get(num).getMsg() %></p>
            </div>
<%
        }
    } catch (Exception e) {
    }
}
%>

</body>
</html>

