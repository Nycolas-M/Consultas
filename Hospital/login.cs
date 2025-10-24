using System;
using System.Data.SqlClient;

class Login {
    static void Main() {
        string email = "admin@clinica.com";
        string senha = "12345";

        string connection = "Data Source=localhost;Initial Catalog=ClinicaSimples;Integrated Security=True;";
        using (SqlConnection con = new SqlConnection(connection)) {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Usuarios WHERE Email=@e AND Senha=@s", con);
            cmd.Parameters.AddWithValue("@e", email);
            cmd.Parameters.AddWithValue("@s", senha);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read()) Console.WriteLine("Login OK!");
            else Console.WriteLine("Erro no login!");
        }
    }
}
