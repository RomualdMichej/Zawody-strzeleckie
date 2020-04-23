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
public interface EventRepository extends JpaRepository<Event, Long>, EventRepositoryCustom {

    Event findById(long id);

//    void deleteAllByCompetitionList(Competition competition);

    List<Event> findAllByCompetitionList(Competition competition);

    @Modifying
    @Query("update Event e set e.competitionList=null where e.competitionList = :competition")
    void updateToNull(@Param("competition") Competition competition);

//    @Modifying
//    @Query("update Event e set e.name = :name, e.date = :date," +
//            " e.startTime = :startTime, e.endTime = :endTime, e.competitionList= :competitionList " +
//            "where e.id = :id")
//    void updateEvent(@Param("name")String name,
//                     @Param("date") String date,
//                     @Param("startTime") String startTime,
//                     @Param("endTime") String endTime,
//                     @Param("competitionList") List<Competition> competitionList,
//                     @Param("id") long id);

}
