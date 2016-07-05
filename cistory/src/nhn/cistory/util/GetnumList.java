package nhn.cistory.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import nhn.cistory.vo.Qobtr;
import nhn.cistory.vo.Question;
import nhn.cistory.vo.Testresult;


public class GetnumList {

	public GetnumList(){
	}
	//일반적인 기출시험 50문제 들고오는 메소드
	public ArrayList<Integer> getNumList(ArrayList<Question> list){
		int countOne=0,countTwo=0,countThree=0;
		int i = 0;
		Collections.shuffle(list);
		ArrayList<Integer> numList = new ArrayList<Integer>();
		while(true){
			if((countOne + countTwo + countThree) == 50)
				break;
			Question qtmp = list.get(i);
			if((countOne <10) && (qtmp.getPoint()==1)){
				countOne++;
				numList.add(qtmp.getQ_num());
			}
			else if((countTwo <30) &&(qtmp.getPoint()==2)){
				countTwo++;
				numList.add(qtmp.getQ_num());
			}
			else if((countThree <10) && (qtmp.getPoint()==3)){
				countThree++;
				numList.add(qtmp.getQ_num());
			}
			i++;
		}
		return numList;
	}
	//전 시험을 참조하여 가져오는 메소드(userList 는 이 전 시험의 test_num 을통해 들고온 QOBTR이 있어야 한다.)
	public ArrayList<Integer> getFitNumList(ArrayList<Question> list,ArrayList<Qobtr> userList){
		ArrayList<Integer> numList = new ArrayList<Integer>();
		int typeOne=0, typeTwo=0, typeThree=0, typeFour=0, typeFive=0, typeSix=0;

		//저번 시험에서 틀린 문제의 type별 문항수를 들고온다.
		CalcScore cs = new CalcScore();
		HashMap<String,Integer> map = cs.wrongType(userList);
		//저번 시험에서 본 Type 별 문항 수 를 구함
		for(int i = 0 ; i < userList.size();i++){
			if(userList.get(i).getQ_type().equals("선사시대")) typeOne++;
			else if(userList.get(i).getQ_type().equals("삼국시대")) typeTwo++;
			else if(userList.get(i).getQ_type().equals("통일신라시대")) typeThree++;
			else if(userList.get(i).getQ_type().equals("고려시대")) typeFour++;
			else if(userList.get(i).getQ_type().equals("조선시대")) typeFive++;
			else typeSix++;
		}
		double one = map.get("선사시대")/typeOne;
		double two = map.get("삼국시대")/typeTwo;
		double three = map.get("통일신라시대")/typeThree;
		double four = map.get("고려시대")/typeFour;
		double five = map.get("조선시대")/typeFive;
		double six = map.get("근대")/typeSix;
		//순서를 구한다.
		return numList;
	}
}
