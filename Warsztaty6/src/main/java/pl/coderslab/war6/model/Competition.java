package pl.coderslab.war6.model;


import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "competitions")
public class Competition {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String competitionName;

    private String description;

    private int personQuantity;

    private int period;

    @OneToMany(mappedBy = "competition", cascade = CascadeType.REMOVE)
    private List<Start> startList;

    @OneToMany(mappedBy = "competition")
    private List<Result> results;

//    @ManyToMany(cascade = CascadeType.ALL)
//    private List<Event> eventList;

    public Long getId() {
        return id;
    }

    public String getName() {
        return competitionName;
    }

    public String getDescription() {
        return description;
    }

    public int getPersonQuantity() {
        return personQuantity;
    }

    public List<Start> getStartList() {
        return startList;
    }

    public String getCompetitionName() {
        return competitionName;
    }

    public List<Result> getResults() {
        return results;
    }

//    public List<Event> getEventList() {
//        return eventList;
//    }

    public int getPeriod() { return period; }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.competitionName = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPersonQuantity(int personNumber) {
        this.personQuantity = personNumber;
    }

    public void setStartList(List<Start> startList) {
        this.startList = startList;
    }

    public void setCompetitionName(String competitionName) {
        this.competitionName = competitionName;
    }

    public void setResults(List<Result> results) {
        this.results = results;
    }

    public void setPeriod(int period) { this.period = period; }

//    public void setEventList(List<Event> eventList) {
//        this.eventList = eventList;
//    }
}
