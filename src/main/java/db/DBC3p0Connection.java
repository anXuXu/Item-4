package db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DBC3p0Connection
{
	private static DBC3p0Connection connectionUtil;
	private static Connection connection;
	private Properties properties;
	
	private ComboPooledDataSource comboPooledDataSource;

	private DBC3p0Connection()
	{
		comboPooledDataSource = new ComboPooledDataSource("c3p0-config.xml");
	}

	public static synchronized DBC3p0Connection getInstance()
	{
		if (connectionUtil == null)
		{
			connectionUtil = new DBC3p0Connection();
		}
		return connectionUtil;
	}
	
	public  ComboPooledDataSource getDataSource() 
	{
		return comboPooledDataSource;
	}

	public Connection getConnection()
	{
		try
		{
			connection = comboPooledDataSource.getConnection();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return connection;
	}

	public void Close(Connection connection, ResultSet resultSet, PreparedStatement pps) throws SQLException
	{
		if (resultSet !=null)
		{
			resultSet.close();
		}
		if (pps!=null)
		{
			pps.close();
		}
		if (connection!=null)
		{
			connection.close();
			connection = null;
		}
	}
}
