package com.AlbumArchive.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;

import com.AlbumArchive.VO.WeatherVO;

public class WeatherAPIClient {

    // 기상청 API로부터 날씨 데이터를 가져오는 메서드
    public static JSONObject getWeatherData() throws IOException {
        String apiKey = "%2BEE7ib1mSb9LPhCkQoa4jIJL0SNvvhC5K3zVqiibRD%2F%2FyPrAPTOAyTkIBme8kY17ghgXM0xwgUoHpSed9Ar91Q%3D%3D"; // 실제 API 키
        String[] dateTime = getBaseDateTime();
        String baseDate = dateTime[0];  // 예: 20250327
        String baseTime = dateTime[1];  // 예: 1130
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst");
        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + apiKey); 
        urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("dataType", "UTF-8") + "=" + URLEncoder.encode("XML", "UTF-8"));  // XML로 요청
        urlBuilder.append("&" + URLEncoder.encode("base_date", "UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("base_time", "UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("nx", "UTF-8") + "=" + URLEncoder.encode("55", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("ny", "UTF-8") + "=" + URLEncoder.encode("127", "UTF-8"));

        // HTTP 연결 설정
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/xml");  // XML 요청

        // 응답 코드 확인
        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        // 응답 내용 읽기
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();

        // 응답 내용 출력 (디버깅용)
        System.out.println("API 응답: " + sb.toString());

        // XML 형식 응답을 JSON 형식으로 변환
        try {
            // XML 응답을 JSON으로 변환
            String xmlResponse = sb.toString();
            JSONObject jsonResponse = XML.toJSONObject(xmlResponse);  // XML을 JSON으로 변환
            System.out.println(jsonResponse);
            return jsonResponse;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static WeatherVO getParsedWeatherData() throws IOException {
        JSONObject json = getWeatherData();
        if (json == null) return null;

        try {
            JSONObject response = json.getJSONObject("response");
            JSONObject body = response.getJSONObject("body");
            JSONObject items = body.getJSONObject("items");
            JSONArray itemArray = items.getJSONArray("item");

            String temperature = "";
            String humidity = "";
            String rainfallType = "";
            String rainfallAmount = "";

            for (int i = 0; i < itemArray.length(); i++) {
                JSONObject item = itemArray.getJSONObject(i);
                String category = item.getString("category");
                String obsrValue = item.get("obsrValue").toString();


                switch (category) {
                    case "T1H": // 기온
                        temperature = obsrValue;
                        break;
                    case "REH": // 습도
                        humidity = obsrValue;
                        break;
                    case "PTY": // 강수형태
                        rainfallType = parseRainType(obsrValue);
                        break;
                    case "RN1": // 1시간 강수량
                        rainfallAmount = obsrValue;
                        break;
                }
            }

            return new WeatherVO(temperature, humidity, rainfallType, rainfallAmount);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 강수 형태 숫자를 설명 문자열로 변환
    private static String parseRainType(String code) {
        switch (code) {
            case "0": return "없음";
            case "1": return "비";
            case "2": return "비/눈";
            case "3": return "눈";
            case "5": return "빗방울";
            case "6": return "빗방울/눈날림";
            case "7": return "눈날림";
            default: return "알 수 없음";
        }
    }
    
    public static String[] getBaseDateTime() {
        LocalDateTime now = LocalDateTime.now();

        // 30분 단위로 내림
        int minute = now.getMinute();
        if (minute < 30) {
            now = now.minusHours(1).withMinute(30);
        } else {
            now = now.withMinute(30);
        }

        // 날짜와 시간 포맷
        String baseDate = now.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        String baseTime = now.format(DateTimeFormatter.ofPattern("HHmm"));

        return new String[] { baseDate, baseTime };
    }
    
    public static String determineMood(WeatherVO weather) {
        try {
            double temp = Double.parseDouble(weather.getTemperature());
            String rainType = weather.getRainfallType();

            if (rainType.equals("비") || rainType.equals("비/눈") || rainType.equals("빗방울") || rainType.equals("빗방울/눈날림")) {
                return "rainy";
            } else if (rainType.equals("눈") || rainType.equals("눈날림")) {
                return "snowy";
            } else if (temp >= 28.0) {
                return "hot";
            } else if (temp <= 5.0) {
                return "cold";
            } else {
                return "normal";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "normal";
        }
    }


}

