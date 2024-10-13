<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmClubMembership
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.grpType = New System.Windows.Forms.GroupBox()
        Me.radSenior = New System.Windows.Forms.RadioButton()
        Me.radStudent = New System.Windows.Forms.RadioButton()
        Me.radChild = New System.Windows.Forms.RadioButton()
        Me.radAdult = New System.Windows.Forms.RadioButton()
        Me.grpOptions = New System.Windows.Forms.GroupBox()
        Me.chkTrainer = New System.Windows.Forms.CheckBox()
        Me.chkKarate = New System.Windows.Forms.CheckBox()
        Me.chkYoga = New System.Windows.Forms.CheckBox()
        Me.grpDuration = New System.Windows.Forms.GroupBox()
        Me.txtMoNo = New System.Windows.Forms.TextBox()
        Me.lblMoNo = New System.Windows.Forms.Label()
        Me.grpFees = New System.Windows.Forms.GroupBox()
        Me.lblTotal = New System.Windows.Forms.Label()
        Me.lblMonthlyRate = New System.Windows.Forms.Label()
        Me.lblTotalHead = New System.Windows.Forms.Label()
        Me.lblMonthlyHead = New System.Windows.Forms.Label()
        Me.btnCalc = New System.Windows.Forms.Button()
        Me.btnClr = New System.Windows.Forms.Button()
        Me.btnExit = New System.Windows.Forms.Button()
        Me.grpType.SuspendLayout()
        Me.grpOptions.SuspendLayout()
        Me.grpDuration.SuspendLayout()
        Me.grpFees.SuspendLayout()
        Me.SuspendLayout()
        '
        'grpType
        '
        Me.grpType.Controls.Add(Me.radSenior)
        Me.grpType.Controls.Add(Me.radStudent)
        Me.grpType.Controls.Add(Me.radChild)
        Me.grpType.Controls.Add(Me.radAdult)
        Me.grpType.Location = New System.Drawing.Point(12, 23)
        Me.grpType.Name = "grpType"
        Me.grpType.Size = New System.Drawing.Size(200, 110)
        Me.grpType.TabIndex = 0
        Me.grpType.TabStop = False
        Me.grpType.Text = "Type of Membership"
        '
        'radSenior
        '
        Me.radSenior.AutoSize = True
        Me.radSenior.Location = New System.Drawing.Point(11, 83)
        Me.radSenior.Name = "radSenior"
        Me.radSenior.Size = New System.Drawing.Size(89, 17)
        Me.radSenior.TabIndex = 3
        Me.radSenior.TabStop = True
        Me.radSenior.Text = "Se&nior Citizen"
        Me.radSenior.UseVisualStyleBackColor = True
        '
        'radStudent
        '
        Me.radStudent.AutoSize = True
        Me.radStudent.Location = New System.Drawing.Point(11, 61)
        Me.radStudent.Name = "radStudent"
        Me.radStudent.Size = New System.Drawing.Size(62, 17)
        Me.radStudent.TabIndex = 2
        Me.radStudent.TabStop = True
        Me.radStudent.Text = "&Student"
        Me.radStudent.UseVisualStyleBackColor = True
        '
        'radChild
        '
        Me.radChild.AutoSize = True
        Me.radChild.Location = New System.Drawing.Point(11, 38)
        Me.radChild.Name = "radChild"
        Me.radChild.Size = New System.Drawing.Size(108, 17)
        Me.radChild.TabIndex = 1
        Me.radChild.TabStop = True
        Me.radChild.Text = "Chil&d (12 && under)"
        Me.radChild.UseVisualStyleBackColor = True
        '
        'radAdult
        '
        Me.radAdult.AutoSize = True
        Me.radAdult.Location = New System.Drawing.Point(11, 15)
        Me.radAdult.Name = "radAdult"
        Me.radAdult.Size = New System.Drawing.Size(95, 17)
        Me.radAdult.TabIndex = 0
        Me.radAdult.TabStop = True
        Me.radAdult.Text = "Standard &Adult"
        Me.radAdult.UseVisualStyleBackColor = True
        '
        'grpOptions
        '
        Me.grpOptions.Controls.Add(Me.chkTrainer)
        Me.grpOptions.Controls.Add(Me.chkKarate)
        Me.grpOptions.Controls.Add(Me.chkYoga)
        Me.grpOptions.Location = New System.Drawing.Point(244, 23)
        Me.grpOptions.Name = "grpOptions"
        Me.grpOptions.Size = New System.Drawing.Size(200, 110)
        Me.grpOptions.TabIndex = 0
        Me.grpOptions.TabStop = False
        Me.grpOptions.Text = "Options"
        '
        'chkTrainer
        '
        Me.chkTrainer.AutoSize = True
        Me.chkTrainer.Location = New System.Drawing.Point(22, 83)
        Me.chkTrainer.Name = "chkTrainer"
        Me.chkTrainer.Size = New System.Drawing.Size(103, 17)
        Me.chkTrainer.TabIndex = 2
        Me.chkTrainer.Text = "&Personal Trainer"
        Me.chkTrainer.UseVisualStyleBackColor = True
        '
        'chkKarate
        '
        Me.chkKarate.AutoSize = True
        Me.chkKarate.Location = New System.Drawing.Point(22, 51)
        Me.chkKarate.Name = "chkKarate"
        Me.chkKarate.Size = New System.Drawing.Size(57, 17)
        Me.chkKarate.TabIndex = 1
        Me.chkKarate.Text = "&Karate"
        Me.chkKarate.UseVisualStyleBackColor = True
        '
        'chkYoga
        '
        Me.chkYoga.AutoSize = True
        Me.chkYoga.Location = New System.Drawing.Point(22, 19)
        Me.chkYoga.Name = "chkYoga"
        Me.chkYoga.Size = New System.Drawing.Size(51, 17)
        Me.chkYoga.TabIndex = 0
        Me.chkYoga.Text = "&Yoga"
        Me.chkYoga.UseVisualStyleBackColor = True
        '
        'grpDuration
        '
        Me.grpDuration.Controls.Add(Me.txtMoNo)
        Me.grpDuration.Controls.Add(Me.lblMoNo)
        Me.grpDuration.Location = New System.Drawing.Point(12, 167)
        Me.grpDuration.Name = "grpDuration"
        Me.grpDuration.Size = New System.Drawing.Size(200, 100)
        Me.grpDuration.TabIndex = 0
        Me.grpDuration.TabStop = False
        Me.grpDuration.Text = "Membership Length"
        '
        'txtMoNo
        '
        Me.txtMoNo.Location = New System.Drawing.Point(34, 59)
        Me.txtMoNo.Name = "txtMoNo"
        Me.txtMoNo.Size = New System.Drawing.Size(100, 20)
        Me.txtMoNo.TabIndex = 1
        '
        'lblMoNo
        '
        Me.lblMoNo.AutoSize = True
        Me.lblMoNo.Location = New System.Drawing.Point(17, 24)
        Me.lblMoNo.Name = "lblMoNo"
        Me.lblMoNo.Size = New System.Drawing.Size(143, 13)
        Me.lblMoNo.TabIndex = 0
        Me.lblMoNo.Text = "Enter the Number of Months:"
        '
        'grpFees
        '
        Me.grpFees.Controls.Add(Me.lblTotal)
        Me.grpFees.Controls.Add(Me.lblMonthlyRate)
        Me.grpFees.Controls.Add(Me.lblTotalHead)
        Me.grpFees.Controls.Add(Me.lblMonthlyHead)
        Me.grpFees.Location = New System.Drawing.Point(244, 167)
        Me.grpFees.Name = "grpFees"
        Me.grpFees.Size = New System.Drawing.Size(200, 100)
        Me.grpFees.TabIndex = 0
        Me.grpFees.TabStop = False
        Me.grpFees.Text = "Membership Fees"
        '
        'lblTotal
        '
        Me.lblTotal.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblTotal.Location = New System.Drawing.Point(100, 61)
        Me.lblTotal.Name = "lblTotal"
        Me.lblTotal.Size = New System.Drawing.Size(100, 23)
        Me.lblTotal.TabIndex = 3
        '
        'lblMonthlyRate
        '
        Me.lblMonthlyRate.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblMonthlyRate.Location = New System.Drawing.Point(98, 34)
        Me.lblMonthlyRate.Name = "lblMonthlyRate"
        Me.lblMonthlyRate.Size = New System.Drawing.Size(100, 23)
        Me.lblMonthlyRate.TabIndex = 2
        '
        'lblTotalHead
        '
        Me.lblTotalHead.AutoSize = True
        Me.lblTotalHead.Location = New System.Drawing.Point(19, 66)
        Me.lblTotalHead.Name = "lblTotalHead"
        Me.lblTotalHead.Size = New System.Drawing.Size(31, 13)
        Me.lblTotalHead.TabIndex = 1
        Me.lblTotalHead.Text = "Total"
        '
        'lblMonthlyHead
        '
        Me.lblMonthlyHead.AutoSize = True
        Me.lblMonthlyHead.Location = New System.Drawing.Point(19, 35)
        Me.lblMonthlyHead.Name = "lblMonthlyHead"
        Me.lblMonthlyHead.Size = New System.Drawing.Size(73, 13)
        Me.lblMonthlyHead.TabIndex = 0
        Me.lblMonthlyHead.Text = "Monthly Fees:"
        '
        'btnCalc
        '
        Me.btnCalc.Location = New System.Drawing.Point(86, 325)
        Me.btnCalc.Name = "btnCalc"
        Me.btnCalc.Size = New System.Drawing.Size(75, 23)
        Me.btnCalc.TabIndex = 1
        Me.btnCalc.Text = "&Calculate"
        Me.btnCalc.UseVisualStyleBackColor = True
        '
        'btnClr
        '
        Me.btnClr.Location = New System.Drawing.Point(192, 325)
        Me.btnClr.Name = "btnClr"
        Me.btnClr.Size = New System.Drawing.Size(75, 23)
        Me.btnClr.TabIndex = 2
        Me.btnClr.Text = "Clea&r"
        Me.btnClr.UseVisualStyleBackColor = True
        '
        'btnExit
        '
        Me.btnExit.Location = New System.Drawing.Point(306, 325)
        Me.btnExit.Name = "btnExit"
        Me.btnExit.Size = New System.Drawing.Size(75, 23)
        Me.btnExit.TabIndex = 3
        Me.btnExit.Text = "E&xit"
        Me.btnExit.UseVisualStyleBackColor = True
        '
        'frmClubMembership
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(489, 398)
        Me.Controls.Add(Me.btnExit)
        Me.Controls.Add(Me.btnClr)
        Me.Controls.Add(Me.btnCalc)
        Me.Controls.Add(Me.grpOptions)
        Me.Controls.Add(Me.grpDuration)
        Me.Controls.Add(Me.grpFees)
        Me.Controls.Add(Me.grpType)
        Me.Name = "frmClubMembership"
        Me.Text = "Membership Fee Calculator"
        Me.grpType.ResumeLayout(False)
        Me.grpType.PerformLayout()
        Me.grpOptions.ResumeLayout(False)
        Me.grpOptions.PerformLayout()
        Me.grpDuration.ResumeLayout(False)
        Me.grpDuration.PerformLayout()
        Me.grpFees.ResumeLayout(False)
        Me.grpFees.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents grpType As System.Windows.Forms.GroupBox
    Friend WithEvents radSenior As System.Windows.Forms.RadioButton
    Friend WithEvents radStudent As System.Windows.Forms.RadioButton
    Friend WithEvents radChild As System.Windows.Forms.RadioButton
    Friend WithEvents radAdult As System.Windows.Forms.RadioButton
    Friend WithEvents grpOptions As System.Windows.Forms.GroupBox
    Friend WithEvents chkTrainer As System.Windows.Forms.CheckBox
    Friend WithEvents chkKarate As System.Windows.Forms.CheckBox
    Friend WithEvents chkYoga As System.Windows.Forms.CheckBox
    Friend WithEvents grpDuration As System.Windows.Forms.GroupBox
    Friend WithEvents txtMoNo As System.Windows.Forms.TextBox
    Friend WithEvents lblMoNo As System.Windows.Forms.Label
    Friend WithEvents grpFees As System.Windows.Forms.GroupBox
    Friend WithEvents lblTotal As System.Windows.Forms.Label
    Friend WithEvents lblMonthlyRate As System.Windows.Forms.Label
    Friend WithEvents lblTotalHead As System.Windows.Forms.Label
    Friend WithEvents lblMonthlyHead As System.Windows.Forms.Label
    Friend WithEvents btnCalc As System.Windows.Forms.Button
    Friend WithEvents btnClr As System.Windows.Forms.Button
    Friend WithEvents btnExit As System.Windows.Forms.Button

End Class
