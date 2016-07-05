package nhn.cistory.util;

import java.util.ArrayList;
import java.util.HashMap;

import nhn.cistory.vo.Qobtr;

public class CalcScore {

	public CalcScore(){}
	
	public int calculate(ArrayList<Qobtr> list){
		int score = 0;
		Qobtr qt = null;
		for(int i = 0 ; i < list.size() ; i ++){
			qt = new Qobtr();
			qt = list.get(i);
			if(qt.getUser_sol()== qt.getOb_sol()){
				score += qt.getPoint();
			}
		}
		return score;
	}
	
	public ArrayList<Integer> wrongList(ArrayList<Qobtr> list) {
		ArrayList<Integer> wrongList = new ArrayList<Integer>();
		Qobtr qt = null;
		for(int i = 0 ; i < list.size() ; i ++){
			qt = new Qobtr();
			qt = list.get(i);
			System.out.println("내가푼답"+qt.getUser_sol());
			System.out.println("정답"+qt.getOb_sol());
			if(qt.getUser_sol()!= qt.getOb_sol()){
				wrongList.add(qt.getQ_num());
			}
		}
		return wrongList;

	}

	public HashMap<String, Integer> wrongType(ArrayList<Qobtr> userList) {
		// TODO Auto-generated method stub
		return null;
	}
}
