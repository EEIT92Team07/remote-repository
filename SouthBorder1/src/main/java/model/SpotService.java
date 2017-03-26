package model;

import java.util.ArrayList;
import java.util.List;

import model.dao.SpotDAOJdbc;

import java.util.ArrayList;

public class SpotService {
	private SpotDAO spotDao = new SpotDAOJdbc();
	public List<SpotBean> select(SpotBean bean) {
		List<SpotBean> result = null;
		if(bean!=null && bean.getSpotID()!=0) {
			SpotBean temp = spotDao.select(bean.getSpotID());
			if(temp!=null) {
				result = new ArrayList<SpotBean>();
				result.add(temp);
			}
		} else {
			result = spotDao.select(); 
		}
		return result;
	}
	public SpotBean insert(SpotBean bean) {
		SpotBean result = null;
		if(bean!=null) {
			result = spotDao.insert(bean);
		}
		return result;
	}
	public SpotBean update(SpotBean bean) {
		SpotBean result = null;
		if(bean!=null) {
			result = spotDao.update(bean.getSpotID(), bean.getSpotName(),
					bean.getSuggestTime(),bean.getAddr(),bean.getCoordinate(),
					bean.getInfo(),bean.getOpentime(),bean.getPrice(),
					bean.getType(),bean.getPhoto());
		}
		return result;
	}
	public boolean delete(SpotBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = spotDao.delete(bean.getSpotID());
		}
		return result;
	}
}
