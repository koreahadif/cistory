package nhn.cistory.util;

import java.util.ArrayList;

public class HangulChosungSearch {
    private static final char INITIAL_SOUND_BEGIN_UNICODE = 12593; // 초성 유니코드 시작 값
    private static final char INITIAL_SOUND_LAST_UNICODE = 12622;  // 초성 유니코드 마지막 값
    private static final char HANGUL_BEGIN_UNICODE = 44032;        // 한글 유니코드 시작 값
    private static final char HANGUL_LAST_UNICODE = 55203;         // 한글 유니코드 마지막 값
    private static final char NUMBER_BEGIN_UNICODE = 48;           // 숫자 유니코드 시작 값
    private static final char NUMBER_LAST_UNICODE = 57;            // 숫자 유니코드 마지막 값
    private static final char ENGLISH_ROWER_BEGIN_UNICODE = 65;    // 영문(소문자) 유니코드 시작 값 
    private static final char ENGLISH_ROWER_LAST_UNICODE = 90;     // 영문(소문자) 유니코드 마지막 값
    private static final char ENGLISH_UPPER_BEGIN_UNICODE = 97;    // 영문(대문자) 유니코드 시작 값
    private static final char ENGLISH_UPPER_LAST_UNICODE = 122;    // 영문(대문자) 유니코드 마지막 값
    private static final char HANGUL_BASE_UNIT = 588;              // 자음 마다 가지는 글자수
                                                                   // 초성
    private static final char[] INITIAL_SOUND = 
        {'ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ'
       , 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ'};
 
    /**
     * 입력받은 문자가 초성인지 체크
     */
    private static boolean isInitialSound(char c){
        for(int i=0; i<INITIAL_SOUND.length; i++){ 
            if(INITIAL_SOUND[i] == c){ 
                return true; 
            } 
        } 
        return false; 
    } 
 
    /**
     * 입력받은 문자의 자음을 추출
     */
    private static char getInitialSound(char c){ 
        int hanBegin = (c - HANGUL_BEGIN_UNICODE); 
        int index = hanBegin / HANGUL_BASE_UNIT; 
        return INITIAL_SOUND[index]; 
    } 
     
    /**
     * 입력받은 문자가 한글인지 체크
     */
    private static boolean isHangul(char c){ 
        return HANGUL_BEGIN_UNICODE <= c && c <= HANGUL_LAST_UNICODE; 
    }
     
    /**
    * 숫자, 영문(대소문자), 한글, 초성 등의 유니코드를 체크
    */
    private static boolean checkUnicode(char c){
        if ((   (c >= NUMBER_BEGIN_UNICODE && c <= NUMBER_LAST_UNICODE) 
             || (c >= ENGLISH_UPPER_BEGIN_UNICODE && c <= ENGLISH_UPPER_LAST_UNICODE) 
             || (c >= ENGLISH_ROWER_BEGIN_UNICODE && c <= ENGLISH_ROWER_LAST_UNICODE) 
             || (c >= HANGUL_BEGIN_UNICODE && c <= HANGUL_LAST_UNICODE) 
             || (c >= INITIAL_SOUND_BEGIN_UNICODE && c <= INITIAL_SOUND_LAST_UNICODE))
           ){
            return true;
        }else{
            return false;
        }
    }
 
    /**
	 * 검색어와 검색 대상 값을 입력받아서 일치여부 확인
	 */
	public static boolean matchString(String keyword, String value) {
		int t = 0;
		int seof = value.length() - keyword.length();
		int slen = keyword.length();
		// 검색어가 검색대상값보다 더 길거나, 검색어가 두개 이하일때 false 리턴
		if (seof < 0 || keyword.length() < 1) {
			return false;
		}
		// 숫자, 초성, 한글, 영문(대소문자)를 제외한 다른 값은 false 리턴
		if (!checkUnicode(keyword.charAt(t))) {
			return false;
		}

		// 검색어가 초성이이고 한글이면 초성끼리 비교
		if (isInitialSound(keyword.charAt(t)) && isHangul(value.charAt(t))) {
			// 각각의 초성이 같은지 비교
			if (getInitialSound(value.charAt(t)) == keyword.charAt(t)) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}

    /**
    * 검색키워드 
    */
    public static ArrayList<String> searchItem(String keyword, ArrayList<String> list){
    	ArrayList<String> corrList = new ArrayList<String>();
        // 총 상품의 건수만큼 for 문을 수행 
        for(int i=0; i<list.size(); i++){
            // 키워드와 매칭되는 상품이 존재하면, 상품명과 매출액을 배열에 각각 저장 
            if(matchString(keyword, list.get(i))){
                corrList.add(list.get(i));
            }
        }
        return corrList;
    }
}
