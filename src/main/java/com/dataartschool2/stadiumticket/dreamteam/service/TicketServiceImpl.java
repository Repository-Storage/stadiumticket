package com.dataartschool2.stadiumticket.dreamteam.service;


import com.dataartschool2.stadiumticket.dreamteam.dao.TicketDAO;
import com.dataartschool2.stadiumticket.dreamteam.domain.Booking;
import com.dataartschool2.stadiumticket.dreamteam.domain.BookingStatus;
import com.dataartschool2.stadiumticket.dreamteam.domain.Customer;
import com.dataartschool2.stadiumticket.dreamteam.domain.Event;
import com.dataartschool2.stadiumticket.dreamteam.domain.Seat;
import com.dataartschool2.stadiumticket.dreamteam.domain.SeatStatus;
import com.dataartschool2.stadiumticket.dreamteam.domain.Sector;
import com.dataartschool2.stadiumticket.dreamteam.domain.Ticket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
@Component
public class TicketServiceImpl implements TicketService {

    @Autowired
    private TicketDAO ticketDAO;
    
    @Autowired
    private BookingService bookingService;
    
    @Override
    public List<Ticket> getSoldTicketsBySector(Integer eventId, Integer sectorId) {
        List<Ticket> tickets = ticketDAO.findAll();

        List<Ticket> result = new ArrayList<Ticket>();

        for(Ticket ticket : tickets){
            Event event = ticket.getEvent();
            Seat seat = ticket.getSeat();
            Sector sector = seat.getSector();

            if(event.getId().equals(eventId) && sector.getId().equals(sectorId)){
                result.add(ticket);
            }
        }

        return result;
    }
    
    @Override
    public List<Ticket> getAllTickets(Integer eventId) {
        List<Ticket> tickets = ticketDAO.findAll();

        List<Ticket> result = new ArrayList<Ticket>();

        for(Ticket ticket : tickets){
            Event event = ticket.getEvent();
            Seat seat = ticket.getSeat();
            Sector sector = seat.getSector();

            if(event.getId().equals(eventId)){
                result.add(ticket);
            }
        }

        return result;
    }
    
    @Override
    public void sellTickets(Event event, List<Seat> chosenSeats) {
        for(Seat seat : chosenSeats){
            Ticket ticket = new Ticket();
            ticket.setEvent(event);
            ticket.setSeat(seat);
            String ticketNumber = generateTicketNumber(event, seat);
            ticket.setTicketNumber(ticketNumber);
            ticketDAO.updateEntity(ticket);
        }
    }
    
    

    private String generateTicketNumber(Event event, Seat seat) {
        return Integer.toString(Objects.hash(event, seat));
    }

    public void checkTickets(List<Ticket> ticketSet, Ticket ticket){
    	if (ticketSet.contains(ticket)&&(!ticket.getSeatStatus().equals(SeatStatus.Free))){
      	    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:/spring/root-context.xml");
        	throw new RuntimeException(applicationContext.getMessage("error.ticketExist", new Object[]{}, null));
    	}
    }
    
	@Override
    public void bookTickets(Event event, Customer customer, List<Seat> chosenSeats){       
		List<Ticket> AllTickets = getAllTickets(event.getId());
		List<Ticket> tickets =  new ArrayList<Ticket>();
		for(Seat seat : chosenSeats){	      
	            Ticket ticket = new Ticket();
	            ticket.setEvent(event);
	            ticket.setSeat(seat);
	            String ticketNumber = generateTicketNumber(event, seat);	            
	            ticket.setTicketNumber(ticketNumber);
	            checkTickets(AllTickets, ticket);
	            ticket.setSeatStatus(SeatStatus.Free);
	            tickets.add(ticket);
		}	  
		for(Ticket ticket : tickets){
		   Booking booking = new  Booking(0, customer, ticket, BookingStatus.Booked);
		   ticket.setSeatStatus(SeatStatus.Booked);
		   ticketDAO.updateEntity(ticket);
		   bookingService.updateBooking(booking);
		}
	      
	}
}
