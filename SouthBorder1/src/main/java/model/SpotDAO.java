package model;

import java.util.List;

public interface SpotDAO {

	SpotBean select(int spotID);

	List<SpotBean> select();

	SpotBean insert(SpotBean bean);

	SpotBean update(String spotName, String suggestTime, String addr, String coordinate, String Info, String opentime,
			double price, String type, String photo, int spotID);

	boolean delete(int id);

	SpotBean update(int spotID, String spotName, String suggestTime, String addr, String coordinate, String Info,
			String opentime, float price, String type, String photo);

}