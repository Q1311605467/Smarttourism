package pojo;

import java.io.Serializable;

public class Hotel_room implements Serializable {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column hotel_room.room_id
     *
     * @mbggenerated Fri Jan 08 22:15:00 CST 2021
     */
    private Integer room_id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column hotel_room.hotel_id
     *
     * @mbggenerated Fri Jan 08 22:15:00 CST 2021
     */
    private Integer hotel_id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column hotel_room.room_num
     *
     * @mbggenerated Fri Jan 08 22:15:00 CST 2021
     */
    private String room_num;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column hotel_room.room_type
     *
     * @mbggenerated Fri Jan 08 22:15:00 CST 2021
     */
    private String room_type;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column hotel_room.is_checkin
     *
     * @mbggenerated Fri Jan 08 22:15:00 CST 2021
     */
    private Integer is_checkin;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column hotel_room.cost
     *
     * @mbggenerated Fri Jan 08 22:15:00 CST 2021
     */
    private Float cost;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table hotel_room
     *
     * @mbggenerated Fri Jan 08 22:15:00 CST 2021
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column hotel_room.room_id
     *
     * @return the value of hotel_room.room_id
     *
     * @mbggenerated Fri Jan 08 22:15:00 CST 2021
     */
    public Integer getRoom_id() {
        return room_id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column hotel_room.room_id
     *
     * @param room_id the value for hotel_room.room_id
     *
     * @mbggenerated Fri Jan 08 22:15:00 CST 2021
     */
    public void setRoom_id(Integer room_id) {
        this.room_id = room_id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column hotel_room.hotel_id
     *
     * @return the value of hotel_room.hotel_id
     *
     * @mbggenerated Fri Jan 08 22:15:00 CST 2021
     */
    public Integer getHotel_id() {
        return hotel_id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column hotel_room.hotel_id
     *
     * @param hotel_id the value for hotel_room.hotel_id
     *
     * @mbggenerated Fri Jan 08 22:15:00 CST 2021
     */
    public void setHotel_id(Integer hotel_id) {
        this.hotel_id = hotel_id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column hotel_room.room_num
     *
     * @return the value of hotel_room.room_num
     *
     * @mbggenerated Fri Jan 08 22:15:00 CST 2021
     */
    public String getRoom_num() {
        return room_num;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column hotel_room.room_num
     *
     * @param room_num the value for hotel_room.room_num
     *
     * @mbggenerated Fri Jan 08 22:15:00 CST 2021
     */
    public void setRoom_num(String room_num) {
        this.room_num = room_num == null ? null : room_num.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column hotel_room.room_type
     *
     * @return the value of hotel_room.room_type
     *
     * @mbggenerated Fri Jan 08 22:15:00 CST 2021
     */
    public String getRoom_type() {
        return room_type;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column hotel_room.room_type
     *
     * @param room_type the value for hotel_room.room_type
     *
     * @mbggenerated Fri Jan 08 22:15:00 CST 2021
     */
    public void setRoom_type(String room_type) {
        this.room_type = room_type == null ? null : room_type.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column hotel_room.is_checkin
     *
     * @return the value of hotel_room.is_checkin
     *
     * @mbggenerated Fri Jan 08 22:15:00 CST 2021
     */
    public Integer getIs_checkin() {
        return is_checkin;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column hotel_room.is_checkin
     *
     * @param is_checkin the value for hotel_room.is_checkin
     *
     * @mbggenerated Fri Jan 08 22:15:00 CST 2021
     */
    public void setIs_checkin(Integer is_checkin) {
        this.is_checkin = is_checkin;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column hotel_room.cost
     *
     * @return the value of hotel_room.cost
     *
     * @mbggenerated Fri Jan 08 22:15:00 CST 2021
     */
    public Float getCost() {
        return cost;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column hotel_room.cost
     *
     * @param cost the value for hotel_room.cost
     *
     * @mbggenerated Fri Jan 08 22:15:00 CST 2021
     */
    public void setCost(Float cost) {
        this.cost = cost;
    }
}