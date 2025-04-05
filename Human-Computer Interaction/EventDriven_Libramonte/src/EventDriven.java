import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.border.EmptyBorder;

public class EventDriven extends JFrame {

    private JTextField txtFirstName, txtLastName, txtMiddleName, txtMobile, txtEmail;
    private JButton btnSubmit, btnClearAll;
    private OutputFrame outputFrame; // 

    public EventDriven() {
        setTitle("INPUT");
        JPanel panel = new JPanel(new GridLayout(6, 2, 10, 10));
        panel.setBorder(new EmptyBorder(15, 15, 15, 15));


        txtFirstName = new JTextField();
        txtLastName = new JTextField();
        txtMiddleName = new JTextField();
        txtMobile = new JTextField();
        txtEmail = new JTextField();

        btnSubmit = new JButton("Submit");
        btnClearAll = new JButton("Clear All");

        
        btnSubmit.addActionListener(new btnSubmit());
        btnClearAll.addActionListener(new btnClearAll());

        panel.add(new JLabel("First Name:"));
        panel.add(txtFirstName);
        panel.add(new JLabel("Last Name:"));
        panel.add(txtLastName);
        panel.add(new JLabel("Middle Name:"));
        panel.add(txtMiddleName);
        panel.add(new JLabel("Mobile Number:"));
        panel.add(txtMobile);
        panel.add(new JLabel("E-mail Address:"));
        panel.add(txtEmail);
        panel.add(btnSubmit);
        panel.add(btnClearAll);

        add(panel);
        setSize(500,400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
    }

    
    class btnSubmit implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            btnSubmit.setEnabled(false); 
            outputFrame = new OutputFrame(
                txtFirstName.getText(), txtLastName.getText(), 
                txtMiddleName.getText(), txtMobile.getText(), 
                txtEmail.getText());
        }
    }

    // 
    class btnClearAll implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            txtFirstName.setText("");
            txtLastName.setText("");
            txtMiddleName.setText("");
            txtMobile.setText("");
            txtEmail.setText("");
            btnSubmit.setEnabled(true);

            if (outputFrame != null) {
                outputFrame.dispose(); //iko-close yung window
                outputFrame = null;
            }
        }
    }


    class OutputFrame extends JFrame {
        private JButton btnOkay;

        public OutputFrame(String firstName, String lastName, String middleName, String mobile, String email) {
            setTitle("OUTPUT");
            setLayout(new GridLayout(6, 1));

            add(new JLabel("First Name: " + firstName));
            add(new JLabel("Last Name: " + lastName));
            add(new JLabel("Middle Name: " + middleName));
            add(new JLabel("Mobile Number: " + mobile));
            add(new JLabel("E-mail Address: " + email));

            btnOkay = new JButton("Okay");
            btnOkay.addActionListener(new btnOkay());

            add(btnOkay);

            setSize(300, 200);
            setVisible(true);
        }

        
        class btnOkay implements ActionListener {
            public void actionPerformed(ActionEvent e) {
                dispose(); 
            }
        }
    }


    public static void main(String[] args) {
        new EventDriven();
    }
}
