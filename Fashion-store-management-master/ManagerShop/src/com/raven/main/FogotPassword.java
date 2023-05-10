/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raven.main;

import com.ptithcm.DAO.EmpolyeeDao;
import com.ptithcm.Validate.labelValidate;
import com.ptithcm.entity.Empolyee;
import com.ptithcm.utils.MsgBox;
import java.awt.event.ActionListener;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

/**
 *
 * @author ducit
 */
public class FogotPassword extends javax.swing.JPanel {

    int randomCode;

    /**
     * Creates new form FogotPassword
     */
    public FogotPassword() {
        initComponents();
        txtVerify.setEnabled(false);
        txtPassword.setEnabled(false);
        txtVerifyPassword.setEnabled(false);
        btnVerify.setEnabled(false);
        btnReset.setEnabled(false);
        lblTime.setText("");
        lblBell.hide();

    }

    EmpolyeeDao emDao = new EmpolyeeDao();

    public boolean checkUser(String acc) {
        for (int i = 0; i < emDao.selectAll().size(); i++) {
            if (emDao.selectAll().get(i).getUsername().equals(acc.trim())) {
                return true;
            }
        }
        return false;
    }

    public boolean checkEmail(String acc) {
        for (int i = 0; i < emDao.selectAll().size(); i++) {
            if (emDao.selectAll().get(i).getEmail().trim().equals(acc.trim())) {
                return true;
            }
        }
        return false;
    }

