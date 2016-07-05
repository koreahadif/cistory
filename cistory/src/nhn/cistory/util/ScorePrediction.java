package nhn.cistory.util;

import java.util.ArrayList;
import java.util.HashMap;

public class ScorePrediction {
	private static final double alpha = 0.1;	
	public ScorePrediction(){}
	
	public static int predictScore(ArrayList<HashMap<String,Integer>> list){
		ArrayList<Integer> scoreList  = new ArrayList<Integer>();
		int scoreSum =0;
		double scoreAvg = 0.0;
		double preScore = 0.0;
		for(int i = 0 ; i < list.size(); i ++){
			HashMap<String,Integer> map = list.get(i);
			scoreList.add(countScore(map));
		}
		if(scoreList.size()!=0){
			for(int i = 0 ;i <scoreList.size();i++){
				scoreSum += scoreList.get(i);
			}
			scoreAvg = (double)scoreSum/scoreList.size();
			preScore = scoreAvg;
			for(int i = 0 ;i<scoreList.size();i++){
				preScore = (scoreList.get(i)*alpha)+(preScore*(1-alpha));
			}
		}
		else
			return scoreSum;
		System.out.println(preScore);
		return (int)preScore;
	}
	public static int countScore(HashMap<String,Integer> map){
		int co1 = map.get("corrOne");
		System.out.println(co1);
		int co2 = map.get("corrTwo")*2;
		System.out.println(co2);
		int co3 = map.get("corrThree")*3;
		System.out.println(co3);
		int score = co1 + co2+ co3;
		System.out.println(score);
		return score;
	}
}
