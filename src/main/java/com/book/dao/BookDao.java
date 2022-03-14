package com.book.dao;

import com.book.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

@Repository
public class BookDao {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final static String ADD_DOCUMENT_SQL_TWO = "INSERT INTO copy VALUES(401,4,1)";
    private final static String EDIT_BOOK_SQL = "update book_info set name= ? ,author= ? ,publish= ? ,ISBN= ? ,introduction= ? ,language= ? ,price= ? ,pubdate= ? ,class_id= ? ,pressmark= ? ,state= ?  where book_id= ? ;";
    private final static String QUERY_ALL_BOOKS_SQL = "SELECT * FROM document d, copy c, library l WHERE d.DocumentID=c.DocumentID and c.libID = l.libID";
    private final static String QUERY_BOOK_SQL = "SELECT * FROM document d,copy c, library l WHERE (d.DocumentID like ?  or  d.title like ? or d.publisher like ?) and d.DocumentID=c.DocumentID and c.libID = l.libID";
    //查询匹配图书的个数
    private final static String MATCH_BOOK_SQL = "SELECT count(*) FROM document WHERE DocumentID like ?  or  title like ? or publisher like ? ";
    //根据书号查询图书
    private final static String GET_Document_SQL = "SELECT * FROM document d,copy c, library l where d.DocumentID = ? and d.DocumentID=c.DocumentID and c.libID = l.libID";
    private final static String GET_BOOK_SQL = "SELECT * FROM book where DocumentID = ? ";
    private final static String GET_Journalvolume_SQL = "SELECT * FROM journalvolume where DocumentID = ? ";
    private final static String GET_Conference_SQL = "SELECT * FROM conference where DocumentID = ? ";
    private final static String GET_POPULAR_Document_SQL = "SELECT *,COUNT(*) as count from borrow b,document d,copy c where b.documentID=d.DocumentID and b.documentID=c.DocumentID and b.IndexID=c.IndexID and c.libID=? GROUP BY d.DocumentID ORDER BY COUNT(*) desc LIMIT 5";

    // 插入
    private final static String ADD_DOCUMENT_SQL = "INSERT INTO document(title,publisher,publisherDate,publisherAddress) VALUES(?,?,?,?)";
    private final static String ADD_COPY_SQL = "INSERT INTO copy(documentid,libid,state) VALUES(?,?,1)";
    private final static String ADD_BOOK_SQL = "INSERT INTO book(documentid,authorname,isbn) VALUES(?,?,?)";
    private final static String QUERY_BOOK_BY_NAME_SQL = "SELECT * FROM document where title = ? ";

    private final static String QUERY_DOCUMENTID_BY_NAME_SQL = "SELECT documentid FROM document where title = ? ";
    private final static String COUNT_DOCUMENT_BY_NAME_SQL = "SELECT count(*) FROM document where title = ? ";
    // 根据indexID获取documentID
    private final static String QUERY_DOCUMENTID_BY_INDEXID_SQL = "SELECT documentid FROM copy where indexid = ? ";

    // 查询同种图书数量
    private final static String COUNT_BOOK_SQL = "SELECT count(*) FROM copy WHERE documentid = ? ";

    // 删除
    private final static String DELETE_BOOK_SQL = "delete from book where documentid = ?  ";
    private final static String DELETE_COPY_SQL = "delete from copy where indexid = ?  ";
    private final static String DELETE_DOCUMENT_SQL = "delete from document where documentid = ?  ";

    private final static String QUERY_LIB_ID_SQL = "SELECT libid FROM library WHERE branchname=? ";

    //后来人因为需求变更 新增的语句和paper类
    private final static String GET_Paper_SQL = "SELECT * FROM paper";
    private final static String QUERY_PAPER_SQL = "SELECT * FROM paper WHERE papertitle like ? or paperauthor like ? or paperdate like ? or paperconferenceorjournalname like ? or paperdoi like ? ";
    private final static String MATCH_Paper_SQL = "SELECT count(*) FROM paper WHERE PaperTitle like ?  or  PaperAuthor like ? or PaperDate like ? or PaperConferenceOrJournalName like ? or PaperDOI like ?";
    private final static String ADD_PAPER_SQL = "INSERT INTO paper(papertitle,paperauthor,paperdate,paperconferenceorjournalname,paperissue,papervolume,paperpage,paperdoi) VALUES(?,?,?,?,?,?,?,?)";
    private final static String DELETE_PAPER_SQL = "DELETE FROM paper where paperid = ?";

