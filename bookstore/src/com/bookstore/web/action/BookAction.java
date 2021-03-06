package com.bookstore.web.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.bookstore.domain.Book;
import com.bookstore.domain.PageBean;
import com.bookstore.service.BookService;
import com.bookstore.service.CategoryService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

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
	/**
	 * 使用set方法接收
	 * 当前页(currPage)
	 * 输入的书名(serchBookName)
	 * 分类搜索(serchCategory)
	 * 排序方式(sort)默认按价格排序
	 */
	private Integer currPage;
	private String serchBookName;
	private Long serchCategory;
	private String sort = "sortByPrice"; 
	public void setSort(String sort) {
		if(sort == null || "".equals(sort)) {
			sort = "sortByPrice";
		}
		this.sort = sort;
	}
	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}
	public void setSerchBookName(String serchBookName) {
		this.serchBookName = serchBookName;
	}
	public void setSerchCategory(Long serchCategory) {
		this.serchCategory = serchCategory;
	}
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
		if(serchBookName != null && !"".equals(serchBookName)) {
			criteria.add(Restrictions.or(Restrictions.like("bookName", "%"+serchBookName+"%"), Restrictions.like("author", "%"+serchBookName+"%")));
		}
		if(serchCategory != null) {
			criteria.add(Restrictions.eq("categoryID", serchCategory));
		}
		if("sortByPrice".equals(sort)) {
			criteria.addOrder(Order.asc("price"));
		}
		if ("sortByDiscount".equals(sort)) {
			criteria.addOrder(Order.asc("discount"));
		}

		PageBean<Book> pageBean = bookService.findByPage(criteria, currPage, pageSize);
		List<Book> booksList = pageBean.getList();

		//list对象转为json数据
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] {"shoppingCart"});
		JSONArray jsonArray = JSONArray.fromObject(booksList,jsonConfig);
		
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
		if(serchCategory != null) {
			criteria.add(Restrictions.eq("categoryID", serchCategory));
		}
		int bookCount = bookService.findBookCount(criteria);
		
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(bookCount);
		return NONE;
	}
	
}
