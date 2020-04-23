package pl.coderslab.war6.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.war6.model.*;
import pl.coderslab.war6.repository.CompetitionRepository;
import pl.coderslab.war6.repository.CompetitorRepository;
import pl.coderslab.war6.repository.EventRepository;
import pl.coderslab.war6.repository.ResultRepository;
import pl.coderslab.war6.util.ViewHelper;

import java.util.*;

@Controller
@RequestMapping("result")
public class ResultController {

    private final ResultRepository resultRepository;

    private final EventRepository eventRepository;

    private final CompetitorRepository competitorRepository;

    private final CompetitionRepository competitionRepository;

    public ResultController(ResultRepository resultRepository, EventRepository eventRepository, CompetitorRepository competitorRepository, CompetitionRepository competitionRepository) {
        this.resultRepository = resultRepository;
        this.eventRepository = eventRepository;
        this.competitorRepository = competitorRepository;
        this.competitionRepository = competitionRepository;
    }

    @ModelAttribute("allEvents")
    public List<Event> allEvents() {
        return eventRepository.findAll();
    }

    @ModelAttribute("allCompetitors")
    public List<Competitor> allCompetitors() {
        return competitorRepository.findAll();
    }

    @GetMapping("addEvent")
    public String initaddEvent(Model model) {
        model.addAttribute("competitorList", competitorRepository.findAll());
        return "result/addCompetitor";
    }

    @PostMapping("addEvent")
    String addEvent(@RequestParam("competitorId") long competitorId, Model model){

        Competitor competitor = competitorRepository.findById(competitorId);
        List<Start> startList = competitor.getStarts();
        Set<Event> eventSet = new HashSet<>();
        for (Start start : startList) {
            eventSet.add(start.getEvent());
        }
        model.addAttribute("competitorId", competitorId);
        model.addAttribute("eventList", eventSet);

        return "result/addEvent";
    }

    @PostMapping("addCompetition")
    String addCompetition(@RequestParam long competitorId, @RequestParam long eventId, Model model){

        Set<Competition> competitionList = new HashSet<>();
        List<Start> startList = competitorRepository.findById(competitorId).getStarts();
        List<Start> starts = eventRepository.findById(eventId).getStarts();
        ListIterator<Start> iterator = startList.listIterator();
        for (Start start : starts){
            while (iterator.hasNext()) {
                if (iterator.next().getEvent().getId() != start.getEvent().getId()) {
                    iterator.remove();
                }
            }
        }
        for (Start start : startList){
            competitionList.add(start.getCompetition());
        }
        model.addAttribute("competitionList", competitionList);
        model.addAttribute("competitorId", competitorId);
        model.addAttribute("eventId", eventId);
//        model.addAttribute("startList", startList);
        return "result/competitions";
    }

    @PostMapping("setResult")
    String setResult(@RequestParam long competitorId,
                @RequestParam long eventId,
                @RequestParam long competitionId,
                Model model){
        Result result = new Result();
        result.setCompetition(competitionRepository.findById(competitionId));
        result.setCompetitor(competitorRepository.findById(competitorId));
        result.setEvent(eventRepository.findById(eventId));
        List<Integer> list = new ArrayList<>();
        for (int i = 0; i <= 10; i++) {
            list.add(i);
        }
        List<List<Integer>> superList = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            superList.add(list);
        }
        model.addAttribute("list", list);
        model.addAttribute("superList", superList);
        model.addAttribute("result", result);

        return "result/setResult";
    }

    @PostMapping("zupa")
    String zupa(Result result, Model model){
        String resultList = result.getResultList();
        String[] parts = resultList.split(",");
        int sum = 0;
        for (String count : parts) {
            sum += Integer.parseInt(count);
        }
        result.setSum(sum);
        resultRepository.save(result);
        model.addAttribute("resultList", resultRepository.findAll());
        return "result/all";
    }

    @GetMapping("resultList")
    public String result(Model model) {
        model.addAttribute("resultList", resultRepository.findAll());
        return "result/all";
    }

    @GetMapping("remove")
    public String initRemoveResult(@RequestParam long toRemoveId, Model model) {
        model.addAttribute("result", resultRepository.findResultById(toRemoveId));
        model.addAttribute("viewHelper", new ViewHelper());
        return "result/remove";
    }

    @PostMapping("remove")
    public String removeResult(@RequestParam long toRemoveId, @ModelAttribute ViewHelper viewHelper, Model model) {
        if(viewHelper.getOption().equals("confirmed")) {
            resultRepository.deleteById(toRemoveId);
        }
        model.addAttribute("resultList", resultRepository.findAll());
        return "result/all";
    }

    @GetMapping("edit")
    public String initEditResult(@RequestParam int toEditId, Model model) {
        List<Integer> list = new ArrayList<>();
        for (int i = 0; i <= 10; i++) {
            list.add(i);
        }
        List<List<Integer>> superList = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            superList.add(list);
        }
        model.addAttribute("list", list);
        model.addAttribute("superList", superList);
        model.addAttribute("result", resultRepository.findResultById(toEditId));
        return "result/edit";
    }

    @PostMapping("edit")
    public String editResult(Result result, Model model) {

        String resultList = result.getResultList();
        String[] parts = resultList.split(",");
        int sum = 0;
        for (String count : parts) {
            sum += Integer.parseInt(count);
        }
        result.setSum(sum);
        resultRepository.save(result);
        model.addAttribute("resultList", resultRepository.findAll());
        return "result/all";
    }

}
