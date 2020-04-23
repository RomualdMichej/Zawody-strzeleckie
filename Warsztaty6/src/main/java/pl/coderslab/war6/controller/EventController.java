package pl.coderslab.war6.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.war6.model.Competition;
import pl.coderslab.war6.model.Event;
import pl.coderslab.war6.model.Start;
import pl.coderslab.war6.repository.CompetitionRepository;
import pl.coderslab.war6.repository.CompetitorRepository;
import pl.coderslab.war6.repository.EventRepository;
import pl.coderslab.war6.repository.StartRepository;
import pl.coderslab.war6.util.TimePeriodResolver;
import pl.coderslab.war6.util.ViewHelper;

import java.time.Duration;
import java.time.LocalTime;
import java.util.List;
import java.util.ListIterator;

@Controller
@RequestMapping("/event")
public class EventController {

    private EventRepository eventRepository;

    private CompetitionRepository competitionRepository;

    private final StartRepository startRepository;

    private final CompetitorRepository competitorRepository;

    public EventController(EventRepository eventRepository, CompetitionRepository competitionRepository, StartRepository startRepository, CompetitorRepository competitorRepository) {
        this.eventRepository = eventRepository;
        this.competitionRepository = competitionRepository;
        this.startRepository = startRepository;
        this.competitorRepository = competitorRepository;
    }

    @ModelAttribute("allCompetitions")
    public List<Competition> allCompetitions() {
        return competitionRepository.findAll();
    }

    @GetMapping("/")
    public String findAllEvents(Model model) {
        model.addAttribute("allEvents", eventRepository.findAll());
        return "event/all";
    }

    @GetMapping("add")
    String initAddEvet(Model model){
        model.addAttribute("event", new Event());
        return "event/addEdit";
    }

    @PostMapping("add")
    String addEvent(Event event){


        for (Competition competition : event.getCompetitionList()) {
            LocalTime localTime = (LocalTime.parse(event.getStartTime()));
            int counter = TimePeriodResolver.counter(event.getStartTime(), event.getEndTime(), competition.getPeriod());
            for (int i = 0; i < counter; i++) {
                for (int j = 0; j < competition.getPersonQuantity(); j++) {

                    Start start = new Start();

                    start.setCompetition(competition);
                    start.setEvent(event);
                    start.setBegin(localTime.toString());
                    event.getStarts().add(start);
                }
                localTime = localTime.plus(Duration.ofMinutes(competition.getPeriod()));
            }
        }
        eventRepository.save(event);
        return "redirect:";
    }

    @GetMapping("remove")
    public String initRemoveEvent(@RequestParam long toRemoveId, Model model) {
        model.addAttribute("event", eventRepository.findById(toRemoveId));
        model.addAttribute("viewHelper", new ViewHelper());
        return "event/remove";
    }

    @PostMapping("remove")
    public String removeEvent(@RequestParam long toRemoveId, @ModelAttribute ViewHelper viewHelper) {
        if(viewHelper.getOption().equals("confirmed")) {
            eventRepository.deleteById(toRemoveId);
        }
        return "redirect:";
    }

    @GetMapping("edit")
    public String initEditEvent(@RequestParam int toEditId, Model model) {
        model.addAttribute("event", eventRepository.findById(toEditId));
        return "event/addEdit";
    }

    @PostMapping("edit")
    public String editEvent(Event event) {

        startRepository.deleteByEventId(event.getId());

        event.getStarts().clear();

        for (Competition competition : event.getCompetitionList()) {
            LocalTime localTime = (LocalTime.parse(event.getStartTime()));
            int counter = TimePeriodResolver.counter(event.getStartTime(), event.getEndTime(), competition.getPeriod());
            for (int i = 0; i < counter; i++) {
                for (int j = 0; j < competition.getPersonQuantity(); j++) {

                    Start start = new Start();

                    start.setCompetition(competition);
                    start.setEvent(event);
                    start.setBegin(localTime.toString());
                    event.getStarts().add(start);
                }
                localTime = localTime.plus(Duration.ofMinutes(competition.getPeriod()));
            }
        }
        eventRepository.update(event);


        return "redirect:";
    }

//    @GetMapping("addStarts")
//    public String initAddStarts(@RequestParam long competitionId, @RequestParam long eventId,
//                                Model model) {
//        List<Start> startList = startRepository.findByEventId(eventId);
//        ListIterator<Start> iterator = startList.listIterator();
//        while (iterator.hasNext()) {
//            if (iterator.next().getCompetition().getId() != competitionId) {
//                iterator.remove();
//            }
//        }
//        model.addAttribute("startList", startList);
//        model.addAttribute("allCompetitors", competitionRepository.findAll());
//        return "starts/addStarts";
//    }
}
