package com.bookstoreBackstage.web.action;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.bookstoreBackstage.domain.Book;
import com.bookstoreBackstage.domain.PageBean;
import com.bookstoreBackstage.service.BookService;
import com.bookstoreBackstage.service.CategoryService;
import com.bookstoreBackstage.utils.UploadUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class BookAction extends ActionSupport implements ModelDriven<Book> {
	private static final long serialVersionUID = 1L;

	// 模型驱动获取book对象
	private Book book = new Book();

	@Override
	public Book getModel() {
		return book;
	}

	// 属性注入bookService
	@Resource(name = "bookService")
	private BookService bookService;
	//属性注入categoryService
	@Resource(name = "categoryService")
	private CategoryService categoryService;

	/**
	 * 使用set方法接收当前页(currPage)和每页显示记录数(pageSize)
	 */
	private Integer currPage = 1;
	private Integer pageSize = 10;
	public void setCurrPage(Integer currPage) {
		if (currPage == null) {
			currPage = 1;
		}
		this.currPage = currPage;
	}
	
	public void setPageSize(Integer pageSize) {
		if (pageSize == null) {
			pageSize = 10;
		}
		this.pageSize = pageSize;
	}
	
	/**
	 * 文件上传提供的三个属性: 
	 */
	private File smallImg; // 上传小图文件
	private File bigImg; // 上传大图文件
	private String smallImgFileName; // 小图文件名称
	private String bigImgFileName; // 大图文件名称
	private String smallImgContentType; // 小图文件类型
	private String bigImgContentType; // 大图文件类型
	public void setSmallImgFileName(String smallImgFileName) {
		this.smallImgFileName = smallImgFileName;
	}
	public void setSmallImg(File smallImg) {
		this.smallImg = smallImg;
	}
	public void setSmallImgContentType(String smallImgContentType) {
		this.smallImgContentType = smallImgContentType;
	}
	public void setBigImgFileName(String bigImgFileName) {
		this.bigImgFileName = bigImgFileName;
	}
	public void setBigImg(File bigImg) {
		this.bigImg = bigImg;
	}
	public void setBigImgContentType(String bigImgContentType) {
		this.bigImgContentType = bigImgContentType;
	}

	// 离线查询对象
	private DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);

	//跳转到保存图书页面
	public String saveUI() {
		return "saveUI";
	}
	
	//跳转到编辑图书页面
	public String editUI() {
		//将需要修改的图书查询出来
		book = bookService.findBookByID(book.getBookId());
		//放入值栈回显到页面
		ActionContext.getContext().getValueStack().push(book);
		return "editUI";
	}

	/**
	 * 查询所有图书
	 * @return none
	 * @throws IOException
	 */
	public String findAllBooks() throws IOException {
		//3个if判断添加查询的条件,都为空默认查询所有图书
		if(book.getBookName() != null && !"".equals(book.getBookName())) {
			criteria.add(Restrictions.like("bookName", "%"+book.getBookName()+"%"));
		}
		if(book.getAuthor() != null && !"".equals(book.getAuthor())) {
			criteria.add(Restrictions.like("author", "%"+book.getAuthor()+"%"));
		}
		if(book.getCategoryID() != null) {
			criteria.add(Restrictions.eq("category.categoryId", book.getCategoryID()));
		}
		PageBean<Book> pageBean = bookService.findByPage(criteria, currPage, pageSize);
		//放入值栈回显到页面
		ActionContext.getContext().getValueStack().push(pageBean);
		return SUCCESS;
	}

	/**
	 * 增加图书
	 * @return savaSuccess 跳转到list页面
	 * @throws IOException 
	 */
	public String saveBook() throws IOException {
		book.setBookId(book.getISBN());
		// 上传小图图片:
		if (smallImg != null) {
			book.setSmallImage(upload(smallImg, smallImgFileName));
		}	
		// 上传大图图片:
		if (bigImg != null) {
			book.setBigImage(upload(bigImg, bigImgFileName));
		}	
		
		bookService.saveBook(book);
		return "saveSuccess";
	}
	
	/**
	 * 修改图书功能
	 * @return
	 * @throws IOException 
	 */
	public String updateBook() throws IOException {
		
		if (smallImg != null ) {
			// 已经选择了:
			// 删除原有文件:
			String img = book.getSmallImage();
			if(img != null || !"".equals(img)) {
				File file = new File(img);
				if (file.exists()) {
					file.delete();
				}
			}
			book.setSmallImage(upload(smallImg, smallImgFileName));
		}
		if (bigImg != null ) {
			// 已经选择了:
			// 删除原有文件:
			String img = book.getBigImage();
			if(bigImg != null || !"".equals(img)) {
				File file = new File(img);
				if (file.exists()) {
					file.delete();
				}
			}
			book.setBigImage(upload(bigImg, bigImgFileName));
		}
		bookService.updateBook(book);
		return "updateSuccess";
	}
	
	
	/**
	 * 
	 * @return deleteSucess 跳转到图书列表页面
	 */
	public String deleteBook() {
		//先查询在删除
		book = bookService.findBookByID(book.getBookId());
		//删除图书
		bookService.deleteBook(book);
		return "deleteSuccess";
	}

	/**
	 * 文件上传函数
	 * @param image 需要上传的图片
	 * @param imageFileName 需要上传的图片文件名
	 * @throws IOException
	 */
	public String upload(File image,String imageFileName) throws IOException {
		if (image != null) {
			// 文件上传：
			// 设置文件上传路径:
			String path = "D:/Eclipse/eclipse-workspaceForProject/bookstore/WebContent/res/static/bookImgs/";
			// 一个目录下存放的相同文件名：随机文件名
			String uuidFileName = UploadUtils.getUuidFileName(imageFileName);
			// 创建目录:
			String url = path;
			File file = new File(url);
			if (!file.exists()) {
				file.mkdirs();
			}
			// 文件上传:
			File dictFile = new File(url + "/" + uuidFileName);
			FileUtils.copyFile(image, dictFile);
			
			return uuidFileName;
		}
		return null;
	}
}