    public void sendCode() {
        try {
            Random rand = new Random();
            randomCode = rand.nextInt(999999);
            String host = "smtp.gmail.com";
            String user = "s2mits2s@gmail.com";
            String pass = "kxbaryealunkxsvb";
            String to = txtEmail.getText();
            String subject = "Reseting Code";
            String message = "Your reset code is " + randomCode;
            boolean sessionDebug = false;
            Properties pros = System.getProperties();
            pros.put("mail.smtp.starttls.enable", "true");
            pros.put("mail.smtp.starttls.required", "true");
            pros.put("mail.smtp.host", host);
            pros.put("mail.smtp.port", "587");
            pros.put("mail.smtp.auth", "true");
            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(pros, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(user));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject);
            msg.setText(message);
            Transport transport = mailSession.getTransport("smtp");
            transport.connect(host, user, pass);
            transport.sendMessage(msg, msg.getAllRecipients());
            transport.close();
            JOptionPane.showMessageDialog(null, "code has been send to the email");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void register() {
        txtUsername.grabFocus();
    }

    public void addEventBackLogin(ActionListener event) {
        btnBackLogin.addActionListener(event);
    }

    Thread time;

    public void countDown() {
        time = new Thread(new Runnable() {
            @Override
            public void run() {
                for (int i = 60; i >= 0; i--) {
                    lblTime.setText("" + i);
                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException ex) {
                        ex.printStackTrace();
                    }
                }
                txtVerify.setEnabled(false);
                btnSend.setEnabled(true);
            }
        });
        time.start();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel2 = new javax.swing.JLabel();
        txtUsername = new com.raven.suportSwing.TextField();
        btnSend = new com.raven.suportSwing.MyButton();
        txtPassword = new com.raven.suportSwing.PasswordField();
        txtVerify = new com.raven.suportSwing.TextField();
        txtEmail = new com.raven.suportSwing.TextField();
        txtVerifyPassword = new com.raven.suportSwing.PasswordField();
        btnVerify = new com.raven.suportSwing.MyButton();
        btnReset = new com.raven.suportSwing.MyButton();
        btnBackLogin = new com.raven.suportSwing.MyButton();
        lblBell = new javax.swing.JLabel();
        lblTime = new javax.swing.JLabel();
        lblUserName = new javax.swing.JLabel();
        lblEmail = new javax.swing.JLabel();
        lblPass = new javax.swing.JLabel();
        lblVerify = new javax.swing.JLabel();
        lblVerifyPass = new javax.swing.JLabel();

        setBackground(new java.awt.Color(255, 255, 255));

        jLabel2.setFont(new java.awt.Font("sansserif", 1, 48)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(69, 68, 68));
        jLabel2.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel2.setText("Forgot");

        txtUsername.setLabelText("Usename");
        txtUsername.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txtUsernameFocusGained(evt);
            }
        });
        txtUsername.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtUsernameActionPerformed(evt);
            }
        });

        btnSend.setText("Send");
        btnSend.setBorderColor(new java.awt.Color(51, 153, 255));
        btnSend.setColorClick(new java.awt.Color(255, 102, 204));
        btnSend.setColorOver(new java.awt.Color(51, 153, 255));
        btnSend.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSendActionPerformed(evt);
            }
        });

        txtPassword.setLabelText("Password");
        txtPassword.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txtPasswordFocusGained(evt);
            }
        });

        txtVerify.setLabelText("Verify");
        txtVerify.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txtVerifyFocusGained(evt);
            }
        });

        txtEmail.setLabelText("Email");
        txtEmail.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txtEmailFocusGained(evt);
            }
        });
        txtEmail.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtEmailActionPerformed(evt);
            }
        });

        txtVerifyPassword.setLabelText("Verify Password");
        txtVerifyPassword.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txtVerifyPasswordFocusGained(evt);
            }
        });
        txtVerifyPassword.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtVerifyPasswordActionPerformed(evt);
            }
        });

        btnVerify.setText("Verify");
        btnVerify.setBorderColor(new java.awt.Color(51, 153, 255));
        btnVerify.setColorClick(new java.awt.Color(255, 102, 204));
        btnVerify.setColorOver(new java.awt.Color(51, 153, 255));
        btnVerify.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnVerifyActionPerformed(evt);
            }
        });

        btnReset.setText("Reset");
        btnReset.setBorderColor(new java.awt.Color(51, 153, 255));
        btnReset.setColorClick(new java.awt.Color(255, 102, 204));
        btnReset.setColorOver(new java.awt.Color(51, 153, 255));
        btnReset.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnResetActionPerformed(evt);
            }
        });

        btnBackLogin.setText("BackLogin");
        btnBackLogin.setBorderColor(new java.awt.Color(51, 153, 255));
        btnBackLogin.setColorClick(new java.awt.Color(102, 255, 0));
        btnBackLogin.setColorOver(new java.awt.Color(51, 153, 255));
        btnBackLogin.setContentAreaFilled(true);
        btnBackLogin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBackLoginActionPerformed(evt);
            }
        });

        lblBell.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/raven/icon/Bell.png"))); // NOI18N

        lblTime.setText("jLabel1");

        lblUserName.setFont(new java.awt.Font("Tahoma", 2, 10)); // NOI18N
        lblUserName.setForeground(new java.awt.Color(255, 0, 51));

        lblEmail.setFont(new java.awt.Font("Tahoma", 2, 10)); // NOI18N
        lblEmail.setForeground(new java.awt.Color(255, 0, 51));

        lblPass.setFont(new java.awt.Font("Tahoma", 2, 10)); // NOI18N
        lblPass.setForeground(new java.awt.Color(255, 0, 51));

        lblVerify.setFont(new java.awt.Font("Tahoma", 2, 10)); // NOI18N
        lblVerify.setForeground(new java.awt.Color(255, 0, 51));

        lblVerifyPass.setFont(new java.awt.Font("Tahoma", 2, 10)); // NOI18N
        lblVerifyPass.setForeground(new java.awt.Color(255, 0, 51));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(60, 60, 60)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(lblUserName, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(txtPassword, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(txtUsername, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jLabel2, javax.swing.GroupLayout.DEFAULT_SIZE, 300, Short.MAX_VALUE)
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
                        .addComponent(txtVerify, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(lblBell, javax.swing.GroupLayout.PREFERRED_SIZE, 38, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(lblTime))
                    .addComponent(txtEmail, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(txtVerifyPassword, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnSend, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnVerify, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnReset, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnBackLogin, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(lblEmail, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(lblPass, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(lblVerifyPass, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(lblVerify, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(60, 60, 60))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtUsername, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(lblUserName, javax.swing.GroupLayout.PREFERRED_SIZE, 18, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtEmail, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(lblEmail, javax.swing.GroupLayout.PREFERRED_SIZE, 18, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(17, 17, 17)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(txtVerify, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                        .addComponent(lblBell, javax.swing.GroupLayout.PREFERRED_SIZE, 17, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(lblTime)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(lblVerify, javax.swing.GroupLayout.PREFERRED_SIZE, 18, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(3, 3, 3)
                .addComponent(txtPassword, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(4, 4, 4)
                .addComponent(lblPass, javax.swing.GroupLayout.PREFERRED_SIZE, 18, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtVerifyPassword, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(lblVerifyPass, javax.swing.GroupLayout.PREFERRED_SIZE, 18, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(btnSend, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(btnVerify, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(btnReset, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(btnBackLogin, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(10, 10, 10))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void txtUsernameActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtUsernameActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtUsernameActionPerformed

    private void txtEmailActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtEmailActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtEmailActionPerformed

    private void txtVerifyPasswordActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtVerifyPasswordActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtVerifyPasswordActionPerformed

    Empolyee getForm() {
        Empolyee em = new Empolyee();
        em.setPassword(new String(txtVerifyPassword.getPassword()));
        em.setUsername(txtUsername.getText());
        return em;
    }
    private void btnSendActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSendActionPerformed
        // TODO add your handling code here:
        if (labelValidate.checkEmpty(lblUserName, txtUsername, "Không bỏ trống Username") == false) {
            return;
        } else if (labelValidate.checkEmpty(lblEmail, txtEmail, "Không bỏ trống Email") == false) {
            return;
        } else if (checkUser(txtUsername.getText()) == false) {
            MsgBox.labelAlert(lblUserName, txtUsername, "Không tồn tại User");
        } else if (labelValidate.checkEmail(lblEmail, txtEmail, "Email không hợp lệ") == false) {
            return;
        } else if (checkEmail(txtEmail.getText()) == false) {
            MsgBox.labelAlert(lblEmail, txtEmail, "Email không khớp với User");
        } else {
            sendCode();
            btnSend.setEnabled(false);
            btnVerify.setEnabled(true);
            txtVerify.setEnabled(true);
            lblBell.setVisible(true);
            countDown();
        }


    }//GEN-LAST:event_btnSendActionPerformed

    private void btnVerifyActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnVerifyActionPerformed
        // TODO add your handling code here:
//        new String(txtPassword.getPassword()).equals(new String(txtVerifyPassword.getPassword()))
        if (labelValidate.checkEmpty(lblVerify, txtVerify, "Không bỏ trống code verify") == false) {
            return;
        } else if (Integer.valueOf(txtVerify.getText()) == randomCode) {
//            this.remove(lblTime);
            lblTime.setText("");
            lblBell.hide();
            time.stop();
            txtPassword.setEnabled(true);
            txtVerifyPassword.setEnabled(true);
            btnVerify.setEnabled(false);
            lblBell.setIcon(null);
            btnReset.setEnabled(true);
        } else {
            MsgBox.labelAlert(lblVerify, txtVerify, "code verify không hợp lệ");
        }
    }//GEN-LAST:event_btnVerifyActionPerformed

    private void btnResetActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnResetActionPerformed
        // TODO add your handling code here:
        if (labelValidate.checkEmpty(lblPass, txtPassword, "Không bỏ trông mật khẩu") == false) {
            return;
        } else if (new String(txtPassword.getPassword()).equals(new String(txtVerifyPassword.getPassword()))) {
            Empolyee em = getForm();
            emDao.updatePassword(em);
            MsgBox.alert(this, "Lấy lại mật khẩu thành công");
//                this.dispose();
//                new Login().setVisible(true);

        } else {
            MsgBox.labelAlert(lblVerifyPass, txtVerifyPassword, "Mật khẩu không khớp");
        }
    }//GEN-LAST:event_btnResetActionPerformed

    private void txtUsernameFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtUsernameFocusGained
        // TODO add your handling code here:
        lblUserName.setText("");
    }//GEN-LAST:event_txtUsernameFocusGained

    private void txtEmailFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtEmailFocusGained
        // TODO add your handling code here:
        lblEmail.setText("");
    }//GEN-LAST:event_txtEmailFocusGained

    private void txtVerifyFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtVerifyFocusGained
        // TODO add your handling code here:
        lblVerify.setText("");
    }//GEN-LAST:event_txtVerifyFocusGained

    private void btnBackLoginActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBackLoginActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnBackLoginActionPerformed

    private void txtPasswordFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtPasswordFocusGained
        // TODO add your handling code here:
        lblPass.setText("");
    }//GEN-LAST:event_txtPasswordFocusGained

    private void txtVerifyPasswordFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtVerifyPasswordFocusGained
        // TODO add your handling code here:
        lblVerifyPass.setText("");
    }//GEN-LAST:event_txtVerifyPasswordFocusGained


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.raven.suportSwing.MyButton btnBackLogin;
    private com.raven.suportSwing.MyButton btnReset;
    private com.raven.suportSwing.MyButton btnSend;
    private com.raven.suportSwing.MyButton btnVerify;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel lblBell;
    private javax.swing.JLabel lblEmail;
    private javax.swing.JLabel lblPass;
    private javax.swing.JLabel lblTime;
    private javax.swing.JLabel lblUserName;
    private javax.swing.JLabel lblVerify;
    private javax.swing.JLabel lblVerifyPass;
    private com.raven.suportSwing.TextField txtEmail;
    private com.raven.suportSwing.PasswordField txtPassword;
    private com.raven.suportSwing.TextField txtUsername;
    private com.raven.suportSwing.TextField txtVerify;
    private com.raven.suportSwing.PasswordField txtVerifyPassword;
    // End of variables declaration//GEN-END:variables
}