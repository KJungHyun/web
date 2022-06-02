<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
    List<String> ids = new ArrayList<String>();
    List<String> winIds = new ArrayList<String>();
    Random rn = new Random();
    int cnt=0;
    int bookCnt=3;
    
    ids.add("일");
    ids.add("이");
    ids.add("삼");
    ids.add("사");
    ids.add("오");
    ids.add("육");
    ids.add("칠");
    ids.add("팔");
    ids.add("구");
    ids.add("십");
    

    System.out.println("시작");
    System.out.println(ids);
    for(int i=0; i < bookCnt; i++){
        String winId = ids.get(rn.nextInt(ids.size()));
        for(int j=0; j < ids.size(); j++){
            if(ids.get(j).equals(winId)){
                cnt++;
            }
        }
        for(int j=0; j < cnt; j++){
            ids.remove(winId);
        }
        winIds.add(winId);
    }
    System.out.println(ids);
    System.out.println(winIds);
    
%>