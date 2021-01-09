package pojo;

public class Scenery_Reservation {
    private int scen_reserv_id;
    private int scenery_id;
    private int area_id;
    private int user_id;
    private String scenery_name;
    private String date;
    private int reserv_num;
    private int tel;
    private int is_cancel;
    private float total_cost_s;

    public int getScen_reserv_id() {
        return scen_reserv_id;
    }

    public void setScen_reserv_id(int scen_reserv_id) {
        this.scen_reserv_id = scen_reserv_id;
    }

    public int getScenery_id() {
        return scenery_id;
    }

    public void setScenery_id(int scenery_id) {
        this.scenery_id = scenery_id;
    }

    public int getArea_id() {
        return area_id;
    }

    public void setArea_id(int area_id) {
        this.area_id = area_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getScenery_name() {
        return scenery_name;
    }

    public void setScenery_name(String scenery_name) {
        this.scenery_name = scenery_name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getReserv_num() {
        return reserv_num;
    }

    public void setReserv_num(int reserv_num) {
        this.reserv_num = reserv_num;
    }

    public int getTel() {
        return tel;
    }

    public void setTel(int tel) {
        this.tel = tel;
    }

    public int getIs_cancel() {
        return is_cancel;
    }

    public void setIs_cancel(int is_cancel) {
        this.is_cancel = is_cancel;
    }

    public float getTotal_cost_s() {
        return total_cost_s;
    }

    public void setTotal_cost_s(float total_cost_s) {
        this.total_cost_s = total_cost_s;
    }
}