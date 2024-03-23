<%@page import="br.com.DAO.OrcamentoDAO"%>
<%@page import="br.com.DTO.OrcamentoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        /* Estilos para o toast */
        #toast {
            visibility: hidden;
            min-width: 250px;
            margin: auto;
            background-color: #333;
            color: #fff;
            text-align: center;
            border-radius: 2px;
            padding: 16px;
            position: fixed;
            z-index: 1;
            left: 50%;
            bottom: 30px;
            transform: translateX(-50%);
        }
        #toast.show {
            visibility: visible;
            animation: slide-in 0.5s, slide-out 0.5s 2.5s;
        }
        @keyframes slide-in {
            from { bottom: 0; opacity: 0; }
            to { bottom: 30px; opacity: 1; }
        }
        @keyframes slide-out {
            from { bottom: 30px; opacity: 1; }
            to { bottom: 0; opacity: 0; }
        }
    </style>
</head>
<body>

<%
    String mensagem = null;
    try {
        OrcamentoDTO objOrcamentoDTO = new OrcamentoDTO();
        objOrcamentoDTO.setNome(request.getParameter("name"));
        objOrcamentoDTO.setNum(request.getParameter("phone"));
        objOrcamentoDTO.setEmail(request.getParameter("email"));
        objOrcamentoDTO.setMsg(request.getParameter("message"));

        OrcamentoDAO objOcamentoDAO = new OrcamentoDAO();
        objOcamentoDAO.CadastrarOrcamento(objOrcamentoDTO);

        mensagem = "Mensagem enviada com sucesso!";
    } catch (Exception e) {
        mensagem = "Ocorreu um erro ao enviar a mensagem. Por favor, tente novamente mais tarde.";
    }
%>

<div id="toast"><%= mensagem %></div>

<script>
    // JavaScript para mostrar o toast e redirecionar após 3 segundos
    window.onload = function() {
        var toast = document.getElementById("toast");
        toast.classList.add("show");
        setTimeout(function(){
            toast.classList.remove("show");
            setTimeout(function(){
                window.location.href = "index.html"; // Redireciona para index.html após 3 segundos
            }, 500); // Aguarda 1 segundo antes de redirecionar para dar tempo de o toast desaparecer completamente
        }, 4000); // Esconde o toast após 3 segundos (3000 milissegundos)
    }
</script>

</body>
</html>