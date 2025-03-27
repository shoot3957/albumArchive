package com.AlbumArchive.controller.album;

import java.io.IOException;
import java.util.List;

import com.AlbumArchive.DAO.AlbumDAO;
import com.AlbumArchive.VO.AlbumVO;
import com.AlbumArchive.VO.WeatherVO;
import com.AlbumArchive.frontcontroller.Controller;
import com.AlbumArchive.util.WeatherAPIClient;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WeatherController implements Controller {

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        WeatherVO weather = WeatherAPIClient.getParsedWeatherData();
        if (weather == null) {
            request.setAttribute("errorMsg", "날씨 정보를 불러올 수 없습니다.");
            return "weather/weather"; // 에러 페이지 또는 안내 메시지 포함 가능
        }

        String mood = WeatherAPIClient.determineMood(weather);
        List<AlbumVO> albumList = AlbumDAO.getInstance().getAlbumsByMood(mood);

        request.setAttribute("weatherVO", weather);
        request.setAttribute("mood", mood);
        request.setAttribute("albumList", albumList);

        return "album/weather"; // /WEB-INF/views/weather/weather.jsp
    }
}
