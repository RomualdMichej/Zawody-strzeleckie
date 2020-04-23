package pl.coderslab.war6.model;


import org.hibernate.validator.constraints.Range;

import javax.persistence.*;

@Entity
@Table(name = "results")
public class Result {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String resultList;

    private int sum;

    private String passEventData;

    private String passCompetitionData;

    @Range(min = 0, max = 10)
    private int w10;

    @ManyToOne
    private Competition competition;

    @ManyToOne
    private Competitor competitor;

    @ManyToOne
    private Event event;

    public Long getId() {
        return id;
    }

    public String getResultList() {
        return resultList;
    }

    public int getSum() {
        return sum;
    }

    public int getW10() {
        return w10;
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

    public Event getEvent() {
        return event;
    }

    public String getPassEventData() {
        return passEventData;
    }

    public String getPassCompetitionData() {
        return passCompetitionData;
    }

    public void setResultList(String reultList) {
        this.resultList = reultList;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }

    public void setW10(int w10) {
        this.w10 = w10;
    }

    public void setCompetition(Competition competition) {
        this.competition = competition;
    }

    public void setCompetitor(Competitor competitor) {
        this.competitor = competitor;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    public void setPassEventData(String passEventData) {
        this.passEventData = passEventData;
    }

    public void setPassCompetitionData(String passCompetitionData) {
        this.passCompetitionData = passCompetitionData;
    }

    @Override
    public String toString() {
        return "Result{" +
                "id=" + id +
                ", resultList='" + resultList + '\'' +
                ", sum=" + sum +
                ", w10=" + w10 +
                ", competition=" + competition +
                ", competitor=" + competitor +
                ", event=" + event +
                '}';
    }
}
