package com.book.dao;

import com.book.domain.Borrow;
import com.book.domain.Reserve;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
@Repository
public class LendDao {

    private JdbcTemplate jdbcTemplate;
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final static String BOOK_RETURN_SQL_ONE="UPDATE borrow SET RDatetime = ? WHERE documentID = ? and IndexID=? AND RDatetime is NULL";

    private final static String BOOK_RETURN_SQL_TWO="UPDATE copy SET state = 1 WHERE DocumentID = ? and IndexID=?";

    private final static String BOOK_LEND_SQL_ONE="INSERT INTO borrow (documentId,IndexID,BDatetime,ReaderID) VALUES ( ? , ?, ?, 20202021)";

    private final static String BOOK_RESERVE_SQL="INSERT INTO reserve (documentId,IndexID,BeserveTime,ReaderID) VALUES ( ? , ?, ?, 20202021)";

    private final static String BOOK_LEND_SQL_TWO="UPDATE copy SET state = 0 WHERE DocumentID = ? and IndexID=?";

    //private final static String LEND_LIST_SQL="SELECT * FROM borrow";
    private final static String LEND_LIST_SQL="SELECT * FROM borrow NATURAL JOIN library NATURAL JOIN document NATURAL JOIN copy";

    private final static String MY_BORROW_LIST_SQL="SELECT * FROM borrow b NATURAL JOIN document d NATURAL JOIN library l NATURAL JOIN copy c WHERE b.ReaderID = ?";

    private final static String MY_RESERVE_LIST_SQL="SELECT * FROM reserve r,document d,library l,copy c WHERE ReaderID = ? and r.DocumentID=d.DocumentID and r.DocumentID= c.DocumentID and r.IndexID=c.IndexID and c.libID=l.libID";

    public int bookReturnOne(long documentId,long indexId){
        return  jdbcTemplate.update(BOOK_RETURN_SQL_ONE,new Object[]{df.format(new Date()),documentId,indexId});
    }
    public int bookReturnTwo(long documentId,long indexId){
        return jdbcTemplate.update(BOOK_RETURN_SQL_TWO,new Object[]{documentId,indexId});
    }
    public int bookLendOne(long documentId,long indexId){
        return  jdbcTemplate.update(BOOK_LEND_SQL_ONE,new Object[]{documentId,indexId,df.format(new Date())});
    }
    public int bookReserve(long documentId,long indexId){
        return  jdbcTemplate.update(BOOK_RESERVE_SQL,new Object[]{documentId,indexId,df.format(new Date())});
    }
    public int bookLendTwo(long documentId,long indexId){
        return  jdbcTemplate.update(BOOK_LEND_SQL_TWO,new Object[]{documentId,indexId});
    }

    public ArrayList<Borrow> lendList(){
        final ArrayList<Borrow> list=new ArrayList<Borrow>();

        jdbcTemplate.query(LEND_LIST_SQL, new RowCallbackHandler() {
            public void processRow(ResultSet resultSet) throws SQLException {
                do{
                    Borrow borrow=new Borrow();
                    borrow.setReaderId(resultSet.getInt("ReaderId"));
                    borrow.setBDatetime(resultSet.getDate("BDatetime"));
                    borrow.setRDatetime(resultSet.getDate("RDatetime"));
                    borrow.setIndexId(resultSet.getLong("IndexID"));
                    borrow.setDocumentId(resultSet.getLong("documentID"));
                    borrow.setFine(resultSet.getBigDecimal("fine"));
                    borrow.setTitle(resultSet.getString("title"));
                    borrow.setBranch(resultSet.getString("BranchName"));
                    list.add(borrow);
                }while (resultSet.next());
            }
        });
        return list;
    }

    public ArrayList<Borrow> myLendList(long readerId){
        final ArrayList<Borrow> list=new ArrayList<Borrow>();

        jdbcTemplate.query(MY_BORROW_LIST_SQL, new Object[]{readerId},new RowCallbackHandler() {
            public void processRow(ResultSet resultSet) throws SQLException {
                do{
                    Borrow borrow=new Borrow();
                    borrow.setDocumentId(resultSet.getLong("documentID"));
                    borrow.setIndexId(resultSet.getLong("IndexID"));
                    borrow.setBDatetime(resultSet.getDate("BDatetime"));
                    borrow.setReaderId(resultSet.getInt("ReaderID"));
                    borrow.setRDatetime(resultSet.getDate("RDatetime"));
                    borrow.setFine(resultSet.getBigDecimal("fine"));
                    borrow.setTitle(resultSet.getString("title"));
                    borrow.setBranch(resultSet.getString("BranchName"));
                    list.add(borrow);
                }while (resultSet.next());
            }
        });
        return list;

    }
    public ArrayList<Reserve> myReserveList(long readerId){
        final ArrayList<Reserve> list=new ArrayList<Reserve>();

        jdbcTemplate.query(MY_RESERVE_LIST_SQL, new Object[]{readerId},new RowCallbackHandler() {
            public void processRow(ResultSet resultSet) throws SQLException {
                do{
                    Reserve reserve=new Reserve();
                    reserve.setIndexId(resultSet.getInt("IndexId"));
                    reserve.setDocumentId(resultSet.getLong("DocumentID"));
                    reserve.setBeserveTime(resultSet.getDate("BeserveTime"));
                    reserve.setState(resultSet.getInt("state"));
                    reserve.setBranch(resultSet.getString("BranchName"));
                    reserve.setTitle(resultSet.getString("title"));
                    list.add(reserve);
                }while (resultSet.next());
            }
        });
        return list;

    }
}
