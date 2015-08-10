package com.moe.sls.dao;

public abstract class  AbstractHibernateDAO {

	private SessionFactory sessionFactorya ; 
	private static ServiceRegistry serviceRegistry;
	private Session session;

	public AbstractHibernateDAO(){
		try {
			Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
			serviceRegistry = new StandardServiceRegistryBuilder().applySettings(
					configuration.getProperties()).build();
			sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		}catch (Throwable ex) {
			ex.printStackTrace();
			throw new DataBaseException("DBE_1",ex); 
		}
	}

	public AbstractHibernateDAO(Session session){
		this.session=session;
	}

	public Session getCurrentSession(){
		System.out.println("AbstractHibernateDAO : Session is : "+ (this.session == null ?" Is Null " : " Not Null "));
		return this.session;
	}

	public Session  getSession(){
		this.session=sessionFactory.openSession();
		return this.session;
	}

	public void save(Object object){
		this.session.save(object);
		this.session.flush();
	}

	public void saveOrUpdate(Object object){
		this.session.saveOrUpdate(object);
		this.session.flush();
	}

	public void delete(Object object){
		this.session.delete(object);
		this.session.flush();
	}

	public void update(Object object){
		this.session.update(object);
		this.session.flush();
	}

	public void closeConnection(){
		if(this.session!=null && this.session.isOpen()){
			this.session.close();	
		}
	}

	public void setSession(Session session){
		this.session=session;
	}

	public SessionFactory getSessionFactory() {
		return this.sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
