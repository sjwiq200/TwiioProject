package com.twiio.good.web.schedule;

import java.util.List;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.twiio.good.service.domain.Room;
import com.twiio.good.service.domain.RoomUser;
import com.twiio.good.service.domain.Schedule;
import com.twiio.good.service.room.RoomService;
import com.twiio.good.service.schedule.ScheduleService;

@RestController
@RequestMapping("/schedule/*")
public class ScheduleRestController {
	
	@Autowired
	@Qualifier("scheduleServiceImpl")
	private ScheduleService scheduleService;
	
	@Autowired
	@Qualifier("roomServiceImpl")
	private RoomService roomService;

	public ScheduleRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@RequestMapping("/json/addSchedule/")
	public boolean addRoom(@RequestBody Schedule schedule) throws Exception {
		System.out.println("/schedule/json/addSchedule : POST");
		
		String roomKey = schedule.getRoomKey();
		String userNoString = "";
		
		//RoomUser Information
		List<RoomUser> list = roomService.listRoomUser(roomKey);
		
		List<Integer> listUserNo = new Vector<>();
		for (RoomUser roomUser : list) {
			
			listUserNo.add(roomUser.getUserNo());
		}
		//Room Information
		Room room = (Room)roomService.getRoom(roomKey);
		
		for (int i = 0; i < listUserNo.size(); i++) {
			if(listUserNo.size()-1 == i) {
				userNoString += listUserNo.get(i)+"";
			}else {
				userNoString += listUserNo.get(i)+",";
			}
		}
		
		schedule.setUserNo(listUserNo);
		schedule.setCity(room.getCity());
		schedule.setCountry(room.getCountry());
		schedule.setUserNoString(userNoString);
		
		String mapImage = schedule.getMapImg();
		mapImage = mapImage.replaceAll("[(]", "");
		mapImage =mapImage.replaceAll("[)]","");
		mapImage =mapImage.replaceAll(" ","");
		
		String mapImageResult = "https://maps.googleapis.com/maps/api/staticmap";
		mapImageResult += "?center=" + mapImage+ "&size=400x400&zoom=15&maptype=google.maps.MapTypeId.ROADMAP&markers=color:red|" + mapImage;
		
		schedule.setMapImg(mapImageResult);
		System.out.println("schedule mapImageResult" + mapImageResult);
		System.out.println("schedule rest map Image ==>" + schedule);
		scheduleService.addSchedule(schedule);
		
		return true;
	}

}
