package pl.coderslab.war6.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "competitors")
public class Competitor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String firstName;

    private String lastName;

    private int cardNumber;

    private int patentNumber;

    private String clubName;

    private String email;

    private String password;

    @ManyToMany
    private Set<Competition> competitionList = new HashSet<>();

    @OneToMany(mappedBy = "competitor")
    private List<Result> results = new ArrayList<>();

    @OneToMany(mappedBy = "competitor")
    private List<Start> starts;

    public Long getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public int getCardNumber() {
        return cardNumber;
    }

    public int getPatentNumber() {
        return patentNumber;
    }

    public String getClubName() {
        return clubName;
    }

    public Set<Competition> getCompetitionList() {
        return competitionList;
    }

    public List<Result> getResults() {
        return results;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getFullName() {
        return id + "." + " " + firstName + " " + lastName;
    }

    public String getFullName1() {
        return firstName + " " + lastName;
    }

    public List<Start> getStarts() {
        return starts;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setCardNumber(int cardNumber) {
        this.cardNumber = cardNumber;
    }

    public void setPatentNumber(int patentNumber) {
        this.patentNumber = patentNumber;
    }

    public void setClubName(String clubName) {
        this.clubName = clubName;
    }

    public void setCompetitionList(Set<Competition> competitionList) {
        this.competitionList = competitionList;
    }

    public void setResults(List<Result> results) {
        this.results = results;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setStarts(List<Start> starts) {
        this.starts = starts;
    }
}
