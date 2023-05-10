/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raven.form;

import com.ptithcm.DAO.InvoiceImportDAO;
import com.ptithcm.DAO.SupplierDao;
import com.ptithcm.entity.InvoiceImport;
import com.ptithcm.entity.InvoiceSell;
import com.ptithcm.entity.ProductItem;
import com.ptithcm.entity.Supplier;
import com.ptithcm.entity.User;
import com.ptithcm.utils.Excel;
import com.ptithcm.utils.MsgBox;
import com.ptithcm.utils.XDate;
import com.raven.JFrame.FormDetailInvoice;
import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.Date;

import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.table.DefaultTableModel;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.spi.LoggerFactoryBinder;

/**
 *
 * @author ducit
 */
public class FormInvoiceImportProducts extends javax.swing.JPanel {

    /**
     * Creates new form FormItems
     */
    public FormInvoiceImportProducts() {
        initComponents();
        setOpaque(false);
        fillPagination();
        lblSearchId.setVisible(false);

    }
    InvoiceImportDAO invoiceDAO = new InvoiceImportDAO();
    DefaultTableModel model;

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    int page = 1;
    int rowCountPerPage = 5;
    int totalPage = 1;
    Integer totalData = 0;
    boolean flag = false;

    Locale lc = new Locale("nv", "VN");
    NumberFormat nf = NumberFormat.getInstance(lc);

    public void edit() {
        if (page == 1) {
            btnFirst.setEnabled(false);
            btnBack.setEnabled(false);
        } else {
            btnFirst.setEnabled(true);
            btnBack.setEnabled(true);
        }

        if (page == totalPage) {
            btnLast.setEnabled(false);
            btnNext.setEnabled(false);
        } else {
            btnLast.setEnabled(true);
            btnNext.setEnabled(true);
        }

        if (page > totalPage) {
            page = 1;
        }
    }

    public void fillPagination() {
        totalData = invoiceDAO.totalPage("");
        rowCountPerPage = Integer.valueOf(cbbPagination.getSelectedItem().toString());
        Double totalPageD = Math.ceil(totalData.doubleValue() / rowCountPerPage);
        totalPage = totalPageD.intValue();

        edit();
        model = (DefaultTableModel) tableInvoice.getModel();
        model.setRowCount(0);

        List<InvoiceImport> list = invoiceDAO.pagingPage(page, rowCountPerPage, "");
        SupplierDao sDao = new SupplierDao();
        List<Supplier> listS = sDao.selectAll();
        String phone = "";
        for (InvoiceImport i : list) {
            Float total = invoiceDAO.getTotalMoney(i.getId());
            for (int j = 0; j < listS.size(); j++) {
                if (i.getIdSupplier() == listS.get(j).getIdSupplier()) {
                    phone = listS.get(j).getPhoneNumber();
                }
            }
            model.addRow(new Object[]{
                i.getId(), i.getNameUser(), i.getNameSupplier(), phone, i.getDateCreate(), nf.format(total) +" đ", i.getDesc()
            });
        }
        lblCount.setText("Page " + page + " for " + totalPage);

    }

    public void searchDateFillTable() {
        totalData = invoiceDAO.totalPage(txtDate.getText());
        rowCountPerPage = Integer.valueOf(cbbPagination.getSelectedItem().toString());
        Double totalPageD = Math.ceil(totalData.doubleValue() / rowCountPerPage);
        totalPage = totalPageD.intValue();
        edit();
        model = (DefaultTableModel) tableInvoice.getModel();
        model.setRowCount(0);
        List<InvoiceImport> list = invoiceDAO.pagingPage(page, rowCountPerPage, txtDate.getText());
        SupplierDao sDao = new SupplierDao();
        List<Supplier> listS = sDao.selectAll();
        String phone = "";
        for (InvoiceImport i : list) {
            Float total = invoiceDAO.getTotalMoney(i.getId());
            for (int j = 0; j < listS.size(); j++) {
                if (i.getIdSupplier() == listS.get(j).getIdSupplier()) {
                    phone = listS.get(j).getPhoneNumber();
                }
            }
            model.addRow(new Object[]{
                i.getId(), i.getNameUser(), i.getNameSupplier(), phone, i.getDateCreate(), nf.format(total) +" đ", i.getDesc()
            });
        }
        lblCount.setText("Page " + page + " for " + totalPage);
    }

