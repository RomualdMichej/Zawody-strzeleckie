package pl.coderslab.war6.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.war6.model.Competition;
import pl.coderslab.war6.model.Competitor;
import pl.coderslab.war6.model.Event;

import java.util.List;

public interface CompetitorRepository extends JpaRepository<Competitor, Long>, CompetitorRepositoryCustom {

    Competitor findById(long id);

    List<Competitor> findAllByCompetitionList(Competition competition);
}
