package pl.coderslab.war6.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.war6.model.Result;

public interface ResultRepository extends JpaRepository<Result, Long> {

    Result findResultById(long id);
}