    public int matchBook(String searchWord) {
        String swcx = "%" + searchWord + "%";
        return jdbcTemplate.queryForObject(MATCH_BOOK_SQL, new Object[]{swcx, swcx, swcx}, Integer.class);
    }

    public int matchPaper(String searchWord) {
        String input = "%" + searchWord + "%";
        return jdbcTemplate.queryForObject(MATCH_Paper_SQL, new Object[]{input, input, input, input, input}, Integer.class);
    }

    public ArrayList<Document> queryBook(String sw) {
        String swcx = "%" + sw + "%";
        final ArrayList<Document> documents = new ArrayList<Document>();
        jdbcTemplate.query(QUERY_BOOK_SQL, new Object[]{swcx, swcx, swcx}, new RowCallbackHandler() {
            public void processRow(ResultSet resultSet) throws SQLException {
                do {
                    Document document = new Document();
                    document.setDocumentId(resultSet.getLong("DocumentID"));
                    document.setTitle(resultSet.getString("title"));
                    document.setPublisher(resultSet.getString("publisher"));
                    document.setPublisherDate(resultSet.getDate("publisherDate"));
                    document.setState(resultSet.getInt("state"));
                    document.setIndexID(resultSet.getInt("IndexID"));
                    document.setBranch(resultSet.getString("BranchName"));
                    documents.add(document);
                } while (resultSet.next());

            }
        });
        return documents;
    }

    public ArrayList<Document> getAllBooks() {
        final ArrayList<Document> documents = new ArrayList<Document>();

        jdbcTemplate.query(QUERY_ALL_BOOKS_SQL, new RowCallbackHandler() {
            public void processRow(ResultSet resultSet) throws SQLException {
                do {
                    Document document = new Document();
                    document.setTitle(resultSet.getString("title"));
                    document.setPublisher(resultSet.getString("publisher"));
                    document.setPublisherDate(resultSet.getDate("publisherDate"));
                    document.setState(resultSet.getInt("state"));
                    document.setDocumentId(resultSet.getLong("DocumentID"));
                    document.setIndexID(resultSet.getInt("IndexID"));
                    document.setBranch(resultSet.getString("BranchName"));
                    documents.add(document);
                } while (resultSet.next());

            }
        });
        return documents;

    }

    /*public int deleteBook(long bookId){

        return jdbcTemplate.update(DELETE_BOOK_SQL,bookId);
    }*/

    public int deleteBook(long indexId) {
        // 判断图书剩余数量
        long documentId = jdbcTemplate.queryForObject(QUERY_DOCUMENTID_BY_INDEXID_SQL, new Object[]{indexId}, long.class);
        int bookNum = jdbcTemplate.queryForObject(COUNT_BOOK_SQL, new Object[]{documentId}, Integer.class);
        System.out.println(bookNum);
        if (bookNum > 1) {
            return jdbcTemplate.update(DELETE_COPY_SQL, indexId);
        } else {
            jdbcTemplate.update(DELETE_COPY_SQL, indexId);
            jdbcTemplate.update(DELETE_BOOK_SQL, documentId);
            return jdbcTemplate.update(DELETE_DOCUMENT_SQL, documentId);
        }
    }

    public int addPaper(Paper paper) {
        String papertitle = paper.getPaperTitle();
        String paperauthor = paper.getPaperAuthor();
        String paperdate = paper.getPaperDate();
        String paperconferenceorjournalname = paper.getPaperConferenceOrJournalName();
        String paperissue = paper.getPaperIssue();
        String papervolume = paper.getPaperVolume();
        String paperpage = paper.getPaperPage();
        String paperdoi = paper.getPaperDOI();

        return jdbcTemplate.update(ADD_PAPER_SQL, papertitle, paperauthor, paperdate, paperconferenceorjournalname, paperissue, papervolume, paperpage, paperdoi);
    }


