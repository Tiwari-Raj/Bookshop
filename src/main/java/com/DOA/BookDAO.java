package com.DOA;

import java.util.List;

import com.entity.BookDtls;

public interface BookDAO {
     
	public boolean addBooks(BookDtls b);
	
	public List<BookDtls>getAllBooks();
	
	public BookDtls getBookId(int id);
	
	public boolean updateEditBooks(BookDtls b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDtls> getNewBook();
	
	public List<BookDtls> getRecentBooks();
	
	public List<BookDtls> getOldBooks();
	
	public List<BookDtls> getAllRecentbook();
	
	public List<BookDtls> getAllNewbook();
	
	public List<BookDtls> getAllOldbook();
	
	public List<BookDtls> getBookBySearch(String ch);
}