    public void fillSearch() {
        if (txtSearchId.getText().trim().equals("")) {
            return;
        }
        model = (DefaultTableModel) tableInvoice.getModel();
        model.setRowCount(0);
        int id = Integer.parseInt(txtSearchId.getText());
        InvoiceImport in = invoiceDAO.selectById(id);
        if (in == null) {
            lblSearchId.setVisible(true);
            lblSearchId.setText("Không có mặt hàng có bằng " + id);
            return;
        }
        SupplierDao sDao = new SupplierDao();
        List<Supplier> listS = sDao.selectAll();
        String phone = "";
        for (int i = 0; i < listS.size(); i++) {
            if (in.getIdSupplier() == listS.get(i).getIdSupplier()) {
                phone = listS.get(i).getPhoneNumber();
            }
        }
        Float total = invoiceDAO.getTotalMoney(in.getId());
        model.addRow(new Object[]{
            in.getId(), in.getNameUser(), in.getNameSupplier(), phone, in.getDateCreate(), total, in.getDesc()
        });
        lblSearchId.setText("");
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        dateChooser1 = new com.raven.datechooser.DateChooser();
        jPanel1 = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        txtSearchId = new com.raven.suportSwing.TextField();
        btnSearchId = new com.raven.suportSwing.MyButton();
        myButton6 = new com.raven.suportSwing.MyButton();
        jPanel3 = new javax.swing.JPanel();
        txtDate = new com.raven.suportSwing.TextField();
        btnSearch = new com.raven.suportSwing.MyButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        tableInvoice = new com.raven.suportSwing.TableColumn();
        btnReset = new com.raven.suportSwing.MyButton();
        cbbPagination = new javax.swing.JComboBox<>();
        btnBack = new javax.swing.JButton();
        btnFirst = new javax.swing.JButton();
        btnNext = new javax.swing.JButton();
        btnLast = new javax.swing.JButton();
        lblCount = new javax.swing.JLabel();
        scrollBarCustom1 = new com.raven.suportSwing.ScrollBarCustom();
        lblSearchId = new javax.swing.JLabel();

        dateChooser1.setDateFormat("yyyy-MM-dd");
        dateChooser1.setTextRefernce(txtDate);

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));

        jPanel2.setBackground(new java.awt.Color(255, 255, 255));

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel1.setText("Hoá Đơn Nhập Hàng");

        txtSearchId.setLabelText("Tìm theo mã phiếu nhập");
        txtSearchId.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txtSearchIdFocusGained(evt);
            }
        });

        btnSearchId.setText("Tìm");
        btnSearchId.setRadius(20);
        btnSearchId.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSearchIdActionPerformed(evt);
            }
        });

        myButton6.setText("Xuất");
        myButton6.setRadius(20);
        myButton6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                myButton6ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 163, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(29, 29, 29)
                .addComponent(txtSearchId, javax.swing.GroupLayout.PREFERRED_SIZE, 304, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(57, 57, 57)
                .addComponent(btnSearchId, javax.swing.GroupLayout.PREFERRED_SIZE, 64, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 467, Short.MAX_VALUE)
                .addComponent(myButton6, javax.swing.GroupLayout.PREFERRED_SIZE, 64, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(txtSearchId, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnSearchId, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(myButton6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        jPanel3.setBackground(new java.awt.Color(255, 255, 255));

        txtDate.setLabelText("Thời gian");

        btnSearch.setText("Lọc");
        btnSearch.setRadius(20);
        btnSearch.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSearchActionPerformed(evt);
            }
        });

        jScrollPane1.setVerticalScrollBar(scrollBarCustom1);

        tableInvoice.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Mã hoá đơn", "Người Nhập", "Nguồn hàng", "SDT", "Ngày", "Tổng tiền", "Ghi Chú"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tableInvoice.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tableInvoiceMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tableInvoice);
        if (tableInvoice.getColumnModel().getColumnCount() > 0) {
            tableInvoice.getColumnModel().getColumn(0).setResizable(false);
            tableInvoice.getColumnModel().getColumn(1).setResizable(false);
            tableInvoice.getColumnModel().getColumn(2).setResizable(false);
            tableInvoice.getColumnModel().getColumn(3).setResizable(false);
            tableInvoice.getColumnModel().getColumn(4).setResizable(false);
            tableInvoice.getColumnModel().getColumn(5).setResizable(false);
            tableInvoice.getColumnModel().getColumn(6).setResizable(false);
        }

        btnReset.setText("Reset");
        btnReset.setRadius(20);
        btnReset.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnResetActionPerformed(evt);
            }
        });

        cbbPagination.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "5", "10", "15", "20", "25", "30" }));
        cbbPagination.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                cbbPaginationItemStateChanged(evt);
            }
        });

        btnBack.setText("<");
        btnBack.setToolTipText("");
        btnBack.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBackActionPerformed(evt);
            }
        });

        btnFirst.setText("<<");
        btnFirst.setToolTipText("");
        btnFirst.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnFirstActionPerformed(evt);
            }
        });

        btnNext.setText(">");
        btnNext.setToolTipText("");
        btnNext.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnNextActionPerformed(evt);
            }
        });

        btnLast.setText(">>");
        btnLast.setToolTipText("");
        btnLast.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLastActionPerformed(evt);
            }
        });

        lblCount.setText("jLabel2");

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(btnSearch, javax.swing.GroupLayout.PREFERRED_SIZE, 64, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(btnReset, javax.swing.GroupLayout.PREFERRED_SIZE, 64, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(btnFirst)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnBack)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(cbbPagination, javax.swing.GroupLayout.PREFERRED_SIZE, 52, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnNext)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnLast))
                    .addComponent(txtDate, javax.swing.GroupLayout.PREFERRED_SIZE, 251, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblCount, javax.swing.GroupLayout.PREFERRED_SIZE, 79, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 1126, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(scrollBarCustom1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGap(27, 27, 27)
                        .addComponent(txtDate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(btnSearch, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(btnReset, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(95, 95, 95)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(btnBack)
                            .addComponent(cbbPagination, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(btnNext)
                            .addComponent(btnLast)
                            .addComponent(btnFirst))
                        .addGap(34, 34, 34)
                        .addComponent(lblCount))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 625, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGap(51, 51, 51)
                        .addComponent(scrollBarCustom1, javax.swing.GroupLayout.PREFERRED_SIZE, 577, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        lblSearchId.setForeground(new java.awt.Color(225, 0, 0));
        lblSearchId.setText("jLabel2");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(214, 214, 214)
                        .addComponent(lblSearchId, javax.swing.GroupLayout.PREFERRED_SIZE, 256, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(0, 0, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(1, 1, 1)
                .addComponent(lblSearchId)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
    }// </editor-fold>//GEN-END:initComponents

    private void btnSearchIdActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSearchIdActionPerformed
        fillSearch();
    }//GEN-LAST:event_btnSearchIdActionPerformed

    public void excelInvoice() throws IOException {
        Excel.outExcel((DefaultTableModel) tableInvoice.getModel());
        MsgBox.alert(this, "Xuất file thành công");
    }
    private void myButton6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_myButton6ActionPerformed
        // TODO add your handling code here:
        try {
            excelInvoice();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }//GEN-LAST:event_myButton6ActionPerformed

    private void btnSearchActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSearchActionPerformed
        searchDateFillTable();
        flag = true;
    }//GEN-LAST:event_btnSearchActionPerformed

    private void tableInvoiceMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tableInvoiceMouseClicked
        if (evt.getClickCount() == 2) {
            int row = tableInvoice.getSelectedRow();
            int id = (int) tableInvoice.getValueAt(row, 0);
            String totalMoney = (String) tableInvoice.getValueAt(row, 5);
            new FormDetailInvoice(id, totalMoney, (DefaultTableModel) tableInvoice.getModel(), tableInvoice.getSelectedRow()).setVisible(true);
        }
    }//GEN-LAST:event_tableInvoiceMouseClicked

    private void btnResetActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnResetActionPerformed
        fillPagination();
        flag = false;
    }//GEN-LAST:event_btnResetActionPerformed

    private void txtSearchIdFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtSearchIdFocusGained
        lblSearchId.setVisible(false);
    }//GEN-LAST:event_txtSearchIdFocusGained

    private void cbbPaginationItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_cbbPaginationItemStateChanged
        if (flag) {
            searchDateFillTable();
            return;
        }
        fillPagination();
    }//GEN-LAST:event_cbbPaginationItemStateChanged

    private void btnNextActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnNextActionPerformed
        page++;
        if (flag) {
            searchDateFillTable();
            return;
        }
        fillPagination();
    }//GEN-LAST:event_btnNextActionPerformed

    private void btnBackActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBackActionPerformed
        page--;
        if (flag) {
            searchDateFillTable();
            return;
        }
        fillPagination();
    }//GEN-LAST:event_btnBackActionPerformed

    private void btnFirstActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnFirstActionPerformed
        page = 1;
        if (flag) {
            searchDateFillTable();
            return;
        }
        fillPagination();
    }//GEN-LAST:event_btnFirstActionPerformed

    private void btnLastActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLastActionPerformed
        page = totalPage;
        if (flag) {
            searchDateFillTable();
            return;
        }
        fillPagination();
    }//GEN-LAST:event_btnLastActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnBack;
    private javax.swing.JButton btnFirst;
    private javax.swing.JButton btnLast;
    private javax.swing.JButton btnNext;
    private com.raven.suportSwing.MyButton btnReset;
    private com.raven.suportSwing.MyButton btnSearch;
    private com.raven.suportSwing.MyButton btnSearchId;
    private javax.swing.JComboBox<String> cbbPagination;
    private com.raven.datechooser.DateChooser dateChooser1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JLabel lblCount;
    private javax.swing.JLabel lblSearchId;
    private com.raven.suportSwing.MyButton myButton6;
    private com.raven.suportSwing.ScrollBarCustom scrollBarCustom1;
    private com.raven.suportSwing.TableColumn tableInvoice;
    private com.raven.suportSwing.TextField txtDate;
    private com.raven.suportSwing.TextField txtSearchId;
    // End of variables declaration//GEN-END:variables
}
