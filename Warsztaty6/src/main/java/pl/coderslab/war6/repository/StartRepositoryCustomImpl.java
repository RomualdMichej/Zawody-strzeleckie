package pl.coderslab.war6.repository;

import pl.coderslab.war6.model.Start;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

@Transactional
public class StartRepositoryCustomImpl implements StartRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void update(Start start) {
        entityManager.merge(start);
    }
}