    public int deletePaper(int paperId) {
        return jdbcTemplate.update(DELETE_PAPER_SQL, paperId);
    }


    //    public int addDocument(Document document) {
//        String title = document.getTitle();
//        String publisher = document.getPublisher();
//        Date publisherDate = document.getPublisherDate();
//        String publisherAddress = document.getPublisherAddress();
//        String branchName = document.getBranch();
//        //jdbcTemplate.update(ADD_DOCUMENT_SQL_TWO,new Object[]{});
//        return jdbcTemplate.update(ADD_DOCUMENT_SQL, new Object[]{title, publisher, publisherDate, publisherAddress});
//    }
    public int addDocument(Document document, Book book) {
        String title = document.getTitle();
        String publisher = document.getPublisher();
        Date publisherDate = document.getPublisherDate();
        String publisherAddress = document.getPublisherAddress();
        String branchName = document.getBranch();
        String authorName = book.getAuthorName();
        String ISBN = book.getIsbn();

        // 查询图书馆编号
        int libID = jdbcTemplate.queryForObject(QUERY_LIB_ID_SQL, new Object[]{branchName}, Integer.class);

        // 判断图书是否已存在
        int documentExisting = jdbcTemplate.queryForObject(COUNT_DOCUMENT_BY_NAME_SQL, new Object[]{title}, Integer.class);

        // 插入图书
        long documentID;
        if (documentExisting > 0) {
            documentID = jdbcTemplate.queryForObject(QUERY_DOCUMENTID_BY_NAME_SQL, new Object[]{title}, long.class);
            int bookNum = jdbcTemplate.queryForObject(COUNT_BOOK_SQL, new Object[]{documentID}, Integer.class);
            if (bookNum >= 3) {
                return 0;
            } else {
                return jdbcTemplate.update(ADD_COPY_SQL, documentID, libID);
            }
        } else {
            jdbcTemplate.update(ADD_DOCUMENT_SQL, title, publisher, publisherDate, publisherAddress);
            documentID = jdbcTemplate.queryForObject(QUERY_DOCUMENTID_BY_NAME_SQL, new Object[]{title}, long.class);
            jdbcTemplate.update(ADD_BOOK_SQL, documentID, authorName, ISBN);
            return jdbcTemplate.update(ADD_COPY_SQL, documentID, libID);
        }
    }

    public Document getDocument(Long documentId) {
        final Document document = new Document();
        jdbcTemplate.query(GET_Document_SQL, new Object[]{documentId}, new RowCallbackHandler() {
            public void processRow(ResultSet resultSet) throws SQLException {
                document.setTitle(resultSet.getString("title"));
                document.setPublisher(resultSet.getString("publisher"));
                document.setIndexID(resultSet.getInt("IndexID"));
                document.setBranch(resultSet.getString("BranchName"));
            }
        });
        return document;
    }

    public Book getBook(Long documentId) {
        final Book book = new Book();
        jdbcTemplate.query(GET_BOOK_SQL, new Object[]{documentId}, new RowCallbackHandler() {
            public void processRow(ResultSet resultSet) throws SQLException {
                book.setAuthorName(resultSet.getString("AuthorName"));
                book.setIsbn(resultSet.getString("ISBN"));
            }
        });
        return book;
    }

