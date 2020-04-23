package pl.coderslab.war6.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.war6.model.Competition;
import pl.coderslab.war6.model.Event;

import java.util.List;

public interface CompetitionRepository  extends JpaRepository<Competition, Long> {

    Competition findById(long id);

//    List<Competition> findAllByEventListId(Event event);
}
