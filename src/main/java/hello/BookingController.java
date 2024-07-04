package hello;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BookingController {

    @Autowired
    private BookingService bookingService;

    @PostMapping("/bookings")
    public String submitBookingForm(Booking booking) {
        bookingService.saveBooking(booking);
        return "redirect:/confirmation.html";
    }
}