    public ArrayList<Paper> queryPaper(String para) {
        String para_tmp = "%" + para + "%";
        final ArrayList<Paper> papers = new ArrayList<Paper>();
        jdbcTemplate.query(QUERY_PAPER_SQL, new Object[]{para_tmp, para_tmp, para_tmp, para_tmp, para_tmp}, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {
                do {
                    Paper paper = new Paper();
                    paper.setPaperId(resultSet.getInt("PaperId"));
                    paper.setPaperTitle(resultSet.getString("PaperTitle"));
                    paper.setPaperAuthor(resultSet.getString("PaperAuthor"));
                    paper.setPaperDate(resultSet.getString("PaperDate"));
                    paper.setPaperConferenceOrJournalName(resultSet.getString("PaperConferenceOrJournalName"));
                    paper.setPaperIssue(resultSet.getString("PaperIssue"));
                    paper.setPaperVolume(resultSet.getString("PaperVolume"));
                    paper.setPaperPage(resultSet.getString("PaperPage"));
                    paper.setPaperDOI(resultSet.getString("PaperDOI"));
                    papers.add(paper);
                } while (resultSet.next());
            }
        });
        return papers;
    }


    public ArrayList<Paper> getAllPaper() {
        final ArrayList<Paper> papers = new ArrayList<Paper>();
        jdbcTemplate.query(GET_Paper_SQL, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {
                do {
                    Paper paper = new Paper();
                    paper.setPaperId(resultSet.getInt("PaperId"));
                    paper.setPaperTitle(resultSet.getString("PaperTitle"));
                    paper.setPaperAuthor(resultSet.getString("PaperAuthor"));
                    paper.setPaperDate(resultSet.getString("PaperDate"));
                    paper.setPaperConferenceOrJournalName(resultSet.getString("PaperConferenceOrJournalName"));
                    paper.setPaperIssue(resultSet.getString("PaperIssue"));
                    paper.setPaperVolume(resultSet.getString("PaperVolume"));
                    paper.setPaperPage(resultSet.getString("PaperPage"));
                    paper.setPaperDOI(resultSet.getString("PaperDOI"));
                    papers.add(paper);
                } while (resultSet.next());
            }
        });
        return papers;
    }


    public Journalvolume getjournalvolume(Long documentId) {
        final Journalvolume journalvolume = new Journalvolume();
        jdbcTemplate.query(GET_Journalvolume_SQL, new Object[]{documentId}, new RowCallbackHandler() {
            public void processRow(ResultSet resultSet) throws SQLException {
                journalvolume.setJournalEditor(resultSet.getString("JournalEditor"));
                journalvolume.setJournalName(resultSet.getString("JournalName"));
                journalvolume.setScope(resultSet.getString("scope"));
                journalvolume.setVolumeName(resultSet.getString("VolumeName"));
                journalvolume.setVolumeEditor(resultSet.getString("VolumeEditor"));
            }
        });
        return journalvolume;
    }

    public Conference getconference(Long documentId) {
        final Conference conference = new Conference();
        jdbcTemplate.query(GET_Conference_SQL, new Object[]{documentId}, new RowCallbackHandler() {
            public void processRow(ResultSet resultSet) throws SQLException {
                conference.setConferencedate(resultSet.getDate("Conferencedate"));
                conference.setConferencelocation(resultSet.getString("Conferencelocation"));
                conference.setProceedingEditor(resultSet.getString("ProceedingEditor"));
            }
        });
        return conference;
    }

    public ArrayList<Document> getpopularDocument(int libID) {
        final ArrayList<Document> documents = new ArrayList<Document>();
        jdbcTemplate.query(GET_POPULAR_Document_SQL, new Object[]{libID}, new RowCallbackHandler() {
            public void processRow(ResultSet resultSet) throws SQLException {
                Document document = new Document();
                document.setTitle(resultSet.getString("title"));
                document.setCount(resultSet.getInt("count"));
                documents.add(document);
            }
        });
        return documents;
    }
    /*public int editBook(Book book){
        Long bookId=book.getBookId();
        String name=book.getName();
        String author=book.getAuthor();
        String publish=book.getPublish();
        String isbn=book.getIsbn();
        String introduction=book.getIntroduction();
        String language=book.getLanguage();
        BigDecimal price=book.getPrice();
        Date pubdate=book.getPubdate();
        int classId=book.getClassId();
        int pressmark=book.getPressmark();
        int state=book.getState();

        return jdbcTemplate.update(EDIT_BOOK_SQL,new Object[]{name,author,publish,isbn,introduction,language,price,pubdate,classId,pressmark,state,bookId});
    }*/


}
