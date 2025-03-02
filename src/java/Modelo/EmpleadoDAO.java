package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class EmpleadoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Empleado validar(String user, String password) {
        Empleado em = new Empleado();
        String sql = "select * from empleado where User=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            rs = ps.executeQuery();

            if (rs.next()) {
                String passwordHash = rs.getString("password");

                
                if (HashPass.hashPassword(password).equals(passwordHash)) {
                    
                    em = new Empleado();
                    em.setId(rs.getInt("IdEmpleado"));
                    em.setUser(rs.getString("User"));
                    em.setDni(rs.getString("Dni"));
                    em.setNom(rs.getString("Nombres"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error al validar usuario: " + e.getMessage());
        }
        return em;
    }

    //Operaciones CRUD
    public List listar() {
        String sql = "select * from empleado";
        List<Empleado> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Empleado em = new Empleado();
                em.setId(rs.getInt(1));
                em.setDni(rs.getString(2));
                em.setNom(rs.getString(3));
                em.setTel(rs.getString(4));
                em.setEstado(rs.getString(5));
                em.setCorreo(rs.getString(6));
                em.setUser(rs.getString(7));
                em.setPassword(rs.getString(8));
                lista.add(em);
            }
            ps.close();
            con.close();
            rs.close();
        } catch (SQLException e) {
            System.out.println("Error al listar empleado:" + e);
        }
        return lista;
    }

    public int agregar(Empleado em) {
        String sql = "insert into empleado(Dni, Nombres, Telefono,Estado,Correo,User,Password)values(?,?,?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, em.getDni());
            ps.setString(2, em.getNom());
            ps.setString(3, em.getTel());
            ps.setString(4, em.getEstado());
            ps.setString(5, em.getCorreo());
            ps.setString(6, em.getUser());
            
            String hashedPassword = HashPass.hashPassword(em.getPassword());
            ps.setString(7, hashedPassword);
            
            ps.executeUpdate();
            ps.close();
            con.close();
            rs.close();
        } catch (SQLException e) {
            System.out.println("Error al agregar empleado:" + e);
        }
        return r;

    }

    public Empleado listarId(int id) {
        Empleado emp = new Empleado();
        String sql = "select * from empleado where IdEmpleado=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                emp.setDni(rs.getString(2));
                emp.setNom(rs.getString(3));
                emp.setTel(rs.getString(4));
                emp.setEstado(rs.getString(5));
                emp.setCorreo(rs.getString(6));
                emp.setUser(rs.getString(7));
            }
            ps.close();
            con.close();
            rs.close();
        } catch (Exception e) {
            System.out.println("Error al listarId empleado:" + e);
        }
        return emp;
    }

    public int actualizar(Empleado em) {
        String sql = "update empleado set Dni=?, Nombres=?, Telefono=?,Estado=?, Correo=?, User=?, Password=? where IdEmpleado=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, em.getDni());
            ps.setString(2, em.getNom());
            ps.setString(3, em.getTel());
            ps.setString(4, em.getEstado());
            ps.setString(5, em.getCorreo());
            ps.setString(6, em.getUser());
            String hashedPassword = HashPass.hashPassword(em.getPassword());
            ps.setString(7, hashedPassword);
            ps.setInt(8, em.getId());
            ps.executeUpdate();
            ps.close();
            con.close();
            rs.close();
        } catch (SQLException e) {
            System.out.println("Error actualizar empleado:" + e);
        }
        return r;
    }

    public void delete(int id) {
        String sql = "delete from empleado where IdEmpleado=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            ps.close();
            con.close();
            rs.close();
        } catch (SQLException e) {
            System.out.println("Error el eliminar empleado:" + e);
        }
    }

}
