package net.personnel.usermanagement.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import net.personnel.usermanagement.model.Personnel;

public class PersonnelDOA {
	private String jdbcURL = "jdbc:oracle:thin:@192.168.198.132:1521:orcl";
	private String jdbcUsernom = "sys as sysdba";
	private String jdbcPassword = "Qsdfg@123+";
	
	
	private static final String INSERT_PERSONNEL_SQL = "INSERT INTO mydb.personnels" + "  (mat, nom, grade, prison, email, tel, adresse) VALUES "
			+ " (?, ?, ?, ?, ?, ?, ?)";

	private static final String SELECT_PERSONNEL_BY_ID = "select mat,nom,grade,prison,email,tel,adresse from mydb.personnels where mat =?";
	private static final String SELECT_ALL_PERSONNELS = "select * from mydb.personnels";
	private static final String DELETE_PERSONNEL_SQL = "delete from mydb.personnels where mat = ?";
	private static final String UPDATE_PERSONNEL_SQL = "update mydb.personnels set nom = ?, grade =?, prison =?, email= ?, tel =?, adresse= ? where mat = ?";
	
	public PersonnelDOA() {
		
	}
	

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsernom, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	public void insertPersonnel(Personnel personnel) throws SQLException {
		System.out.println(INSERT_PERSONNEL_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PERSONNEL_SQL)) {
			preparedStatement.setInt(1, personnel.getMat());
			preparedStatement.setString(2, personnel.getNom());
			preparedStatement.setString(3, personnel.getGrade());
			preparedStatement.setString(4, personnel.getPrison());
			preparedStatement.setString(5, personnel.getEmail());
			preparedStatement.setInt(6, personnel.getTel());
			preparedStatement.setString(7, personnel.getAdresse());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public Personnel selectPersonnel(int mat) {
		Personnel personnel = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PERSONNEL_BY_ID);) {
			preparedStatement.setInt(1, mat);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String nom = rs.getString("nom");
				String grade= rs.getString("grade");
				String prison= rs.getString("prison");
				String email = rs.getString("email");
				int tel = rs.getInt("tel");
				String adresse = rs.getString("adresse");
				personnel = new Personnel(mat, nom, grade, prison,email,tel,adresse);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return personnel;
	}

	public List<Personnel> selectAllPersonnels() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Personnel> personnels = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PERSONNELS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int mat = rs.getInt("mat");
				String nom = rs.getString("nom");
				String grade= rs.getString("grade");
				String prison= rs.getString("prison");
				String email = rs.getString("email");
				int tel = rs.getInt("tel");
				String adresse = rs.getString("adresse");
				personnels.add(new Personnel(mat, nom, grade,prison, email, tel,adresse));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return personnels;
	}

	public boolean SupprimerPersonnel(int mat) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_PERSONNEL_SQL);) {
			statement.setInt(1, mat);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updatePersonnel(Personnel personnel) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_PERSONNEL_SQL);) {
			statement.setString(1, personnel.getNom());
			statement.setString(2, personnel.getGrade());
			statement.setString(3, personnel.getPrison());
			statement.setString(4, personnel.getEmail());
			statement.setInt(5, personnel.getTel());
			statement.setString(6, personnel.getAdresse());
			statement.setInt(7, personnel.getMat());


			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
	

}
