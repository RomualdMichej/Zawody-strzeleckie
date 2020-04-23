package pl.coderslab.war6.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.coderslab.war6.model.Competition;
import pl.coderslab.war6.model.Competitor;
import pl.coderslab.war6.model.Event;
import pl.coderslab.war6.model.Start;
import javax.transaction.Transactional;
import java.util.List;

@Transactional
public interface StartRepository extends JpaRepository<Start, Long>, StartRepositoryCustom {

    void deleteByEventId(Long evenId);

    void deleteByCompetitionId(Long id);

    List<Start> findByEventId(long id);

    Start findStartById(long id);

    @Modifying
    @Query("update Start s set s.competitor=null where s.competitor = :competitor")
    void updateToNull(@Param("competitor")Competitor competitor);

    @Modifying
    @Query("update Start s set s.competitor=null where s.id = :id")
    void mergeToNull(@Param("id") long id);

    @Modifying
    @Query("update Start s set s.begin = :begin, s.competition = :competition, s.competitor = :competitor  where s.event = :event")
    void updateStart(@Param("begin")String begin, @Param("competition") Competition competition,
                @Param("competitor") Competitor competitor, @Param("event") Event event);

}
