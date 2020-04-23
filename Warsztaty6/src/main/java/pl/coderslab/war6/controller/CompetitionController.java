package pl.coderslab.war6.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.war6.model.Competition;
import pl.coderslab.war6.model.Competitor;
import pl.coderslab.war6.model.Event;
import pl.coderslab.war6.model.Start;
import pl.coderslab.war6.repository.*;
import pl.coderslab.war6.util.TimePeriodResolver;
import pl.coderslab.war6.util.ViewHelper;

import java.time.Duration;
import java.time.LocalTime;
import java.util.*;

@Controller
@RequestMapping("competition")
public class CompetitionController {

    private final CompetitionRepository competitionRepository;

    private final EventRepository eventRepository;

    private final StartRepository startRepository;

    private final CompetitorRepository competitorRepository;

    private final ResultRepository resultRepository;

    public CompetitionController(CompetitionRepository competitionRepository, EventRepository eventRepository, StartRepository startRepository, CompetitorRepository competitorRepository, ResultRepository resultRepository) {
        this.competitionRepository = competitionRepository;
        this.eventRepository = eventRepository;
        this.startRepository = startRepository;
        this.competitorRepository = competitorRepository;
        this.resultRepository = resultRepository;
    }

    @GetMapping("/")
    public String findAllCompetitions(Model model) {
        model.addAttribute("allCompetitions", competitionRepository.findAll());
        return "competition/all";
    }

    @GetMapping("add")
    String initAddCompetition(Model model){
        model.addAttribute("competition", new Competition());
        return "competition/addEdit";
    }

    @PostMapping("add")
    String addCompetition(Competition competition){
        competitionRepository.save(competition);
        return "redirect:";
    }

    @GetMapping("remove")
    public String initRemoveCompetition(@RequestParam long toRemoveId, Model model) {
        model.addAttribute("competition", competitionRepository.findById(toRemoveId));
        model.addAttribute("viewHelper", new ViewHelper());
        return "competition/remove";
    }
  @PostMapping("remove")
    public String removeCompetition(@RequestParam long toRemoveId, @ModelAttribute ViewHelper viewHelper) {
        List<Competition> competitions;
        Set<Competition> competitions1;
        if(viewHelper.getOption().equals("confirmed")) {
            List<Event> events = eventRepository.findAllByCompetitionList(competitionRepository.findById(toRemoveId));
            for (Event event : events) {
                competitions = event.getCompetitionList();
                competitions.removeIf(competition -> competition == competitionRepository.findById(toRemoveId));
            }
            List<Competitor> competitorList = competitorRepository.findAllByCompetitionList(competitionRepository.findById(toRemoveId));
            for (Competitor competitor : competitorList) {
                competitions1 = competitor.getCompetitionList();
                competitions1.removeIf(competition1 -> competition1== competitionRepository.findById(toRemoveId));
            }
            competitionRepository.deleteById(toRemoveId);
        }
        return "redirect:";
    }

    @GetMapping("edit")
    public String initEditCompetition(@RequestParam int toEditId, Model model) {
        model.addAttribute("competition", competitionRepository.findById(toEditId));
        return "competition/addEdit";
    }

    @PostMapping("edit")
    public String editCompetition(Competition competition) {

        competitionRepository.save(competition);

        List<Event> events = eventRepository.findAllByCompetitionList(competition);
        for (Event event : events) {
            startRepository.deleteByEventId(event.getId());
            event.getStarts().clear();
            for (Competition competition1 : event.getCompetitionList()) {
                LocalTime localTime = (LocalTime.parse(event.getStartTime()));
                int counter = TimePeriodResolver.counter(event.getStartTime(), event.getEndTime(), competition1.getPeriod());
                for (int i = 0; i < counter; i++) {
                    for (int j = 0; j < competition1.getPersonQuantity(); j++) {

                        Start start = new Start();

                        start.setCompetition(competition1);
                        start.setEvent(event);
                        start.setBegin(localTime.toString());
                        event.getStarts().add(start);
                    }
                    localTime = localTime.plus(Duration.ofMinutes(competition1.getPeriod()));
                }
            }
            eventRepository.update(event);
        }
        return "redirect:";
    }
}
