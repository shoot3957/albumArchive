//package com.AlbumArchive.frontcontroller;
//
//import java.io.IOException;
//
//import com.AlbumArchive.util.WeatherAPIClient;
//
//import jakarta.servlet.RequestDispatcher;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@WebServlet("/weather")
//public class WeatherServlet extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        WeatherAPIClient weatherApiClient = new WeatherAPIClient();
//        
//        // 날씨 데이터 가져오기
//        String weatherData = weatherApiClient.getWeatherData();  // 날씨 데이터 가져옴
//        
//        // JSON 데이터를 request 속성에 저장
//        request.setAttribute("weatherData", weatherData);
//        
//        // JSP로 전달
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/weather.jsp");
//        dispatcher.forward(request, response);
//    }
//}