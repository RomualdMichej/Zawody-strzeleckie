package pl.coderslab.war6.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.war6.model.Competition;
import pl.coderslab.war6.model.Competitor;
import pl.coderslab.war6.model.Event;
import pl.coderslab.war6.model.Result;

import java.util.List;

public interface ResultRepository extends JpaRepository<Result, Long> {

    Result findResultById(long id);

    List<Result> findAllByCompetition(Competition competition);

    List<Result> findAllByEvent(Event event);

    List<Result> findAllByCompetitor(Competitor competitor);

    List<Result> deleteAllByCompetitor(Competitor competitor);
}
