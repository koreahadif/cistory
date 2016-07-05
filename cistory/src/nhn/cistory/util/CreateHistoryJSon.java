package nhn.cistory.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import nhn.cistory.vo.History;

public class CreateHistoryJSon {
	public CreateHistoryJSon(){}
	
	public JSON getJson(ArrayList<History> myList) throws Exception{
		JSONArray jsonArray = new JSONArray();
		/*            {
                "startDate":"2011,12,12",
				"endDate":"2012,1,27",
                "headline":"Vine",
                "text":"<p>Vine Test</p>",
                "asset":
                {
                    "media":"https://vine.co/v/b55LOA1dgJU",
                    "credit":"",
                    "caption":""
                }
            },*/
		
		for(int i = 0 ;i < myList.size() ; i++){
			History htr = myList.get(i);
			
			//DATE PARSE
			SimpleDateFormat pformat = new SimpleDateFormat("yyyy-MM-dd");
			Date stime = null;
			stime = pformat.parse(htr.getHtr_date());
			SimpleDateFormat format = new SimpleDateFormat("yyyy,M,dd");
			String date = format.format(stime);
			//데이터 입력JSON
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("startDate",date);
			jsonObj.put("endDate", date);
			jsonObj.put("headline",htr.getHtr_keyrd());
			jsonObj.put("text", htr.getHtr_desc()+"<p class='hide num'>"+htr.getHtr_num()+"</p>");
			JSONObject tmpObj = new JSONObject();
			tmpObj.put("media", "h_img/"+htr.getHtr_imguri());
			jsonObj.put("asset", tmpObj);
			jsonArray.add(jsonObj);
		}
		return jsonArray;
	}
}
