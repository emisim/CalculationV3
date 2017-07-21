/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.ArtDerWeiterverarbeitung;
import bean.DemandCategory;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

/**
 *
 * @author
 */
@Stateless
public class CalculationExpressionFacade extends AbstractFacade<ArtDerWeiterverarbeitung> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    @EJB
    private ConfigurationItemFacade configurationItemFacade;
    ScriptEngineManager manager = new ScriptEngineManager();
    ScriptEngine jsEngine;

    public CalculationExpressionFacade() {
        super(ArtDerWeiterverarbeitung.class);
    }

    //Wichtig für die Evaluation unsere Expression
    public Object evalFunction(String expression, Object input, boolean execExpression) throws ScriptException {
        System.out.println("ha expression"+expression+ " ha exec "+execExpression);
        if (execExpression == true) {
            System.out.println("haa expression ==> " + expression);
            if (input != null && input instanceof DemandCategory) {
                // ALlle Input sinbd als Object hier gespeicherts
                getJsEngine().put("demandCategory", (DemandCategory) input);
            }
            Object obj = getJsEngine().eval(expression);
            System.out.println("haaa l eval ==> " + obj);
            return obj;
        }
        return "0";
    }

    public ScriptEngine getJsEngine() {
        if (jsEngine == null) {
            jsEngine = manager.getEngineByName("JavaScript"); //BE CAREFUL about the engine name.
            jsEngine.put("configurationItemFacade", configurationItemFacade);
        }
        return jsEngine;
    }

    public void setJsEngine(ScriptEngine jsEngine) {
        this.jsEngine = jsEngine;
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    // ALles drunter wird nicht benutzt
    public static List<String> extracteService(String expression) {
        return extracteService(expression, ";", ";");
    }

    private static List<String> extracteService(String expression, String start, String end) {
// Captures the word(s) between the above two character(s)
        String pattern = start + "(\\w+)" + end;
        Pattern patternToBeExec = Pattern.compile(pattern);
        Matcher matcher = patternToBeExec.matcher(expression);
        List<String> res = new ArrayList();
        while (matcher.find()) {
            res.add(matcher.group().replace(start, "").replace(end, ""));
        }
        return res;
    }

    public static List<String> formateService(String nonFormatedText) {
        //nonFormatedText = "6*;configurationItemFacadDOTfindByNameACLDOTgetDefaultValueACL;+66 ;koko;";

        List<String> res = (extracteService(nonFormatedText));
        for (int i = 0; i < res.size(); i++) {
            res.set(i, res.get(i).replace("DOT", "."));

        }
        for (int i = 0; i < res.size(); i++) {
            res.set(i, (res.get(i).replace("ACLOPEN", "(")));

        }
        for (int i = 0; i < res.size(); i++) {
            res.set(i, (res.get(i).replace("ACLCLOSE", ")")));

        }
        for (int i = 0; i < res.size(); i++) {
            res.set(i, (res.get(i).replace("APP", "'")));

        }
        return res;
    }

}
