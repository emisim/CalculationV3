/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Device;
import bean.User;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author acer
 */
@Stateless
public class DeviceFacade extends AbstractFacade<Device> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DeviceFacade() {
        super(Device.class);
    }
    
      public int checkDevice(User user,Device connectedDevice) {
        List<Device> list = findDeviceByUser(user);
        if (list.isEmpty()) {
            return 1;
        } else {
           
            for (int i = 0; i < list.size(); i++) {
                Device device = list.get(i);
                if (device.getDeviceCategorie().equals(connectedDevice.getDeviceCategorie())
                        && device.getBrowser().equals(connectedDevice.getBrowser())
                        && device.getOperatingSystem().equals(connectedDevice.getOperatingSystem())) {
                    return 2;
                }
            }
        }
        return -1;
    }
      
      public void save(Device device,User user){
          device.setUser(user);
          create(device);
      }

    public List<Device> findDeviceByUser(User user) {
        if (user == null || user.getLogin() == null) {
            return new ArrayList<>();
        } else {
            String req = "SELECT o FROM Device o WHERE o.user.login='" + user.getLogin() + "'";
            return em.createQuery(req).getResultList();
        }
    }
}
