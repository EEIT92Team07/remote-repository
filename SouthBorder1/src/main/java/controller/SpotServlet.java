package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SpotBean;
import model.SpotService;

public class SpotServlet extends HttpServlet {
	private SimpleDateFormat sdFormat = new SimpleDateFormat("HH:mm");
	private SpotService spotService = new SpotService();
	private static final long serialVersionUID = 1L;
       
    public SpotServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收資料
				String name = request.getParameter("spotName");
				String temp2 = request.getParameter("SuggestTime");
				String temp3 = request.getParameter("coordinate");
				String temp4 = request.getParameter("Info");
				String temp5 = request.getParameter("opentime");
				String temp6 = request.getParameter("price");
				String temp7 = request.getParameter("type");
				String temp8 = request.getParameter("photo");
				String prodaction = request.getParameter("prodaction");
				
		//驗證資料
				Map<String, String> errors = new HashMap<String, String>();
				request.setAttribute("errors", errors);
				
				if("Insert".equals(prodaction) || "Update".equals(prodaction) || "Delete".equals(prodaction)) {
					if(temp2==null || temp2.length()==0) {
						errors.put("id", "請輸入品名以便於執行"+prodaction);
					}
				}
				
		//轉換資料
//				int id = 0;
//				if(temp1!=null && temp1.length()!=0) {
//					try {
//						id = Integer.parseInt(temp1);
//					} catch (NumberFormatException e) {
//						e.printStackTrace();
//						errors.put("id", "Id必須是整數");
//					}
//				}
				
//				double price = 0;
//				if(temp2!=null && temp2.length()!=0) {
//					try {
//						price = Double.parseDouble(temp2);
//					} catch (NumberFormatException e) {
//						e.printStackTrace();
//						errors.put("price", "Price必須是數字");
//					}
//				}
//				
				java.util.Date make = null;
				if(temp2!=null && temp3.length()!=0) {
					try {
						make = sdFormat.parse(temp2);
					} catch (ParseException e) {
						e.printStackTrace();
						errors.put("SuggestTime", "必須是時間，並且遵守HH:mm的格式");
					}
				}
						
				if(errors!=null && !errors.isEmpty()) {
					request.getRequestDispatcher(
							"/pages/index.jsp").forward(request, response);
					return;
				}
				
		//呼叫model, 根據Model執行結果呼叫View
//				, bean.getSpotName(),
//				bean.getSuggestTime(),bean.getAddr(),bean.getCoordinate(),
//				bean.getInfo(),bean.getOpentime(),bean.getPrice(),
//				bean.getType(),bean.getPhoto()
				SpotBean bean = new SpotBean();
				
				bean.setSpotName(name);
//				bean.setPrice(price); 
//				bean.setMake(make);
//				bean.setExpire(expire);
				
				if("Select".equals(prodaction)) {
					List<SpotBean> select = spotService.select(bean);
					request.setAttribute("select", select);
					request.getRequestDispatcher(
							"/pages/display.jsp").forward(request, response);
				} else if("Insert".equals(prodaction)) {
					SpotBean insert = spotService.insert(bean);
					if(insert==null) {
						errors.put("action", "Insert失敗");
					} else {
						request.setAttribute("insert", insert);
					}
					request.getRequestDispatcher(
							"/pages/product.jsp").forward(request, response);
				} else if("Update".equals(prodaction)) {
					SpotBean update = spotService.update(bean);
					if(update==null) {
						errors.put("action", "Update失敗");
					} else {
						request.setAttribute("update", update);
					}
					request.getRequestDispatcher(
							"/pages/product.jsp").forward(request, response);
				} else if("Delete".equals(prodaction)) {
					boolean success = spotService.delete(bean);
					if(success) {
						request.setAttribute("delete", 1);
					} else {
						request.setAttribute("delete", 0);
					}
					request.getRequestDispatcher(
							"/pages/product.jsp").forward(request, response);
				} else {
					errors.put("action", "Unknown Action:"+prodaction);
					request.getRequestDispatcher(
							"/pages/product.jsp").forward(request, response);
				}
			}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
