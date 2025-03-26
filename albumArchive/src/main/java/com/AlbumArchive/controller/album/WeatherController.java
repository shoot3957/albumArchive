package com.AlbumArchive.controller.album;

import com.AlbumArchive.util.WeatherAPIClient;
import org.json.JSONObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.AlbumArchive.frontcontroller.Controller;

import java.io.IOException;

public class WeatherController implements Controller {

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 날씨 데이터 가져오기
        JSONObject weatherData = WeatherAPIClient.getWeatherData();

        // 데이터를 JSP에 전달
        if (weatherData != null) {
            request.setAttribute("weatherData", weatherData);
        } else {
            request.setAttribute("error", "날씨 정보를 가져오는 데 실패했습니다.");
        }

        // 날씨 정보를 출력할 JSP 페이지로 리디렉션
        return "weather.jsp";
    }
}