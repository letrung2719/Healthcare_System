/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.SQLException;
import java.util.List;
import model.Doctor;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author admin
 */
public class DoctorDAOTest {

    public DoctorDAOTest() {
    }

    @Test
    public void testGetDoctorByAccountID() throws Exception {
        System.out.println("getDoctorByAccountID");
        int accountID = 2;
        DoctorDAO instance = new DoctorDAO();
        Doctor expResult = new Doctor(1, "Phiplippe Macaire", 1, "1984-06-28", "0913028592", "philippe02@gmail.com", "Head of Department of Anesthesiology", null, "", "", 2);
        Doctor result = instance.getDoctorByAccountID(accountID);
        assertEquals(expResult.getDoctorID(), result.getDoctorID());
        assertEquals(expResult.getName(), result.getName());
        assertEquals(expResult.getGender(), result.getGender());
        assertEquals(expResult.getDob(), result.getDob());
    }

    @Test
    public void testGetDoctorByDoctorID() throws Exception {
        System.out.println("getDoctorByDoctorID");
        int doctorID = 1;
        DoctorDAO instance = new DoctorDAO();
        Doctor expResult = new Doctor(1, "Phiplippe Macaire", 1, "1984-06-28", "0913028592", "philippe02@gmail.com", "Head of Department of Anesthesiology", null, "", "", 2);
        Doctor result = instance.getDoctorByDoctorID(doctorID);
        assertEquals(expResult.getDoctorID(), result.getDoctorID());
        assertEquals(expResult.getName(), result.getName());
        assertEquals(expResult.getGender(), result.getGender());
        assertEquals(expResult.getDob(), result.getDob());
    }

    @Test
    public void testEditDoctor() throws Exception {
        System.out.println("editDoctor");
        Doctor p = new Doctor(1, "Phiplippe Macaire", 1, "1984-06-28", "0913028592", "philippe02@gmail.com", "Head of Department of Anesthesiology", null, "", "", 2);;
        DoctorDAO instance = new DoctorDAO();
        int expResult = 1;
        int result = instance.editDoctor(p);
        assertEquals(expResult, result);
    }

    @Test
    public void testDelete() throws Exception {
        System.out.println("delete");
        int id = 10;
        DoctorDAO instance = new DoctorDAO();
        instance.delete(id);
    }

    @Test
    public void testGetAllDoctor() throws Exception {
        System.out.println("getAllDoctor");
        DoctorDAO instance = new DoctorDAO();
        List<Doctor> expResult = null;
        List<Doctor> result = instance.getAllDoctor();
        assertNotEquals(expResult, result);
    }

    @Test
    public void testGetDoctorByPage() throws SQLException {
        System.out.println("getDoctorByPage");
        DoctorDAO instance = new DoctorDAO();
        List<Doctor> list = instance.getAllDoctor();
        int begin = 0;
        int end = 0;
        List<Doctor> expResult = null;
        List<Doctor> result = instance.getDoctorByPage(list, begin, end);
        assertNotEquals(expResult, result);
    }

    /**
     *
     * @throws Exception
     */
    @Test
    public void testSearch() throws Exception {
        System.out.println("search");
        String doctorName = "Phiplippe Macaire";
        String dob = "";
        String phone = "";
        String email = "";
        Integer gender = null;
        List<String> listSpec = null;
        DoctorDAO instance = new DoctorDAO();
        Doctor expResult = new Doctor(1, "Phiplippe Macaire", 1, "1984-06-28", "0913028592", "philippe02@gmail.com", "Head of Department of Anesthesiology", null, "", "", 2);
        List<Doctor> result = instance.search(doctorName, dob, phone, email, gender, listSpec);
        result.forEach((doctor) -> {
            assertEquals(expResult.getDoctorID(), doctor.getDoctorID());
        });
    }
}
