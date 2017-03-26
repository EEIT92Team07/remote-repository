package model;

import java.util.ArrayList;
import java.util.List;

import model.dao.TestDAOJdbc;

public class TestService {
	private TestDAO testDao = new TestDAOJdbc();
	public List<TestBean> select (TestBean bean) {
		List<TestBean> result = null;
		if(bean!=null  ) {
			TestBean temp = testDao.select(bean.getName());
			if(temp!=null) {
				result = new ArrayList<TestBean>();
				result.add(temp);
			}
		}
		return result;
	}
}
