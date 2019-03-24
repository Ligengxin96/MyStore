package com.bookstore.web.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.bookstore.domain.Book;
import com.bookstore.domain.PageBean;
import com.bookstore.service.BookService;
import com.bookstore.service.CategoryService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;

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

	//每页显示记录的个数
	private static final Integer pageSize = 12;
	//使用set方法接收当前页(currPage)和输入的书名(serchBookName)
	private Integer currPage;
	private String serchBookName;
	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}
	public void setSerchBookName(String serchBookName) {
		this.serchBookName = serchBookName;
	}

	/*public void setPageSize(Integer pageSize) {
	this.pageSize = pageSize;
	}*/
	// 离线查询对象
	private DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);

	// 跳转到商品列表页面
	public String goodsListUI() {
		return "goodsListUI";
	}

	// 跳转到商品详情页面
	public String bookDetails() {
		// 查询用户点击的那本书
		book = bookService.findBookByID(book.getBookId());
		ActionContext.getContext().getValueStack().push(book);
		// 返回到商品详情页面
		return "detailsUI";
	}

	/**
	 * 查询所有图书
	 * @return none
	 * @throws IOException
	 */
	public String findAllBooks() throws IOException {
		if(serchBookName !=null && !"".equals(serchBookName)) {
			criteria.add(Restrictions.like("bookName", "%"+serchBookName+"%"));
		}
		PageBean<Book> pageBean = bookService.findByPage(criteria, currPage, pageSize);
		List<Book> booksList = pageBean.getList();

		//list对象转为json数据
		JSONArray jsonArray = JSONArray.fromObject(booksList);
		//回显到页面
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(jsonArray.toString());

		return NONE;
	}

	/**
	 * 查询所以书本数量
	 * @return none
	 * @throws IOException
	 */
	public String findBookCount() throws IOException {
		if(serchBookName !=null && !"".equals(serchBookName)) {
			criteria.add(Restrictions.like("bookName", "%"+serchBookName+"%"));
		}	
		int bookCount = bookService.findBookCount(criteria);
		
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(bookCount);
		return NONE;
	}
	
	
	/**
	 * 根据书名查找书籍
	 * @return
	 * @throws IOException 
	 *//*
	public String findBookByName() throws IOException{
		criteria.add(Restrictions.like("bookName", "%"+book.getBookName()+"%"));
		PageBean<Book> pageBean = bookService.findByPage(criteria, currPage, pageSize);
		List<Book> booksList = pageBean.getList();
		ActionContext.getContext().getValueStack().push(pageBean);

		//JSONArray jsonArray = JSONArray.fromObject(booksList);
		// 回显到页面
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(jsonArray.toString());

		return NONE;
		
	}*/
	
	
}
