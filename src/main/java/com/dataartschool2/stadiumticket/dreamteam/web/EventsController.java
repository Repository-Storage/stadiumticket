package com.dataartschool2.stadiumticket.dreamteam.web;


import com.dataartschool2.stadiumticket.dreamteam.domain.Event;
import com.dataartschool2.stadiumticket.dreamteam.domain.NewEventForm;
import com.dataartschool2.stadiumticket.dreamteam.domain.SectorPrice;
import com.dataartschool2.stadiumticket.dreamteam.service.EventService;
import com.dataartschool2.stadiumticket.dreamteam.service.SectorPriceService;
import com.dataartschool2.stadiumticket.dreamteam.service.SectorService;
import com.dataartschool2.stadiumticket.dreamteam.web.validator.NewEventValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

@Controller
public class EventsController{

	@Autowired
	private EventService eventService;
	
	@Autowired
	private SectorService sectorService;
	
	@Autowired
	private SectorPriceService sectorPriceService;

    @Autowired
    private NewEventValidator newEventValidator;

    @InitBinder("newEventForm")
    public void bindNewEventFormValidator(WebDataBinder webDataBinder){
        webDataBinder.setValidator(newEventValidator);
    }

    @ModelAttribute("newEventForm")
    public NewEventForm getNewEventForm(){
        return new NewEventForm();
    }

    @ModelAttribute("editEvent")
    public Event getEditEvent(@RequestParam(value = "id", required = false) Integer id){
        if(id != null) {

            Event event = eventService.findById(id);
            if (event != null) {
                return event;
            }
        }
        return null;
    }

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Map<String, Object> map) {
		return "redirect:/index";
	}
	
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String getActiveEvents(ModelMap map) {
    	
    	List<Event> allEvents = eventService.getFutureEvents();
    	map.put("events", allEvents);
		   	
        return "/index";
    }
	
    @RequestMapping(value = "/past_events", method = RequestMethod.GET)
    public String getArchiveEvents(ModelMap map) {
    	
    	List<Event> allEvents = eventService.getPastEvents();
    	map.put("events", allEvents);
		   	
        return "/past_events";
    }
    

    @RequestMapping(value = "/new_event", method = RequestMethod.GET)
    public String new_event() {
        return "new_event";
    }
	
	@RequestMapping(value="/new_event", method = RequestMethod.POST)
    public String submit_new_event(@ModelAttribute("submit") String submit,
                                   @Valid @ModelAttribute("newEventForm") NewEventForm newEventForm,
                                   BindingResult bindingResult,
                                   ModelMap modelMap) throws ParseException {
        System.out.println("POST");
        modelMap.clear();
        if(bindingResult.hasErrors()){
            System.out.println("POST1");
            modelMap.put("result", bindingResult);
            return "new_event";
        }else{
            System.out.println("POST2");
            if (submit.equals("Cancel changes")){
                System.out.println("POST3");
                return "redirect:/new_event";
            }else{
                System.out.println("Creating");
                eventService.createEvent(newEventForm);
                return "redirect:/new_event";
            }
        }
	}



    @RequestMapping(value = "/edit_event", method = RequestMethod.POST)
    public String submit_edit_event(@ModelAttribute("submit") String submit,
                                    @Valid @ModelAttribute("editEvent") Event event,
                                    BindingResult bindingResult,
                                    ModelMap modelMap) throws ParseException {

        if(bindingResult.hasErrors()){
            System.out.println("Errors");
            modelMap.put("result", bindingResult);
            return "edit_event";
        }else{
            if (submit.equals("Cancel changes")){
                System.out.println("Cancel");
                return "redirect:/edit_event?id="+event.getId();
            }
                System.out.println(event.getEventDate());
                for(SectorPrice sectorPrice : event.getSectorPriceSet()){
                    System.out.println(sectorPrice.getPrice());
                }
                eventService.updateEvent(event);
                return "redirect:/index";
        }

    }



    @RequestMapping(value = "/edit_event" ,method = RequestMethod.GET)
	public String edit_event() {
        return "edit_event";
	}
	
	@RequestMapping(value="/delete_event")
    public String submit_delete_event(@ModelAttribute("editEvent") Event event, ModelMap modelMap) {
        eventService.markAsDeleted(event);
		return "redirect:/index";
	}
}
