
package br.com.DAO;

import br.com.DTO.OrcamentoDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;


public class OrcamentoDAO {
    
    
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<OrcamentoDTO> lista = new ArrayList<>();
            
    public void CadastrarOrcamento(OrcamentoDTO objOrcamentoDTO) throws ClassNotFoundException{
    
        String sql = "insert into orcamento (nome, num, email, msg) values (?,?,?,?)";
        con = new ConexaoDAO().conexaoBD();
        
        try {
            
            pstm = con.prepareStatement(sql);
            pstm.setString(1, objOrcamentoDTO.getNome());
            pstm.setString(2, objOrcamentoDTO.getNum());
            pstm.setString(3, objOrcamentoDTO.getEmail());
            pstm.setString(4, objOrcamentoDTO.getMsg());
            
            pstm.execute();
            pstm.close();
            
        } catch (SQLException e) {
            
        }
        
    }
    
    
    
    
    public ArrayList<OrcamentoDTO> PesquisarOrcamento() throws ClassNotFoundException{
    
        String sql = "select * from orcamento";
        con = new ConexaoDAO().conexaoBD();
    
        try {
            pstm = con.prepareStatement(sql);
            rs  = pstm.executeQuery(sql);
            
            while(rs.next()) {

                OrcamentoDTO objOrcamentoDTO = new OrcamentoDTO();
                objOrcamentoDTO.setId_orc(rs.getInt("id_orc"));
                objOrcamentoDTO.setNome(rs.getString("nome"));
                objOrcamentoDTO.setNum(rs.getString("num"));
                objOrcamentoDTO.setEmail(rs.getString("email"));
                objOrcamentoDTO.setMsg(rs.getString("msg"));
                
                lista.add(objOrcamentoDTO);
                
                
                
            }
          
            
            
            
            
            
        } catch (SQLException e) {
        }
        
        return lista;
    }
    
    
    
    
    
}
