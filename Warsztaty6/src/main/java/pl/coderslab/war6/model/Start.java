package pl.coderslab.war6.model;


import org.springframework.stereotype.Component;

import javax.persistence.*;

@Entity
@Table(name = "starts")
public class Start {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String begin;

    //private String end;

    @ManyToOne
    private Event event;

    @ManyToOne
    private Competition competition;

    @ManyToOne
    private Competitor competitor;

    public Long getId() {
        return id;
    }

    public String getBegin() {
        return begin;
    }

    public Event getEvent() {
        return event;
    }

    public Competition getCompetition() {
        return competition;
    }

    public Competitor getCompetitor() {
        return competitor;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setBegin(String begin) {
        this.begin = begin;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    public void setCompetition(Competition competition) {
        this.competition = competition;
    }

    public void setCompetitor(Competitor competitor) {
        this.competitor = competitor;
    }

    @Override
    public String toString() {
        return "Start{" +
                "id=" + id +
                ", begin='" + begin + '\'' +
                ", event=" + event +
                ", competition=" + competition +
                ", competitor=" + competitor +
                '}';
    }
}
