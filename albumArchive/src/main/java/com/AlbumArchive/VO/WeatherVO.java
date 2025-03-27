package com.AlbumArchive.VO;

public class WeatherVO {
    private String temperature;  // 온도
    private String humidity;     // 습도
    private String rainfallType; // 강수형태
    private String rainfallAmount; // 강수량

    // 기본 생성자
    public WeatherVO() {}

    // 모든 필드를 받는 생성자
    public WeatherVO(String temperature, String humidity, String rainfallType, String rainfallAmount) {
        this.temperature = temperature;
        this.humidity = humidity;
        this.rainfallType = rainfallType;
        this.rainfallAmount = rainfallAmount;
    }

    // Getter & Setter
    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature;
    }

    public String getHumidity() {
        return humidity;
    }

    public void setHumidity(String humidity) {
        this.humidity = humidity;
    }

    public String getRainfallType() {
        return rainfallType;
    }

    public void setRainfallType(String rainfallType) {
        this.rainfallType = rainfallType;
    }

    public String getRainfallAmount() {
        return rainfallAmount;
    }

    public void setRainfallAmount(String rainfallAmount) {
        this.rainfallAmount = rainfallAmount;
    }

    @Override
    public String toString() {
        return "WeatherVO [temperature=" + temperature + ", humidity=" + humidity + ", rainfallType=" + rainfallType
                + ", rainfallAmount=" + rainfallAmount + "]";
    }
}
