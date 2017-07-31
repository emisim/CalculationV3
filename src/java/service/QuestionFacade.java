/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Question;
import bean.User;
import controler.util.HashageUtil;
import controler.util.SessionUtil;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author aser
 */
@Stateless
public class QuestionFacade extends AbstractFacade<Question> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;
    
    
    @EJB
    private UserFacade userFacade;

    public QuestionFacade() {
        super(Question.class);
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public void saveAll(List<Question> questions) {
        for (int i = 0; i < questions.size(); i++) {
            create(questions.get(i));
        }
    }

    public List<Question> getQuestions(User user) {
        if (user == null) {
            return null;
        }
        String query = "SELECT q FROM Question q WHERE q.user.login='" + user.getLogin() + "'";

        return  em.createQuery(query).getResultList();
    }

    
    
    public boolean checkAnswers(User user, List<Question> questions){
        List<Question> responses = getQuestions(user);
        if (responses == null || questions == null) {
            return false;
        }
        for (int i = 0; i < responses.size(); i++) {
            if (!responses.get(i).getReponse().equals(questions.get(i).getReponse())) {
                System.out.println("==========================================================");
                System.out.println("the right answser is ::::" + responses.get(i).getReponse());
                System.out.println("the submitted answser is ::::" + questions.get(i).getReponse());
                return false;
            }
        }
        return true;
    }
    

    private void clone(Question question, Question cloned) {
        cloned.setQuestion(question.getQuestion());
        cloned.setReponse(question.getReponse());
        cloned.setUser(question.getUser());
    }

    public Question clone(Question question) {
        Question cloned = new Question();
        clone(question, cloned);
        return cloned;
    }
    
    
    /* ==== Verification of this fact : does User have Security Questions ? =====*/
    
    
    public void createSecure(Question test)
    {
        User user = (User) SessionUtil.getConnectedUser(); // User
        Question secure = new Question();
        secure.setId(test.getId());
        //secure.setCorrect(false);
        secure.setQuestion(test.getQuestion());
        //secure.setReponse(HashageUtil.sha256(test.getReponse()));
        secure.setReponse(test.getReponse());
        
        if ( user != null )
        {
           if ( !secure.getQuestion().equals("") && !secure.getReponse().equals("") )
            if ( !secure.getQuestion().equals(""))
                if (!secure.getReponse().equals(""))
        {
            secure.setUser(user); // setUser
            create(secure);
        }
        }
    }
    
    /**
     * Methode : Check if User has already a List<\Secures\> or not <br/>
     * Author : Youssef Benihoud <br/>
     * Date : 16/05/2017 <br/>
     * Works
     *
     * @param login
     * @return True Or False
     */
    public boolean hasSecure(String login) {
        System.out.println("=== Has Secure Facade User ===");
        User user = userFacade.find(login);
        System.out.println("user === " + user);
        if (user != null) {
            if (getQuestions(user) != null) {
                if (!getQuestions(user).isEmpty()) {
                    System.out.println("getSecures === " + getQuestions(user));
                    return true;
                }
            }
        }
        return false;
    }
    
    	/**
	*Method : Hello is a method that retrieve the questions saved for Connected User
	*Author : YOUSSEF BENIHOUD ( @ROBENIHOUD )
	*Date : 24/06/2017
	*/
	
	public List<Question> hello()
	{
		System.out.println("=== hello User ===");
        User test = (User) SessionUtil.getConnectedUser();
        System.out.println("test User == " + test);
        User user = userFacade.find(test.getLogin());
		
		if ( user != null )
		{
			if (!getQuestions(user).isEmpty())
			{
				return getQuestions(user);
			}
			
		}
		
		return new ArrayList<>();
    }
        
       /**
     * Methode : User has to set at least 3 questions <br/>
     * Author : Youssef Benihoud <br/>
     * Date : 19/06/2017 <br/>
     * @param List<Secure>
     * @return true or false
     */
    public boolean itemsMoreThanThree(List<Question> items )
    {
        if ( items != null )
        {
            if ( items.size() >= 3 )
            {
                return true;
            }
        }
        return false;
    }
    
    
        
    /* ==== Verification of this fact : does User have Security Questions ? =====*/

}
