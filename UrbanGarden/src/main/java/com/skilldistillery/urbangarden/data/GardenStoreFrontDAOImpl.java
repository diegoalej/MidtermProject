package com.skilldistillery.urbangarden.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.urbangarden.entities.Address;
import com.skilldistillery.urbangarden.entities.GardenStoreFront;
import com.skilldistillery.urbangarden.entities.User;

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
		String queryString = "SELECT s from GardenStoreFront s";
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
	public GardenStoreFront createGardenAndUser(GardenStoreFront gsf, int id) {
		gsf.setUser(em.find(User.class, id));
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
		if (em.contains(gsf)) {
			gsf.setActive(false);
		}
		return gsf;
	}

	@Override
	public GardenStoreFront activateStore(GardenStoreFront gsf) {
		if (em.contains(gsf)) {
			gsf.setActive(true);
		}
		return gsf;
	}

	@Override
	public GardenStoreFront update(GardenStoreFront gsf) {
		System.out.println("######### THIS IS WHAT IS TO BE UPDATED: " + gsf);
		
		if (em.contains(em.find(GardenStoreFront.class, gsf.getId()))) {
			GardenStoreFront managedGSF = em.find(GardenStoreFront.class, gsf.getId());
			managedGSF.setSize(gsf.getSize());
			managedGSF.setOrganic(gsf.getOrganic());
			managedGSF.setNameOfGarden(gsf.getNameOfGarden());
			managedGSF.setUser(gsf.getUser());
			managedGSF.setActive(gsf.isActive());
			managedGSF.setDescription(gsf.getDescription());
			managedGSF.setGardenURL(gsf.getGardenURL());
			if( gsf.getAddress() != null) {
				System.out.println(gsf.getAddress());
				Address unManagedAddress = gsf.getAddress();
				Address managedAddress = em.find(Address.class, managedGSF.getAddress().getId());
				managedAddress.setStreet(unManagedAddress.getStreet());
				managedAddress.setStreet2(unManagedAddress.getStreet2());
				managedAddress.setCity(unManagedAddress.getCity());
				managedAddress.setState(unManagedAddress.getState());
				managedAddress.setZipCode(unManagedAddress.getZipCode());
				managedAddress.setCountry(unManagedAddress.getCountry());
			}
//			em.persist(managedGSF);
//			em.flush();
			System.out.println(managedGSF);
			return managedGSF;
		} else
			return null;
	}
	
	@Override
	public List<GardenStoreFront> searchByZip(int zip){
		String query = "SELECT gsf FROM GardenStoreFront gsf "
				+ "WHERE gsf.address.zipCode = :zip";
		List<GardenStoreFront> gsfResults = em.createQuery(query, GardenStoreFront.class).setParameter("zip", zip).getResultList();
		return gsfResults;
		
	}

	@Override
	public List<GardenStoreFront> searchByKeyword(String keyword) {
		String query = "SELECT  DISTINCT gsf FROM GardenProduce gp JOIN GardenStoreFront gsf "
						+ "ON gp.garden = gsf JOIN Product p ON gp.product = p "
						+ "WHERE p.name LIKE :keyword OR p.type LIKE :keyword "
						+ "OR p.description LIKE :keyword"; //concat the % inside the setParameter method
		List<GardenStoreFront> gsfResults = em.createQuery(query, GardenStoreFront.class).setParameter("keyword", "%"+keyword+"%").getResultList();
		return gsfResults;
	}

	@Override
	public List<GardenStoreFront> searchByFarm(String farm) {
		String query = "SELECT gsf FROM GardenStoreFront gsf where gsf.nameOfGarden like :farm";
		List<GardenStoreFront> gsfResults = em.createQuery(query, GardenStoreFront.class).setParameter("farm", "%"+farm+"%").getResultList();
		
		return gsfResults;
	}
	
	public GardenStoreFront addUser(User user, int id) {
		GardenStoreFront managedGardenStoreFront = em.find(GardenStoreFront.class, id);
		managedGardenStoreFront.setUser(user);
		return managedGardenStoreFront;
	}

}
