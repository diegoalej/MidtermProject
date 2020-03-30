package com.skilldistillery.urbangarden.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.urbangarden.entities.GardenStoreFront;

@Transactional
@Service
public class GardenStoreFrontDAOImpl implements GardenStoreFrontDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public GardenStoreFront findById(int id) {
		return em.find(GardenStoreFront.class, id);

	}

	@Override
	public List<GardenStoreFront> findAll() {
		List<GardenStoreFront> results = null;
		String queryString = "SELECT s from XXXXX s";
		results = em.createQuery(queryString, GardenStoreFront.class).getResultList();
		return results;

	}

	@Override
	public GardenStoreFront create(GardenStoreFront gsf) {
		em.persist(gsf);
		em.flush();
		return gsf;
	}

	@Override
	public boolean delete(int id) {
		boolean destroyed = false;
		try {

			GardenStoreFront gsfToDestroy = em.find(GardenStoreFront.class, id);
			if (em.contains(gsfToDestroy)) {
				em.remove(gsfToDestroy);
				em.flush();
				destroyed = true;
			}
		} catch (Exception e) {
			System.out.println("Unable to delete user record. It may not exist in the database.");
		}
		return destroyed;
	}

	@Override
	public GardenStoreFront deactivateStore(GardenStoreFront gsf) {
		if(em.contains(gsf)) {
			gsf.setActive(false);
		}
		return gsf;
	}

	@Override
	public GardenStoreFront activateStore(GardenStoreFront gsf) {
		if(em.contains(gsf)) {
			gsf.setActive(true);
		}
		return gsf;
	}

	@Override
	public GardenStoreFront update(int id, GardenStoreFront gsf) {
		if(em.contains(em.find(GardenStoreFront.class, id))) {
			GardenStoreFront managedGSF = em.find(GardenStoreFront.class, id);
			managedGSF.setSize(gsf.getSize());
			managedGSF.setOrganic(gsf.isOrganic());
			managedGSF.setNameOfGarden(gsf.getNameOfGarden());
			managedGSF.setUser(gsf.getUser());
			managedGSF.setActive(gsf.isActive());
			managedGSF.setDescription(gsf.getDescription());
			managedGSF.setAddress(gsf.getAddress());
			managedGSF.setGardenURL(gsf.getGardenURL());
			return managedGSF;
		}else return null;
	}

}
