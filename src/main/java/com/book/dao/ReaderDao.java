package com.book.dao;

import com.book.domain.Library;
import com.book.domain.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

@Repository
public class ReaderDao {

    private JdbcTemplate jdbcTemplate;
    //根据用户查询的SQL语句
    private final static String MATCH_COUNT_SQL="select count(*) from reader where readerID = ? and password = ? ";
    private final static String FIND_READER_BY_USERID="select readerID,name,password from reader where readerID = ? ";
    private final static String RE_PASSWORD_SQL="UPDATE reader set password = ? where readerID = ? ";
    private final static String UPDATE_READER_NAME_SQL="UPDATE reader set name = ? where readerID = ?";
    private final static String ADD_READER_SQL="INSERT INTO reader(readerId,name,address,PhoneNumber,type,password) VALUES(?,?,?,?,'学生',123456)";
    private final static String DELETE_READER_INFO_SQL="DELETE FROM reader where readerID = ? ";
    private final static String GET_READER_INFO_SQL="SELECT * FROM reader where readerID = ? ";
    private final static String UPDATE_READER_INFO="UPDATE reader set name = ? address=? where readerID = ? ";
//    private final static String ALL_READER_INFO_SQL="SELECT r.*,CAST(AVG(fine) AS DECIMAL(10,2)) as fine FROM reader r,borrow b where r.ReaderID=b.ReaderID GROUP BY r.readerID";
    private final static String ALL_READER_INFO_SQL="SELECT r.*,CAST(0 AS DECIMAL(10,2)) as fine FROM reader r where r.ReaderID";
    private final static String ALL_LIBRARY_INFO_SQL="SELECT * FROM library";
    private final static String GET_FREQUENT_READER_SQL="SELECT *,COUNT(*) as count from reader r,borrow b,document d,copy c where r.readerID=b.ReaderID and b.documentID=d.DocumentID and b.documentID=c.DocumentID and b.IndexID=c.IndexID and c.libID=? GROUP BY r.readerID ORDER BY COUNT(*) desc LIMIT 5";


    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public int getMatchCount(int readerId,String passwd){
        return jdbcTemplate.queryForObject(MATCH_COUNT_SQL,new Object[]{readerId,passwd},Integer.class);
    }

    public Reader findReaderByReaderId(int userId){
        final Reader reader=new Reader();
        jdbcTemplate.query(FIND_READER_BY_USERID, new Object[]{userId},
                //匿名类实现的回调函数
                new RowCallbackHandler() {
                    public void processRow(ResultSet resultSet) throws SQLException {
                        reader.setReaderId(resultSet.getInt("readerID"));
                        reader.setPassword(resultSet.getString("password"));
                        reader.setName(resultSet.getString("name"));
                    }
                });
        return reader;
    }

    /*public int rePassword(int readerId,String newPasswd){
        return jdbcTemplate.update(RE_PASSWORD_SQL,new Object[]{newPasswd,readerId});
    }


    public int updateName(int readerId,String name){
        return jdbcTemplate.update(UPDATE_READER_NAME_SQL,new Object[]{name,readerId,});
    }*/

    public ArrayList<Reader> getAllReader() {
        final ArrayList<Reader> readers=new ArrayList<Reader>();
        jdbcTemplate.query(ALL_READER_INFO_SQL, new RowCallbackHandler() {
            public void processRow(ResultSet resultSet) throws SQLException {
                do{
                    Reader reader=new Reader();
                    reader.setAddress(resultSet.getString("address"));
                    reader.setName(resultSet.getString("name"));
                    reader.setReaderId(resultSet.getInt("readerID"));
                    reader.setPhoneNumber(resultSet.getString("PhoneNumber"));
                    reader.setType(resultSet.getString("type"));
                    reader.setFine(resultSet.getBigDecimal("fine"));
                    readers.add(reader);
                }while (resultSet.next());
            }
        });
        return readers;
    }

    public ArrayList<Reader> getFrequentReader(int libID) {
        final ArrayList<Reader> readers=new ArrayList<Reader>();
        jdbcTemplate.query(GET_FREQUENT_READER_SQL,new Object[]{libID}, new RowCallbackHandler() {
            public void processRow(ResultSet resultSet) throws SQLException {
                do{
                    Reader reader=new Reader();
                    reader.setName(resultSet.getString("name"));
                    reader.setCount(resultSet.getInt("count"));
                    readers.add(reader);
                }while (resultSet.next());
            }
        });
        return readers;
    }

    public ArrayList<Library> getAllLibrary() {
        final ArrayList<Library> libraries=new ArrayList<Library>();
        jdbcTemplate.query(ALL_LIBRARY_INFO_SQL, new RowCallbackHandler() {
            public void processRow(ResultSet resultSet) throws SQLException {
                do{
                    Library library=new Library();
                    library.setBranchName(resultSet.getString("BranchName"));
                    library.setBranchLocation(resultSet.getString("BranchLocation"));
                    libraries.add(library);
                }while (resultSet.next());
            }
        });
        return libraries;
    }



    /*public Reader findReaderinfoByReaderId(int readerId){
        final Reader reader=new Reader();
        jdbcTemplate.query(GET_READER_INFO_SQL, new Object[]{readerId}, new RowCallbackHandler() {
            public void processRow(ResultSet resultSet) throws SQLException {
                reader.setAddress(resultSet.getString("address"));
                reader.setName(resultSet.getString("name"));
                reader.setReaderId(resultSet.getInt("reader_id"));
            }
        });
        return reader;
    }



    public int editReaderInfo(Reader reader){
        String address=reader.getAddress();
        String name=reader.getName();
        long readerId=reader.getReaderId();
        return jdbcTemplate.update(UPDATE_READER_INFO,new Object[]{name,address,readerId});
    }*/

    public int deleteReader(int readerId){
        return jdbcTemplate.update(DELETE_READER_INFO_SQL,readerId);
    }

    public int addReader(Reader reader){
        String address=reader.getAddress();
        String name=reader.getName();
        long readerId=reader.getReaderId();
        String phoneNumber=reader.getPhoneNumber();

        return jdbcTemplate.update(ADD_READER_SQL,new Object[]{readerId,name,address,phoneNumber});
    }
}
