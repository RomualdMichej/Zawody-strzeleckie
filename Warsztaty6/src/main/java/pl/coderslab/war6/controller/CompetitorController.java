package pl.coderslab.war6.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.war6.model.Competition;
import pl.coderslab.war6.model.Competitor;
import pl.coderslab.war6.model.Event;
import pl.coderslab.war6.model.Start;
import pl.coderslab.war6.repository.CompetitionRepository;
import pl.coderslab.war6.repository.CompetitorRepository;
import pl.coderslab.war6.repository.EventRepository;
import pl.coderslab.war6.repository.StartRepository;
import pl.coderslab.war6.util.ViewHelper;

import java.util.*;

@Controller
@RequestMapping("competitor")
public class CompetitorController {

    private final CompetitorRepository competitorRepository;

    private final CompetitionRepository competitionRepository;

    private final StartRepository startRepository;

    private final EventRepository eventRepository;

    public CompetitorController(CompetitorRepository competitorRepository, CompetitionRepository competitionRepository, StartRepository startRepository, EventRepository eventRepository) {
        this.competitorRepository = competitorRepository;
        this.competitionRepository = competitionRepository;
        this.startRepository = startRepository;
        this.eventRepository = eventRepository;
    }

    @ModelAttribute("allStarts")
    public List<Start> allStarts() {
        return startRepository.findAll();
    }

    @ModelAttribute("allEvents")
    public List<Event> allEvents() {
        return eventRepository.findAll();
    }

    @GetMapping("/")
    public String findAllCompetitors(Model model) {
        model.addAttribute("allCompetitors", competitorRepository.findAll());
        return "competitor/all";
    }

    @GetMapping("add")
    String initAddCompetitor(Model model){
        model.addAttribute("competitor", new Competitor());
        return "competitor/addEdit";
    }

    @PostMapping("add")
    String addCompetitor(Competitor competitor){
        competitorRepository.save(competitor);
        return "redirect:";
    }

    @GetMapping("remove")
    public String initRemoveCompetitor(@RequestParam long toRemoveId, Model model) {
        model.addAttribute("competitor", competitorRepository.findById(toRemoveId));
        model.addAttribute("viewHelper", new ViewHelper());
        return "competitor/remove";
    }

    @PostMapping("remove")
    public String removeCompetitor(@RequestParam long toRemoveId, @ModelAttribute ViewHelper viewHelper) {
        if(viewHelper.getOption().equals("confirmed")) {
            startRepository.updateToNull(competitorRepository.findById(toRemoveId));
            competitorRepository.deleteById(toRemoveId);
        }
        return "redirect:";
    }

    @GetMapping("edit")
    public String initEditCompetitor(@RequestParam int toEditId, Model model) {
        model.addAttribute("competitor", competitorRepository.findById(toEditId));
        return "competitor/addEdit";
    }

    @PostMapping("edit")
    public String editCompetitor(Competitor competitor) {

        Set<Competition> competitionList = competitor.getCompetitionList();
        List<Start> startList = competitor.getStarts();
            try {
                for (Start start : startList) {
                    competitionList.add(start.getCompetition());
                    start.setCompetitor(competitor);
                }
            } catch (NullPointerException ignored) {}
        competitorRepository.save(competitor);
        return "redirect:";
    }

    @GetMapping("addStarts")
    public String initAddStarts(@RequestParam long toAddStarCompetitortId, Model model) {
        model.addAttribute("competitor", competitorRepository.findById(toAddStarCompetitortId));

        model.addAttribute("startList", competitorRepository.findById(toAddStarCompetitortId).getStarts());
        return "competitor/addEvents";
    }

    @PostMapping("addStarts")
    public String AddStarts(@RequestParam long competitorId, @RequestParam long eventId, Model model) {

        Event event = eventRepository.findById(eventId);
        List<Competition> competitionList = event.getCompetitionList();
        model.addAttribute("competitor", competitorRepository.findById(competitorId));
        List<List<Start>> superList = new ArrayList<>();
        for (Competition competition : competitionList) {

            List<Start> startList = competition.getStartList();
            startList.removeIf(start -> !start.getEvent().getId().equals(event.getId()));
            startList.removeIf(start -> start.getCompetitor() != null);

            superList.add(startList);
        }

        model.addAttribute("superList", superList);
        return "competitor/addStarts";
    }

    @GetMapping("reduce")
    public String initReduce(@RequestParam long toReduceStartId, @RequestParam long competitorId, Model model) {
        model.addAttribute("start", startRepository.findStartById(toReduceStartId));
        model.addAttribute("competitor", competitorRepository.findById(competitorId));
        model.addAttribute("viewHelper", new ViewHelper());
        return "competitor/startReduceQuery";
    }

    @PostMapping("reduce")
    public String reduce(@RequestParam long toReduceStartId, @RequestParam long competitorId, @ModelAttribute ViewHelper viewHelper) {
        if(viewHelper.getOption().equals("confirmed")) {
            Competitor competitor = competitorRepository.findById(competitorId);
            List<Start> startList = competitor.getStarts();
            startList.removeIf(start -> start.getId() == toReduceStartId);
            competitor.setStarts(startList);
            startRepository.mergeToNull(toReduceStartId);
            competitor.setCompetitionList(null);
            Set<Competition> competitionList = new HashSet<>();
                for (Start start : startList) {
                    competitionList.add(start.getCompetition());
                }
                competitor.setCompetitionList(competitionList);
            competitorRepository.save(competitor);
        }
        return "redirect:";
    }
}
