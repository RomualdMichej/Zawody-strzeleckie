package pl.coderslab.war6.repository;

import pl.coderslab.war6.model.Competitor;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

@Transactional
public class CompetitorRepositoryCustomImpl implements CompetitorRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void merge(Competitor competitor) {
        entityManager.merge(competitor);
    }
}
