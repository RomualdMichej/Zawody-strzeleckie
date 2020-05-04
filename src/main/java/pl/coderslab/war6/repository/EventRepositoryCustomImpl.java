package pl.coderslab.war6.repository;

import pl.coderslab.war6.model.Event;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

@Transactional
public class EventRepositoryCustomImpl implements EventRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void update(Event event) {
        entityManager.merge(event);
    }
}
