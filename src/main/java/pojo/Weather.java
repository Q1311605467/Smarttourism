package pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Weather {
    private int weather_location;
    private String weather_condition;
    private float temperature;
    private Date time;

    public int getWeather_location() {
        return weather_location;
    }

    public void setWeather_location(int weather_location) {
        this.weather_location = weather_location;
    }

    public String getWeather_condition() {
        return weather_condition;
    }

    public void setWeather_condition(String weather_condition) {
        this.weather_condition = weather_condition;
    }

    public float getTemperature() {
        return temperature;
    }

    public void setTemperature(float temperature) {
        this.temperature = temperature;
    }

    public String getTime() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = formatter.format(this.time);
        return formattedDate;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
